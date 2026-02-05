Param(
    [Parameter(Mandatory=$False)]
    [string]$Root = ".\docs"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $Root)) { Write-Error "Path '$Root' not found."; exit }

$files = Get-ChildItem -Path $Root -Filter "*.md" -Recurse
Write-Host "Found $($files.Count) markdown files..." -ForegroundColor Cyan

$nl = [Environment]::NewLine

foreach ($file in $files) {
    Write-Host "Processing: $($file.Name)" -NoNewline

    try {
        # 1. Читаем файл
        $raw = Get-Content -Path $file.FullName -Encoding UTF8 -Raw
        
        # --- РАЗБИВКА (Header / Body / Footer) ---
        $header = ""
        $body = $raw
        $footer = ""

        # YAML Front Matter
        if ($raw.StartsWith("---")) {
            $endHead = $raw.IndexOf("---", 3)
            if ($endHead -gt 0) {
                $header = $raw.Substring(0, $endHead + 3)
                $body = $raw.Substring($endHead + 3)
            }
        }

        # Data Appendix (scenarios)
        $splitToken = "scenarios:" 
        $startData = $body.IndexOf($splitToken)
        if ($startData -gt 0) {
            $footer = $body.Substring($startData)
            $body = $body.Substring(0, $startData)
        }

        # --- ОБРАБОТКА ТЕКСТА ---

        # Чистка мусора
        $body = $body -replace '\*\(\s*Продолжение\s*\)\*', '' 
        $body = $body -replace '\(Продолжение\)', ''
        $body = $body -replace '- - ', '- ' 
        $body = $body -replace '\\n', '<br>' 

        # --- ИСПРАВЛЕНИЕ СТРУКТУРЫ ---
        
        $repl = '$1' + $nl + $nl + '$2'

        # 1. Сцены (Где, POV...)
        $sceneKeys = "Где|POV|Задача|Измеримое|Артефакт|Выход|Крючок|SCENE-ID"
        $pat = "([^\r\n])\s+(- ($sceneKeys):)"
        $body = [regex]::Replace($body, $pat, $repl)

        # 2. Логические цепочки (Стрелки)
        $body = [regex]::Replace($body, 'CAUSE\s*(\x2192|→)\s*MECHANISM', 'CAUSE → MECHANISM')
        $body = [regex]::Replace($body, 'MECHANISM\s*(\x2192|→)\s*CONSEQUENCE', 'MECHANISM → CONSEQUENCE')
        $pat = "([^\r\n])\s+(\*\*?CAUSE → MECHANISM → CONSEQUENCE\*\*?)"
        $body = [regex]::Replace($body, $pat, $repl)

        # 3. Теги в списках (Ищем "- [TAG]" как единое целое)
        $tags = "FACT|ASSUMPTION|PROJECTION|UNKNOWN|DECISION|CONSTRAINT|CANON DECISION|CANON CONSTRAINT"
        $pat = "([^\r\n])\s+(- \[($tags)\])"
        $body = [regex]::Replace($body, $pat, $repl)

        # 4. Теги без списков (в квадратных скобках в начале)
        $pat = "([^\r\n])\s+(\[($tags)\])"
        $body = [regex]::Replace($body, $pat, $repl)

        # УДАЛЕНО: Блок принудительного переноса жирных заголовков.
        # Теперь жирный текст остается там, где он был.

        # --- ССЫЛКИ ---
        $body = [regex]::Replace($body, '\[\[(\d+)\]\]', '[$1]')
        $body = [regex]::Replace($body, '<(https?:\/\/[^>]+)>', '$1')

        # --- UNWRAPPING (СКЛЕИВАНИЕ СТРОК) ---
        $body = $body -replace "\r\n", $nl
        $tokenPara = "___PARA___"
        $tokenKeep = "___KEEP___"

        # Защищаем абзацы (двойной перенос)
        $body = [regex]::Replace($body, '\n\s*\n', $tokenPara)

        # Защищаем структуру ОТ СКЛЕИВАНИЯ
        # Добавлена защита для **, чтобы если заголовок БЫЛ на новой строке, он там и остался.
        # Но если он внутри строки, он не перенесется.
        $patStruct = '(\n)(?=\s*(#|- |\* |\d+\.|>|\||\[|\*\*))'
        $body = [regex]::Replace($body, $patStruct, $tokenKeep)

        # Склеиваем одиночные переносы
        $body = $body -replace '\n', ' '
        $body = [regex]::Replace($body, ' {2,}', ' ')

        # Восстанавливаем
        $body = $body -replace $tokenPara, ($nl + $nl)
        $body = $body -replace $tokenKeep, $nl

        # --- ФУТЕР (YAML) ---
        if ($footer.Length -gt 0) {
            $footer = [regex]::Replace($footer, '\[\[(\d+)\]\]', '[$1]')
            $footer = [regex]::Replace($footer, '<(https?:\/\/[^>]+)>', '$1')
            
            $cleanFooter = $footer.Trim()
            $footer = $nl + $nl + '## Data Appendix' + $nl + $nl + '```yaml' + $nl + $cleanFooter + $nl + '```'
        }

        # --- СОХРАНЕНИЕ ---
        $finalContent = $header + $body + $footer
        [System.IO.File]::WriteAllText($file.FullName, $finalContent, [System.Text.Encoding]::UTF8)

        Write-Host " [FIXED]" -ForegroundColor Green
    }
    catch {
        Write-Host " [ERROR]" -ForegroundColor Red
        Write-Error $_
    }
}

Write-Host "Done." -ForegroundColor Cyan