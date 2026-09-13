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

En electromagnetisme, plusieurs potentiels peuvent representer le meme champ physique. Une transformation de jauge s'ecrit

$$A_\mu \longrightarrow A_\mu + \partial_\mu\Lambda,$$

et laisse invariant le tenseur

$$F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu.$$

Toutes les variables d'une theorie ne representent donc pas necessairement des degres de liberte physiques. Certaines sont des redondances mathematiques ; les observables doivent etre independantes de ces redondances.

## 6. La connaissance physique est limitee par l'information accessible

En mecanique quantique, les observables position et quantite de mouvement obeissent a

$$[\hat{x},\hat{p}] = i\hbar,$$

ce qui implique

$$\Delta x\,\Delta p \geq \frac{\hbar}{2}.$$

Ce n'est pas une simple limitation instrumentale. La structure des etats quantiques ne permet pas de donner simultanement une position et une quantite de mouvement parfaitement definies.

En mecanique classique, on peut idealement decrire un etat par $(x,p)$. En mecanique quantique, un etat est represente par un vecteur $|\psi\rangle$, et une mesure de l'observable $A$ fournit des resultats avec des probabilites determinees par la regle de Born, par exemple

$$P(a) = |\langle a|\psi\rangle|^2.$$

La theorie ne fournit donc pas necessairement une valeur preexistante pour chaque propriete. Elle permet de calculer des probabilites conditionnelles du type $P(\text{resultat}\mid\text{preparation})$.

## 7. Un principe operationnel et informationnel

On peut proposer qu'une theorie physique distingue ce qui est physiquement different de ce qui ne differe que dans la description. Une propriete physique a un contenu experimental si elle peut, au moins en principe, etre reliee a une procedure de preparation ou de mesure.

Cette formulation s'inspire de l'approche operationnelle, sans impliquer que la conscience creerait la realite. La mecanique quantique n'exige pas cette interpretation.

## 8. Le cadre de validite des theories

Une theorie plus generale doit retrouver les predictions d'une theorie etablie dans le domaine ou celle-ci fonctionne. La limite classique de la mecanique quantique depend notamment du regime d'action, de la decoherence et des observables considerees. La limite newtonienne de la relativite generale exige un champ faible, $GM/(rc^2) \ll 1$, et des vitesses faibles devant $c$, $v \ll c$.

On peut ainsi voir les theories comme une hierarchie de descriptions, dans laquelle une theorie plus fondamentale contient une theorie effective comme approximation dans un domaine determine.

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
