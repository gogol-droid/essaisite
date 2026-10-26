# Exemple : trajectoire d'un satellite dans un champ gravitationnel

Ce document est un complément de travail pour la page de mécanique classique. Il présente le problème de Kepler dans l'approximation où la masse centrale $M$ est fixe. On pourra ensuite remplacer cette approximation par le problème exact à deux corps, qui fait intervenir la masse réduite.

## Position et base polaire

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

## Vitesse et accélération

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

## Deuxième loi de Newton

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

## Changer la variable indépendante : de $t$ à $\theta$

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

## Forme de la trajectoire

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

## Relier la forme à l'énergie

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

## Portée de l'approximation

Ici, le centre de force est supposé fixe. Pour deux masses comparables, les deux corps se déplacent autour de leur centre de masse. Le problème se ramène alors à une équation de même forme en remplaçant $M$ par la masse totale $M+m$ dans le paramètre gravitationnel, et en décrivant le mouvement relatif ; la masse réduite intervient dans l'énergie et le moment cinétique du mouvement relatif. Cette généralisation pourra faire l'objet d'un complément séparé.
