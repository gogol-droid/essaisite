$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$pagesPath = Join-Path $root "pages"
$introPath = Join-Path $root "textes\intro.md"

function Convert-Paragraph([string]$text) {
  $latexBlocks = [Collections.Generic.List[string]]::new()
  $protected = [Regex]::Replace($text, '\$\$.+?\$\$|\$.+?\$', {
    param($m)
    $latexBlocks.Add($m.Value)
    return "___LATEX$($latexBlocks.Count-1)___"
  })

  $encoded = [System.Net.WebUtility]::HtmlEncode($protected.Trim())
  $encoded = [Regex]::Replace($encoded, "\*\*(.+?)\*\*", "<strong>`$1</strong>")

  for ($i = 0; $i -lt $latexBlocks.Count; $i++) {
    $encoded = $encoded.Replace("___LATEX${i}___", $latexBlocks[$i])
  }

  return "<p>$encoded</p>"
}

function Convert-Markdown([string]$content) {
  $result = [Collections.Generic.List[string]]::new()
  $paragraph = [Collections.Generic.List[string]]::new()

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

if (-not (Test-Path -LiteralPath $introPath -PathType Leaf)) {
  throw "Texte introuvable : $introPath"
}
$intro = Convert-Markdown (Get-Content -Raw -LiteralPath $introPath)

$entries = Get-ChildItem -LiteralPath $pagesPath -Filter "*.html" -File |
  Sort-Object Name |
  ForEach-Object {
    $content = Get-Content -Raw -LiteralPath $_.FullName
    if ($content -notmatch "<h1[^>]*>\s*(?<title>.*?)\s*</h1>") {
      throw "La page $($_.Name) doit contenir un titre h1."
    }
    [PSCustomObject]@{
      Title = [System.Net.WebUtility]::HtmlDecode($Matches.title)
      Url = "pages/$($_.Name)"
    }
  }
$links = ($entries | ForEach-Object {
  $title = [System.Net.WebUtility]::HtmlEncode($_.Title)
  "            <li><a href=`"$($_.Url)`">$title</a></li>"
}) -join "`n"
$count = $entries.Count

$output = @"
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Une page locale pour organiser des ressources de physique.">
    <title>Toute la Physique</title>
    <link rel="stylesheet" href="styles.css">
    <script>
      window.MathJax = {
        tex: { inlineMath: [['`$','`$'], ['\\(','\\)']], displayMath: [['`$`$','`$`$'], ['\\[','\\]']] },
        svg: { fontCache: 'global' }
      };
    </script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
  </head>
  <body>
    <header class="site-header">
      <div class="container">
        <p class="eyebrow">Carnet d'exploration</p>
        <h1>Toute la Physique</h1>
        <p class="intro">Un point de départ simple pour classer des cours, des images et des programmes.</p>
      </div>
    </header>
    <main class="container">
      <section class="panel intro-content" aria-labelledby="intro-title">
        <p class="eyebrow">Point de départ</p>
        <h2 id="intro-title">Avant de commencer</h2>
        $intro
      </section>
      <section class="panel" aria-labelledby="topics-title">
        <div class="section-heading">
          <div><p class="eyebrow">Les domaines</p><h2 id="topics-title">Pages de physique</h2></div>
          <span class="count">$count liens</span>
        </div>
        <ul class="link-list">
$links
        </ul>
      </section>
      <section class="resource-grid" aria-label="Ressources">
        <article class="panel resource-card">
          <p class="eyebrow">À regarder</p><h2>Photos et schémas</h2>
          <p>Quelques sources d'images libres pour illustrer les pages.</p>
          <ul class="resource-list">
            <li><a href="https://commons.wikimedia.org/wiki/Category:Physics" target="_blank" rel="noopener noreferrer">Photos de physique sur Wikimedia Commons</a></li>
            <li><a href="https://commons.wikimedia.org/wiki/Category:Physics_diagrams" target="_blank" rel="noopener noreferrer">Schémas scientifiques</a></li>
          </ul>
        </article>
        <article class="panel resource-card">
          <p class="eyebrow">À expérimenter</p><h2>Programmes</h2>
          <p>Des outils externes à découvrir, sans installer quoi que ce soit ici.</p>
          <ul class="resource-list">
            <li><a href="https://phet.colorado.edu/fr/simulations/filter?subjects=physics" target="_blank" rel="noopener noreferrer">Simulations PhET</a></li>
            <li><a href="https://www.scilab.org/" target="_blank" rel="noopener noreferrer">Scilab</a></li>
          </ul>
        </article>
      </section>
    </main>
    <footer class="site-footer"><div class="container"><p>Version locale — la liste des pages est lue dans le dossier pages.</p></div></footer>
  </body>
</html>
"@
[IO.File]::WriteAllText((Join-Path $root "index.html"), $output, [Text.UTF8Encoding]::new($false))
Write-Host "Index généré depuis les pages HTML présentes dans le dossier pages."
