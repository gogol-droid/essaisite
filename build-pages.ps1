$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

$pages = @(
  @{ Page = "mecanique-classique-exemples-calculs.html"; Title = "Exemple de mouvement à force centrale"; Text = "MecaniqueClassique_Gravitation.md"; Parent = "mecanique-classique.html"; ParentTitle = "Mécanique classique"; Index = $false },
  @{ Page = "mecanique-classique-exemples-oscillateur.html"; Title = "Oscillateur harmonique : oscillations libres et forcées"; Text = "MecaniqueClassique_Oscillateur.md"; Parent = "mecanique-classique.html"; ParentTitle = "Mécanique classique"; Index = $false },
  @{ Page = "mecanique-classique.html"; Title = "Mécanique classique"; Text = "MecaniqueClassique.md"; Photo = "illustMecaClass.png"; Width = 437; Height = 497 },
  @{ Page = "thermodynamique-classique.html"; Title = "Thermodynamique classique"; Text = "Thermodynamique.md"; Photo = "illustThermoClass.png"; Width = 446; Height = 431 },
  @{ Page = "thermodynamique-statistique.html"; Title = "Thermodynamique statistique"; Text = "ThermodynamiqueStatistique.md"; Photo = "illustThermoStat.png"; Width = 567; Height = 802 },
  @{ Page = "thermodynamique-statistique-exemples-potentiel.html"; Title = "Potentiel chimique et équilibre thermodynamique"; Text = "ThermoStat_potentielchimique.md"; Parent = "thermodynamique-statistique.html"; ParentTitle = "Thermodynamique statistique"; Index = $false; Eyebrow = "Approfondissement" },
  @{ Page = "mecanique-quantique.html"; Title = "Mécanique quantique"; Text = "MecaniqueQuantique.md"; Photo = "illustMecaQ.png"; Width = 1125; Height = 630 },
  @{ Page = "electromagnetisme.html"; Title = "Électromagnétisme"; Text = "Electromag.md"; Photo = "illustElectromag.png"; Width = 818; Height = 630 },
  @{ Page = "relativite-restreinte.html"; Title = "Relativité restreinte"; Text = "Relativite.md"; Photo = "illustRelatRest.png"; Width = 832; Height = 682 },
  @{ Page = "relativite-generale.html"; Title = "Relativité générale"; Text = "RelativiteGen.md"; Photo = "IllustRelatGen.png"; Width = 700; Height = 487 },
  @{ Page = "optique.html"; Title = "Optique"; Text = "Optique.md"; Photo = "illustOptic.png"; Width = 4032; Height = 3024 },
  @{ Page = "physique-des-particules.html"; Title = "Physique des particules"; Text = "PhysParticule.md"; Photo = "illustPhysParticule.png"; Width = 612; Height = 582 },
  @{ Page = "mecanique-des-fluides.html"; Title = "Mécanique des fluides"; Text = "Mecafluide.md"; Photo = "Mecafluide.png"; Width = 1060; Height = 790 }
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

  $pageLinks = [Collections.Generic.List[string]]::new()
  $encoded = [Regex]::Replace($encoded, '\[(?<label>[^\]]+)\]\((?<path>[^)]+\.html)\)', {
    param($m)
    $route = $m.Groups["path"].Value
    $page = $pages | Where-Object { $_.Page.Replace("\", "/") -eq $route } | Select-Object -First 1
    if ($page) {
      $href = $route
    } elseif ($route -match '^progjava[\\/](?<fileName>[a-z0-9._-]+\.html)$') {
      $fileName = $Matches.fileName
      $programPath = Join-Path $root "progjava\$fileName"
      if (-not (Test-Path -LiteralPath $programPath -PathType Leaf)) {
        throw "Programme mentionné mais introuvable : $programPath"
      }
      $href = "../progjava/$fileName"
    } else {
      throw "Lien vers une page introuvable : $route"
    }
    $pageLinks.Add("<a href=`"$href`">$($m.Groups["label"].Value)</a>")
    return "___PAGELINK$($pageLinks.Count-1)___"
  })

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
    $formula = $latexBlocks[$i].Replace("<", "&lt;").Replace(">", "&gt;")
    $encoded = $encoded.Replace("___LATEX${i}___", $formula)
  }
  for ($i = 0; $i -lt $pageLinks.Count; $i++) {
    $encoded = $encoded.Replace("___PAGELINK${i}___", $pageLinks[$i])
  }

  return "<p>$encoded</p>"
}

function Convert-Markdown([string]$content) {
  $result = [Collections.Generic.List[string]]::new()
  $paragraph = [Collections.Generic.List[string]]::new()
  $listItems = [Collections.Generic.List[string]]::new()
  $content = [Regex]::Replace($content, '\\([#*_{}\[\]().])', {
    param($m)
    $m.Groups[1].Value
  })
  $lines = $content -split "`r?`n"

  function Write-Paragraph {
    if ($paragraph.Count -eq 0) { return }
    $result.Add((Convert-Paragraph ($paragraph -join " ")))
    $paragraph.Clear()
  }

  function Write-List {
    if ($listItems.Count -eq 0) { return }
    $items = foreach ($item in $listItems) {
      "<li>$((Convert-Paragraph $item) -replace '^<p>|</p>$', '')</li>"
    }
    $result.Add("<ul>`n$($items -join "`n")`n</ul>")
    $listItems.Clear()
  }

  function Convert-TableRow([string]$line) {
    return @($line.Trim().Trim('|').Split('|') | ForEach-Object { $_.Trim() })
  }

  for ($lineIndex = 0; $lineIndex -lt $lines.Count; $lineIndex++) {
    $line = $lines[$lineIndex]
    if (
      $line -match '^\s*\|.+\|\s*$' -and
      $lineIndex + 1 -lt $lines.Count -and
      $lines[$lineIndex + 1] -match '^\s*\|[\s:|-]+\|\s*$'
    ) {
      $headers = @(Convert-TableRow $line)
      $separators = @(Convert-TableRow $lines[$lineIndex + 1])
      if ($headers.Count -ne $separators.Count -or @($separators | Where-Object { $_ -notmatch '^:?-{3,}:?$' }).Count -gt 0) {
        throw "Séparateur de tableau Markdown invalide à la ligne $($lineIndex + 2)."
      }

      Write-List
      Write-Paragraph
      $tableHtml = [Collections.Generic.List[string]]::new()
      $tableHtml.Add('<div class="table-scroll" role="region" aria-label="Tableau" tabindex="0">')
      $tableHtml.Add('<table><thead><tr>')
      foreach ($header in $headers) {
        $tableHtml.Add("<th scope=`"col`">$((Convert-Paragraph $header) -replace '^<p>|</p>$', '')</th>")
      }
      $tableHtml.Add('</tr></thead><tbody>')

      $lineIndex += 2
      while ($lineIndex -lt $lines.Count -and $lines[$lineIndex] -match '^\s*\|.+\|\s*$') {
        $cells = @(Convert-TableRow $lines[$lineIndex])
        if ($cells.Count -ne $headers.Count) {
          throw "Nombre de cellules incorrect dans le tableau Markdown à la ligne $($lineIndex + 1)."
        }
        $tableHtml.Add('<tr>')
        foreach ($cell in $cells) {
          $tableHtml.Add("<td>$((Convert-Paragraph $cell) -replace '^<p>|</p>$', '')</td>")
        }
        $tableHtml.Add('</tr>')
        $lineIndex++
      }
      $lineIndex--
      $tableHtml.Add('</tbody></table></div>')
      $result.Add(($tableHtml -join "`n"))
      continue
    }

    $imageMatch = [Regex]::Match($line.Trim(), '^!\[(?<alt>[^\]]+)\]\((?<path>\.\./photos/(?<file>[A-Za-z0-9._-]+\.png))\)$')
    if ($imageMatch.Success) {
      Write-List
      Write-Paragraph
      $imagePath = Join-Path $root "photos\$($imageMatch.Groups["file"].Value)"
      if (-not (Test-Path -LiteralPath $imagePath -PathType Leaf)) {
        throw "Image mentionnée mais introuvable : $imagePath"
      }
      $alt = [System.Net.WebUtility]::HtmlEncode($imageMatch.Groups["alt"].Value)
      $path = $imageMatch.Groups["path"].Value
      $result.Add("<figure class=`"topic-figure`"><img class=`"topic-image`" src=`"$path`" alt=`"$alt`" loading=`"lazy`"><figcaption>$alt</figcaption></figure>")
    } elseif ($line -match "^\s*-\s+(.+?)\s*$") {
      Write-Paragraph
      $listItems.Add($Matches[1])
    } elseif ($line -match "^\s*#{1,3}\s*$") {
      Write-List
      Write-Paragraph
    } elseif ($line -match "^\s*(#{1,3})\s+(.+?)\s*$") {
      Write-List
      Write-Paragraph
      $level = [Math]::Min($Matches[1].Length + 1, 6)
      $heading = [System.Net.WebUtility]::HtmlEncode($Matches[2].Trim("* ").Trim())
      # On ne doit pas encoder le LaTeX dans les titres non plus
      $result.Add("<h$level>$heading</h$level>")
    } elseif ([string]::IsNullOrWhiteSpace($line)) {
      Write-Paragraph
    } else {
      Write-List
      $paragraph.Add($line.Trim())
    }
  }
  Write-List
  Write-Paragraph
  return ($result -join "`n")
}

foreach ($entry in $pages) {
  $title = [System.Net.WebUtility]::HtmlEncode($entry.Title)
  $pagePath = Join-Path $root "pages\$($entry.Page)"
  $pageDirectory = Split-Path -Parent $pagePath
  if (-not (Test-Path -LiteralPath $pageDirectory -PathType Container)) {
    New-Item -ItemType Directory -Path $pageDirectory -Force | Out-Null
  }
  $relativeRoot = "../" * (($entry.Page -split "[\\/]").Count)
  $stylesheet = "${relativeRoot}styles.css"
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
          <img class="topic-image" src="${relativeRoot}photos/$($entry.Photo)" width="$($entry.Width)" height="$($entry.Height)" alt="Illustration de $title" loading="lazy">
          <figcaption>Illustration de $title.</figcaption>
        </figure>
"@
  }
  $returnHref = "../index.html"
  $returnTitle = "Toute la Physique"
  if ($entry.Parent) {
    $returnHref = $entry.Parent
    $returnTitle = $entry.ParentTitle
  }
  $returnTitle = [System.Net.WebUtility]::HtmlEncode($returnTitle)
  $eyebrow = "Domaine de physique"
  if ($entry.Eyebrow) {
    $eyebrow = $entry.Eyebrow
  } elseif ($entry.Parent) {
    $eyebrow = "Exemple de calcul"
  }
  $indexMetadata = ""
  if ($entry.Index -eq $false) {
    $indexMetadata = "`n    <meta name=`"site-index`" content=`"false`">"
  }
  $output = @"
<!doctype html>
<html lang="fr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' https://cdn.jsdelivr.net 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self' https://cdn.jsdelivr.net; connect-src 'self'; base-uri 'none'">$indexMetadata
    <title>$title — Toute la Physique</title>
    <link rel="stylesheet" href="$stylesheet">
    <script>
      window.MathJax = {
        tex: { inlineMath: [['`$','`$'], ['\\(','\\)']], displayMath: [['`$`$','`$`$'], ['\\[','\\]']] },
        svg: { fontCache: 'global' }
      };
    </script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3.2.2/es5/tex-mml-chtml.js"></script>
  </head>
  <body>
    <main class="container">
      <section class="panel topic-page">
        <p class="eyebrow">$eyebrow</p>
        <h1>$title</h1>
        $media
        <div class="topic-content">$content</div>
        <p><a href="$returnHref">← Retour à $returnTitle</a></p>
      </section>
    </main>
  </body>
</html>
"@
  [IO.File]::WriteAllText($pagePath, $output, [Text.UTF8Encoding]::new($false))
}

Write-Host "Pages générées depuis les fichiers textes/*.md avec support LaTeX."
