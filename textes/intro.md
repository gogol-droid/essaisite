# Quelques principes

Il est tentant de commencer la physique par des lois particulières : Newton, Maxwell ou Schrödinger. On peut aussi partir d'une question plus générale : qu'exige-t-on d'une description physique du monde ?

Une description physique devrait distinguer :

**ce qui ne dépend pas de nos conventions de description**, ce qui conduit aux symétries et aux invariances ;

**ce qui doit être commun à des observateurs physiquement équivalents**, ce qui conduit aux principes de relativité et d'équivalence ;

**ce qui peut être relié à une expérience**, ce qui conduit aux principes opérationnels et informationnels.

## 1. La physique ne doit pas dépendre de conventions arbitraires

Supposons que je décrive un système avec des coordonnées, puis que je change de coordonnées. Je n'ai pas changé le système physique. Une transformation qui ne change pas la situation physique ne doit donc pas changer les prédictions physiques.

Il faut distinguer les transformations qui changent réellement le système de celles qui ne changent que sa description. Cette distinction devient fondamentale en relativité et en théorie des jauges.

Si je fais tourner ou déplace tout mon laboratoire, les lois fondamentales ne doivent pas changer. De même, une expérience réalisée aujourd'hui ou demain dans les mêmes conditions doit obéir aux mêmes lois. On parle respectivement d'invariance par rotation, de translation spatiale et de translation temporelle.

## 2. Emmy Noether et les lois de conservation

Le théorème de Noether établit que, sous des hypothèses précises, toute symétrie continue de l'action est associée à une quantité conservée. Pour une action

$$S = \int L(q, \dot{q}, t)\,dt,$$

une invariance par translation temporelle est associée à la conservation de l'énergie, une invariance par translation spatiale à celle de la quantité de mouvement, et une invariance par rotation à celle du moment cinétique.

La charge électrique est associée à la symétrie globale $U(1)$ de la théorie électromagnétique. Il faut distinguer cette symétrie globale de l'invariance de jauge locale, qui exprime notamment une redondance de description du potentiel électromagnétique.

## 3. Relativité : les descriptions doivent être compatibles

Selon Einstein, la description d'un phénomène peut dépendre de l'observateur, mais les descriptions d'un même phénomène doivent pouvoir être reliées sans contradiction. Pour deux observateurs inertiels, le groupe de Lorentz transforme les coordonnées tout en préservant l'intervalle, avec la convention de signature choisie ici :

$$ds^2 = c^2\,dt^2 - dx^2 - dy^2 - dz^2.$$

Ce ne sont donc ni $t$, ni $x$, ni la vitesse qui sont invariants séparément. C'est la structure de l'espace-temps et, notamment, l'intervalle entre deux événements.

En relativité générale, le principe d'équivalence affirme localement qu'un observateur en chute libre ne peut pas distinguer, par une expérience suffisamment petite, la gravitation d'une accélération appropriée. La gravitation est alors décrite par la géométrie de l'espace-temps :

$$G_{\mu\nu} = \frac{8\pi G}{c^4}\,T_{\mu\nu}.$$

La distribution de matière et d'énergie détermine la géométrie, et la géométrie détermine le mouvement libre.

## 4. Les lois doivent respecter la causalité

Les interactions fondamentales peuvent être formulées à partir de champs définis localement dans l'espace-temps. Au lieu de dire qu'une particule agit instantanément sur une autre, on introduit par exemple un champ $\phi(x,t)$.

La relativité restreinte impose une structure causale : aucune influence permettant de transmettre une information ne peut se propager plus vite que la lumière dans le vide. La mécanique quantique ajoute toutefois des corrélations non locales, comme l'intrication, sans permettre pour autant une communication supraluminique.

## 5. La physique doit distinguer la description de la réalité

En électromagnétisme, plusieurs potentiels peuvent représenter le même champ physique. Une transformation de jauge s'écrit

$$A_\mu \longrightarrow A_\mu + \partial_\mu\Lambda,$$

et laisse invariant le tenseur

$$F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu.$$

Toutes les variables d'une théorie ne représentent donc pas nécessairement des degrés de liberté physiques. Certaines sont des redondances mathématiques ; les observables doivent être indépendantes de ces redondances.

## 6. La connaissance physique est limitee par l'information accessible

En mécanique quantique, les observables position et quantité de mouvement obéissent à

$$[\hat{x},\hat{p}] = i\hbar,$$

ce qui implique

$$\Delta x\,\Delta p \geq \frac{\hbar}{2}.$$

Ce n'est pas une simple limitation instrumentale. La structure des états quantiques ne permet pas de donner simultanément une position et une quantité de mouvement parfaitement définies.

En mécanique classique, on peut idéalement décrire un état par $(x,p)$. En mécanique quantique, un état est représenté par un vecteur $|\psi\rangle$, et une mesure de l'observable $A$ fournit des résultats avec des probabilités déterminées par la règle de Born, par exemple

$$P(a) = |\langle a|\psi\rangle|^2.$$

La théorie ne fournit donc pas nécessairement une valeur préexistante pour chaque propriété. Elle permet de calculer des probabilités conditionnelles du type $P(\text{résultat}\mid\text{préparation})$.

## 7. Un principe operationnel et informationnel

On peut proposer qu'une théorie physique distingue ce qui est physiquement différent de ce qui ne diffère que dans la description. Une propriété physique a un contenu expérimental si elle peut, au moins en principe, être reliée à une procédure de préparation ou de mesure.

Cette formulation s'inspire de l'approche opérationnelle, sans impliquer que la conscience créerait la réalité. La mécanique quantique n'exige pas cette interprétation.

## 8. Le cadre de validite des theories

Une théorie plus générale doit retrouver les prédictions d'une théorie établie dans le domaine où celle-ci fonctionne. La limite classique de la mécanique quantique dépend notamment du régime d'action, de la décohérence et des observables considérées. La limite newtonienne de la relativité générale exige un champ faible, $GM/(rc^2) \ll 1$, et des vitesses faibles devant $c$, $v \ll c$.

On peut ainsi voir les théories comme une hiérarchie de descriptions, dans laquelle une théorie plus fondamentale contient une théorie effective comme approximation dans un domaine déterminé.

### I — Realite experimentale

Une affirmation physique doit pouvoir, directement ou indirectement, etre reliee a une experience concevable.

### II — Invariance

Les predictions physiques ne doivent pas dependre des conventions arbitraires utilisees pour decrire le systeme.

### III — Relativite

Les observateurs appartenant a des classes physiquement equivalentes doivent disposer de lois compatibles entre elles.

### IV — Symetrie

Lorsqu'aucune experience pertinente ne distingue deux transformations, la theorie ne doit pas les distinguer sans raison physique.

### V — Localite et champs

Les interactions doivent pouvoir etre formulees a partir de structures physiques definies localement dans l'espace-temps, sous reserve des nuances apportees par les correlations quantiques.

### VI — Causalite

Les effets physiques doivent respecter la structure causale de l'espace-temps.

### VII — Jauge

La description peut posseder des degres de liberte redondants ; les observables physiques doivent etre invariantes sous les transformations de jauge.

### VIII — Principe quantique

Les resultats des experiences sont decrits par des amplitudes et des probabilites. Deux observables incompatibles sont caracterisees par une non-commutation, $[A,B] \neq 0$, tandis que $[A,B]=0$ exprime leur compatibilite dans le cadre considere.

### IX — Information

La theorie doit distinguer l'etat physique, la preparation experimentale et l'information accessible par une mesure. Cette question conduit notamment a l'etude de l'intrication, des inegalites de Bell, de la cryptographie quantique et de la theorie quantique de l'information.

### X — Correspondance

Toute theorie plus generale doit retrouver les theories etablies dans leurs domaines de validite.
