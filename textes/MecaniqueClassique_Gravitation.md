Ce complément détaille le calcul d'une orbite gravitationnelle. On commence par le cas où la masse centrale est fixe, puis on traite le problème exact à deux corps. Dans ce second cas, les deux objets se déplacent autour de leur centre d'inertie et le mouvement relatif s'écrit avec la masse réduite.

# Position et base polaire

On place la masse centrale à l'origine $O$. Le satellite, de masse $m$, est au point $P$. Dans le plan de son mouvement, sa position s'écrit

$$
\overrightarrow{OP}=r\,\vec e_r,
$$

où $r$ est la distance au centre et $\vec e_r$ le vecteur unitaire radial. On note $\vec e_\theta$ le vecteur unitaire perpendiculaire à $\vec e_r$, orienté dans le sens croissant de l'angle polaire $\theta$.

La base tourne avec le satellite. Ses dérivées sont

$$
\frac{d\vec e_r}{dt}=\dot\theta\,\vec e_\theta,
\qquad
\frac{d\vec e_\theta}{dt}=-\dot\theta\,\vec e_r.
$$

Il faut tenir compte de ces dérivées lorsqu'on dérive le vecteur position.

# Vitesse et accélération

En dérivant $\overrightarrow{OP}=r\vec e_r$, on obtient la vitesse :

$$
\vec v=\frac{d\overrightarrow{OP}}{dt}
=\dot r\,\vec e_r+r\dot\theta\,\vec e_\theta.
$$

Une nouvelle dérivation donne l'accélération :

$$
\vec a=(\ddot r-r\dot\theta^2)\,\vec e_r
+(r\ddot\theta+2\dot r\dot\theta)\,\vec e_\theta.
$$

Le terme $-r\dot\theta^2$ est l'accélération radiale associée au changement de direction du mouvement. Le terme $2\dot r\dot\theta$ apparaît parce que la distance et la base polaire varient toutes deux avec le temps.

# Deuxième loi de Newton

La force gravitationnelle exercée par la masse centrale est dirigée vers $O$ :

$$
\vec F=-\frac{GMm}{r^2}\,\vec e_r.
$$

La deuxième loi de Newton, $m\vec a=\vec F$, donne séparément les équations radiale et angulaire :

$$
\ddot r-r\dot\theta^2=-\frac{GM}{r^2},
\qquad
r\ddot\theta+2\dot r\dot\theta=0.
$$

La masse $m$ du satellite se simplifie : dans cette approximation, elle ne change pas la trajectoire suivie pour des conditions initiales données.

L'équation angulaire se réécrit

$$
\frac{d}{dt}(r^2\dot\theta)=0.
$$

On définit donc la constante positive ou signée $C$ par

$$
r^2\dot\theta=C.
$$

Sa valeur absolue est le moment cinétique par unité de masse. Cette conservation exprime aussi la loi des aires : le rayon vecteur balaie des aires égales pendant des durées égales.

# Changer la variable indépendante : de $t$ à $\theta$

Pour décrire la forme de l'orbite, on cherche $r$ en fonction de $\theta$ plutôt qu'en fonction du temps. Comme $\dot\theta=C/r^2$, la règle de dérivation en chaîne donne, pour toute fonction $f(\theta)$,

$$
\frac{df}{dt}=\frac{C}{r^2}\frac{df}{d\theta}.
$$

On introduit ensuite la fonction inverse

$$
u(\theta)=\frac{1}{r(\theta)}.
$$

Dans les calculs qui suivent, une prime désigne une dérivée par rapport à $\theta$. Puisque $r=1/u$,

$$
\dot r=\frac{dr}{d\theta}\dot\theta=-C u',
\qquad
\ddot r=-C\dot\theta u''=-C^2u^2u''.
$$

On a également $r\dot\theta^2=C^2u^3$. En remplaçant ces expressions dans l'équation radiale, il vient

$$
-C^2u^2(u''+u)=-GMu^2,
$$

et, pour $C\ne0$,

$$
u''+u=\frac{GM}{C^2}.
$$

Cette transformation, appelée équation de Binet dans ce cas, a remplacé l'équation du mouvement temporel par une équation différentielle linéaire pour l'inverse du rayon.

# Forme de la trajectoire

La solution générale est

$$
u(\theta)=\frac{GM}{C^2}+A\cos(\theta-\theta_0),
$$

où $A$ et $\theta_0$ sont fixés par les conditions initiales. En posant $p=C^2/(GM)$ et en définissant l'excentricité $e=Ap$, on obtient l'équation polaire usuelle :

$$
r(\theta)=\frac{p}{1+e\cos(\theta-\theta_0)}.
$$

Le signe devant le cosinus peut être absorbé dans un décalage de $\pi$ de $\theta_0$. L'excentricité est prise positive. Pour $C\ne0$, les formes possibles sont :

- $e=0$ : un cercle ;
- $0<e<1$ : une ellipse ;
- $e=1$ : une parabole ;
- $e>1$ : une hyperbole.

Le foyer de la conique est en $O$. Une ellipse décrit une orbite fermée ; une parabole et une hyperbole décrivent des trajectoires de passage qui repartent vers l'infini.

# Relier la forme à l'énergie

L'énergie mécanique totale du satellite est conservée. En divisant par $m$, on définit l'énergie par unité de masse $\varepsilon$ :

$$
\varepsilon=\frac{E}{m}
=\frac{1}{2}(\dot r^2+r^2\dot\theta^2)-\frac{GM}{r}
=\frac{1}{2}\dot r^2+\frac{C^2}{2r^2}-\frac{GM}{r}.
$$

En combinant cette expression avec l'équation de l'orbite, on trouve

$$
e^2=1+\frac{2\varepsilon C^2}{(GM)^2}.
$$

Pour une orbite non circulaire et non radiale, le signe de l'énergie distingue les trois régimes :

- $\varepsilon<0$ correspond à $e<1$ : l'orbite est liée et elliptique (le cercle est le cas particulier $e=0$) ;
- $\varepsilon=0$ correspond à $e=1$ : c'est le cas limite parabolique, à la frontière entre orbite liée et trajectoire de passage ;
- $\varepsilon>0$ correspond à $e>1$ : le satellite n'est pas lié et suit une hyperbole.

La parabole représente donc exactement le seuil d'échappement : l'objet peut atteindre une distance arbitrairement grande avec une vitesse qui tend vers zéro. Une trajectoire radiale ($C=0$) est un cas dégénéré qui ne se décrit pas par le changement de variable $t\leftrightarrow\theta$ utilisé ici.

# Deux corps et centre d'inertie

Lorsque les deux masses ne sont pas supposées fixes, notons $m_1$ et $m_2$ leurs masses, et $\vec r_1$ et $\vec r_2$ leurs positions dans un référentiel galiléen. On définit la position du centre d'inertie $\vec R$ et le vecteur position relative $\vec r$ par

$$
\vec R=\frac{m_1\vec r_1+m_2\vec r_2}{m_1+m_2},
\qquad
\vec r=\vec r_2-\vec r_1.
$$

La distance entre les corps est $r=|\vec r|$. La gravitation est une interaction interne au système : les forces exercées par les deux corps sont opposées. En l'absence de force extérieure, le centre d'inertie suit donc un mouvement rectiligne uniforme, $\ddot{\vec R}=0$.

Pour isoler le mouvement relatif, on introduit la masse réduite

$$
\mu=\frac{m_1m_2}{m_1+m_2}.
$$

La force gravitationnelle sur le corps 2 est dirigée vers le corps 1. En soustrayant les équations de Newton des deux corps, on obtient l'équation du mouvement relatif :

$$
\mu\ddot{\vec r}
=-\frac{Gm_1m_2}{r^2}\,\vec e_r
=-\frac{Gm_1m_2}{r^3}\,\vec r.
$$

C'est l'équation d'une particule fictive de masse $\mu$, attirée par un centre fixe avec une force de même forme. En divisant par $\mu$, on voit que l'accélération relative dépend de la somme des masses :

$$
\ddot{\vec r}
=-\frac{G(m_1+m_2)}{r^2}\,\vec e_r.
$$

Ainsi, pour calculer la forme de l'orbite relative, on reprend les résultats précédents en remplaçant $GM$ par $G(m_1+m_2)$. En particulier, si $C=|\vec r\times\dot{\vec r}|$ est le moment cinétique relatif par unité de masse réduite, alors

$$
r(\theta)=\frac{p}{1+e\cos(\theta-\theta_0)},
\qquad
p=\frac{C^2}{G(m_1+m_2)}.
$$

La masse réduite apparaît explicitement dans l'énergie mécanique du mouvement relatif,

$$
E_{\mathrm{rel}}
=\frac{1}{2}\mu|\dot{\vec r}|^2-\frac{Gm_1m_2}{r}
=\mu\left(\frac{1}{2}|\dot{\vec r}|^2-\frac{G(m_1+m_2)}{r}\right).
$$

En posant $\varepsilon=E_{\mathrm{rel}}/\mu$, la relation entre énergie et excentricité prend la même forme que précédemment :

$$
e^2=1+\frac{2\varepsilon C^2}{G^2(m_1+m_2)^2}.
$$

Le mouvement relatif ne donne pas directement les trajectoires de chaque corps. Il faut revenir au centre d'inertie en inversant les définitions de $\vec R$ et $\vec r$ :

$$
\vec r_1=\vec R-\frac{m_2}{m_1+m_2}\,\vec r,
\qquad
\vec r_2=\vec R+\frac{m_1}{m_1+m_2}\,\vec r.
$$

Dans le référentiel du centre d'inertie, $\vec R=0$ : chaque corps décrit donc une conique autour de ce centre, avec la même période et la même excentricité que l'orbite relative. Leurs distances au centre d'inertie vérifient

$$
\frac{|\vec r_1|}{|\vec r_2|}=\frac{m_2}{m_1}.
$$

Le corps le plus massif décrit ainsi la plus petite orbite. Lorsque $m_1\gg m_2$, le centre d'inertie est très proche de $m_1$ et l'approximation d'un centre fixe utilisée au début devient pertinente.
