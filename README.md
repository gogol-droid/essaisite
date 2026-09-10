# Toute la Physique

Les pages sont statiques : chaque page indique explicitement les fichiers qu'elle utilise. Pour changer une illustration ou un texte, modifiez le fichier HTML de la page correspondante.

La liste de l'accueil est construite à partir des fichiers HTML présents dans `pages`. Pour ajouter ou retirer une page, ajoutez ou supprimez son fichier HTML, puis régénérez `index.html` :

```powershell
.\build-index.ps1
```

Le générateur récupère le titre de chaque page dans son premier élément `<h1>` et trie les pages par nom de fichier. Le lien « Ajouter un lien » a été retiré, car il ne modifiait que le stockage du navigateur et pas les fichiers du site.

## Ajouter une page à la main

Exemple : ajouter une page **Statodynamique** avec `textes/stato.md` et `photos/stato.png`.

1. Créez le fichier `textes/stato.md` et écrivez-y le contenu de la page en Markdown.
2. Copiez l'image dans `photos/stato.png`.
3. Copiez une page HTML existante, par exemple `pages/optique.html`, vers `pages/statodynamique.html`.
4. Dans `pages/statodynamique.html`, remplacez :
   - le titre `<title>` par `Statodynamique — Toute la Physique` ;
   - le titre `<h1>` par `Statodynamique` ;
   - le chemin de l'image par `../photos/stato.png` ;
   - le contenu de `<div class="topic-content">` par le HTML correspondant au fichier `textes/stato.md`.
5. Ajoutez l'association dans la liste `$pages` de `build-pages.ps1` :

   ```powershell
   @{ Page = "statodynamique.html"; Title = "Statodynamique"; Text = "stato.md"; Photo = "stato.png" }
   ```

6. Régénérez les pages et l'index :

   ```powershell
   .\build-pages.ps1
   .\build-index.ps1
   ```

L'index trouvera automatiquement `pages/statodynamique.html`, à condition que la page contienne un élément `<h1>`.

## Retirer une page

1. Supprimez l'association correspondante dans la liste `$pages` de `build-pages.ps1`.
2. Supprimez le fichier HTML dans `pages`, par exemple `pages/statodynamique.html`.
3. Supprimez éventuellement les fichiers devenus inutiles dans `textes` et `photos`.
4. Régénérez l'index :

   ```powershell
   .\build-index.ps1
   ```

L'ancien lien disparaîtra alors de la page d'accueil. Les fichiers Markdown, images et programmes ne sont pas supprimés automatiquement.

Les textes peuvent être écrits dans les fichiers Markdown du dossier `textes`. Après une modification, générez les pages avec :

```powershell
.\build-pages.ps1
```

Ce script ne surveille pas les fichiers et ne lance aucune mise à jour automatique. Il transforme les titres Markdown (`#`, `##`, `###`), les paragraphes et le gras en HTML.

### Formules LaTeX

Les formules doivent être écrites entre `$...$` pour une formule en ligne, ou entre `$$...$$` pour une formule centrée. Utilisez un seul antislash dans le fichier Markdown :

```text
$\vec{F} = m \vec{a}$
```

Le générateur accepte aussi les fichiers exportés par certains éditeurs qui contiennent `\\vec` et des caractères Markdown échappés comme `\#` ou `\*`. MarkText sert à rédiger les fichiers ; il ne suffit pas à lui seul pour afficher les formules dans le navigateur. Les pages chargent MathJax pour effectuer ce rendu.

Une mention explicite comme `progjava\brilouin.html` dans un fichier Markdown devient automatiquement un lien vers le fichier local correspondant. Le programme doit exister dans le dossier `progjava`.

Le programme Brilouin utilise une copie locale et versionnée de Chart.js dans `progjava/js/chart.umd.min.js`. Il ne dépend donc plus d'un CDN externe. Cette copie correspond à Chart.js 4.4.4 ; son empreinte SHA-256 est `B38076762F7363BC9E912B68B8E034826798DB5DF26BB61F000EC2E7A3137BC7`.

Associations actuelles :

- `pages/mecanique-classique.html` : `photos/illustMecaClass.png` et `textes/MecaniqueClassique.md`
- `pages/thermodynamique-classique.html` : `photos/illustThermoClass.png` et `textes/Thermodynamique.md`
- `pages/thermodynamique-statistique.html` : `photos/illustThermoStat.png` et `textes/Thermostat.md`
- `pages/mecanique-quantique.html` : `photos/illustMecaQ.png` et `textes/MecaniqueQuantique.md`
- `pages/electromagnetisme.html` : `photos/illustElectromag.png` et `textes/Electromag.md`
- `pages/relativite-restreinte.html` : `photos/illustRelatRest.png` et `textes/Relativite.md`
- `pages/relativite-generale.html` : `photos/IllustRelatGen.png` et `textes/RelativiteGen.md`
- `pages/optique.html` : `photos/illustOptic.png` et `textes/Optique.md`
- `pages/physique-des-particules.html` : `photos/illustPhysPartcle.png` et `textes/PhysPartcle.md`
- `pages/mecanique-des-fluides.html` : `photos/Mecafluide.png` et `textes/Mecafluide.md`
