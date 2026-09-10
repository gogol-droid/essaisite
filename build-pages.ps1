$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

$pages = @(
  @{ Page = "mecanique-classique.html"; Title = "Mécanique classique"; Text = "MecaniqueClassique.md"; Photo = "illustMecaClass.png" },
  @{ Page = "thermodynamique-classique.html"; Title = "Thermodynamique classique"; Text = "Thermodynamique.md"; Photo = "illustThermoClass.png" },
  @{ Page = "thermodynamique-statistique.html"; Title = "Thermodynamique statistique"; Text = "Thermostat.md"; Photo = "illustThermoStat.png" },
  @{ Page = "mecanique-quantique.html"; Title = "Mécanique quantique"; Text = "MecaniqueQuantique.md"; Photo = "illustMecaQ.png" },
  @{ Page = "electromagnetisme.html"; Title = "Électromagnétisme"; Text = "Electromag.md"; Photo = "illustElectromag.png" },
  @{ Page = "relativite-restreinte.html"; Title = "Relativité restreinte"; Text = "Relativite.md"; Photo = "illustRelatRest.png" },
  @{ Page = "relativite-generale.html"; Title = "Relativité générale"; Text = "RelativiteGen.md"; Photo = "IllustRelatGen.png" },
  @{ Page = "optique.html"; Title = "Optique"; Text = "Optique.md"; Photo = "illustOptic.png" },
  @{ Page = "physique-des-particules.html"; Title = "Physique des particules"; Text = "PhysPartcle.md"; Photo = "illustPhysPartcle.png" },
  @{ Page = "mecanique-des-fluides.html"; Title = "Mécanique des fluides"; Text = "Mecafluide.md"; Photo = "Mecafluide.png" }
)

function Convert-Paragraph([string]$text) {
  # 1. On protège les formules LaTeX avant tout encodage
  $latexBlocks = [Collections.Generic.List[string]]::new()
  $protected = [Regex]::Replace($text, '\$\$.+?\$\$|\$.+?\$', {
    param($m)
    $formula = [Regex]::Replace($m.Value, '\\\\', '\')
    $latexBlocks.Add($formula)
    return "___LATEX$($latexBlocks.Count-1)___"
  })

  $encoded = [System.Net.WebUtility]::HtmlEncode($protected.Trim())
  $encoded = [Regex]::Replace($encoded, "\*\*(.+?)\*\*", "<strong>`$1</strong>")

  # 2. Gestion des liens progjava (ton code d'origine)
  $programPattern = '(?i)(?:[a-z]:[\\/]+Users[\\/]+[^\\/\r\n]+[\\/]+(?:OneDrive[\\/]+Documents[\\/]+)?PagePerso[\\/]+)?progjava[\\/]+([a-z0-9._-]+\.html)'
  foreach ($match in [Regex]::Matches($text, $programPattern)) {
    $fileName = $match.Groups[1].Value
    $programPath = Join-Path $root "progjava\$fileName"
    if (-not (Test-Path -LiteralPath $programPath -PathType Leaf)) {
      throw "Programme mentionné mais introuvable : $programPath"
    }
    $encodedMention = [System.Net.WebUtility]::HtmlEncode($match.Value)
    $link = "<a href=`"../progjava/$fileName`">$fileName</a>"
    $encoded = $encoded.Replace($encodedMention, $link)
  }

  # 3. On restaure les formules LaTeX sans les encoder
  for ($i = 0; $i -lt $latexBlocks.Count; $i++) {
    $encoded = $encoded.Replace("___LATEX${i}___", $latexBlocks[$i])
  }

  return "<p>$encoded</p>"
}

function Convert-Markdown([string]$content) {
  $result = [Collections.Generic.List[string]]::new()
  $paragraph = [Collections.Generic.List[string]]::new()
  $content = [Regex]::Replace($content, '\\([#*_{}\[\]().])', {
    param($m)
    $m.Groups[1].Value
  })

  function Write-Paragraph {
    if ($paragraph.Count -eq 0) { return }
    $result.Add((Convert-Paragraph ($paragraph -join " ")))
    $paragraph.Clear()
  }

  foreach ($line in ($content -split "`r?`n")) {
    if ($line -match "^\s*#{1,3}\s*$") {
      Write-Paragraph
    } elseif ($line -match "^\s*(#{1,3})\s+(.+?)\s*$") {
      Write-Paragraph
      $level = [Math]::Min($Matches[1].Length + 1, 6)
      $heading = [System.Net.WebUtility]::HtmlEncode($Matches[2].Trim("* ").Trim())
      # On ne doit pas encoder le LaTeX dans les titres non plus
      $result.Add("<h$level>$heading</h$level>")
    } elseif ([string]::IsNullOrWhiteSpace($line)) {
      Write-Paragraph
    } else {
      $paragraph.Add($line.Trim())
    }
  }
  Write-Paragraph
  return ($result -join "`n")
}

foreach ($entry in $pages) {
  $title = [System.Net.WebUtility]::HtmlEncode($entry.Title)
  $content = "<p>Cette page est prête à accueillir un texte et une illustration.</p>"
  if ($entry.Text) {
    $textPath = Join-Path $root "textes\$($entry.Text)"
    if (-not (Test-Path -LiteralPath $textPath)) { throw "Texte introuvable : $textPath" }
    $content = Convert-Markdown (Get-Content -Raw -LiteralPath $textPath)
  }
  $media = ""
  if ($entry.Photo) {
    $photoPath = Join-Path $root "photos\$($entry.Photo)"
    if (-not (Test-Path -LiteralPath $photoPath)) { throw "Photo introuvable : $photoPath" }
    $media = @"
        <figure class="topic-figure">
          <img class="topic-image" src="../photos/$($entry.Photo)" alt="Illustration de $title">
          <figcaption>Illustration de $title.</figcaption>
        </figure>
"@
  }
  $output = @"
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>$title — Toute la Physique</title>
    <link rel="stylesheet" href="../styles.css">
    <script>
      window.MathJax = {
        tex: { inlineMath: [['`$','`$'], ['\\(','\\)']], displayMath: [['`$`$','`$`$'], ['\\[','\\]']] },
        svg: { fontCache: 'global' }
      };
    </script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
  </head>
  <body>
    <main class="container">
      <section class="panel topic-page">
        <p class="eyebrow">Domaine de physique</p>
        <h1>$title</h1>
        $media
        <div class="topic-content">$content</div>
        <p><a href="../index.html">← Retour à Toute la Physique</a></p>
      </section>
    </main>
  </body>
</html>
"@
  [IO.File]::WriteAllText((Join-Path $root "pages\$($entry.Page)"), $output, [Text.UTF8Encoding]::new($false))
}

Write-Host "Pages générées depuis les fichiers textes/*.md avec support LaTeX."