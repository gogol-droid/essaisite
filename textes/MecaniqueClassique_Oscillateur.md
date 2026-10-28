# Un modèle commun aux petites oscillations

Un même type d'équation décrit les petites oscillations de systèmes très différents. On commence par les oscillations libres, puis on étudie la réponse d'un oscillateur soumis à une force périodique et à un faible frottement.

## Oscillations libres : l'équation universelle

On note $x(t)$ le déplacement par rapport à une position d'équilibre stable. Si, près de cette position, la force de rappel est proportionnelle au déplacement et opposée à celui-ci, elle s'écrit $F=-Kx$, avec $K>0$. La deuxième loi de Newton conduit alors à

$$
m\frac{d^2x}{dt^2}=-Kx,
$$

soit

$$
\frac{d^2x}{dt^2}+\omega_0^2x=0,
\qquad \omega_0=\sqrt{\frac{K}{m}}.
$$

La grandeur $\omega_0$ est la pulsation propre, en radians par seconde. La fréquence ordinaire vaut $f_0=\omega_0/(2\pi)$.

La solution générale est

$$
x(t)=A\cos(\omega_0t)+B\sin(\omega_0t)
=X_0\cos(\omega_0t+\varphi),
$$

où l'amplitude $X_0$ et la phase $\varphi$ sont déterminées par la position et la vitesse initiales. En l'absence de frottement, l'oscillation se poursuit à amplitude constante.

## Trois systèmes, une même équation

### Masse attachée à un ressort

Pour un ressort idéal de raideur $k$, la loi de Hooke donne $F=-kx$. Ainsi,

$$
m\ddot x+kx=0,
\qquad \omega_0=\sqrt{\frac{k}{m}}.
$$

La masse et la raideur fixent la pulsation propre. La longueur au repos du ressort ne figure pas dans cette expression si $x$ est mesuré depuis la position d'équilibre.

### Pendule aux faibles oscillations

Considérons un pendule simple de longueur $L$ et de masse $m$. En notant $\theta$ l'angle à la verticale, le moment de la pesanteur donne

$$
\ddot\theta+\frac{g}{L}\sin\theta=0.
$$

Pour de petits angles exprimés en radians, $\sin\theta\simeq\theta$. L'équation devient alors

$$
\ddot\theta+\omega_0^2\theta=0,
\qquad \omega_0=\sqrt{\frac{g}{L}}.
$$

Le déplacement le long de l'arc est $x=L\theta$ ; il satisfait la même équation avec la même pulsation propre. Cette approximation cesse d'être précise lorsque l'amplitude angulaire devient grande.

### Un bouchon flottant qui monte et descend

On considère un bouchon qui flotte, maintenu verticalement, et on note $x$ son petit déplacement vertical vers le haut depuis l'équilibre. Si la section horizontale à la surface de l'eau est approximativement constante et vaut $S$, un déplacement vers le haut réduit le volume immergé de $Sx$. La variation de la poussée d'Archimède est donc une force de rappel $-\rho_{\mathrm{eau}}gSx$, où $\rho_{\mathrm{eau}}$ est la masse volumique de l'eau. Dans le modèle simple où l'on néglige la résistance et le mouvement entraîné de l'eau,

$$
m\ddot x+\rho_{\mathrm{eau}}gSx=0,
\qquad \omega_0=\sqrt{\frac{\rho_{\mathrm{eau}}gS}{m}}.
$$

La forme de l'équation est encore la même. Pour une mesure précise, il faudrait notamment tenir compte de la forme réelle du bouchon, de la résistance de l'eau et de la masse d'eau entraînée avec lui.

Ces exemples partagent donc l'équation $\ddot x+\omega_0^2x=0$, même si la force de rappel et la valeur de $\omega_0$ ont des origines différentes. C'est cette structure commune qui définit l'oscillateur harmonique.

## Oscillations forcées avec frottement

Un oscillateur réel perd généralement de l'énergie. On modélise ici un faible frottement visqueux par une force $F_{\mathrm{f}}=-\alpha\dot x$, avec $\alpha>0$. On applique en même temps une force sinusoïdale $F_{\mathrm{ext}}=F_0\cos(\omega t)$, de pulsation $\omega$. Pour une masse-ressort, la deuxième loi de Newton s'écrit

$$
m\ddot x+\alpha\dot x+kx=F_0\cos(\omega t).
$$

En divisant par $m$ et en posant $\omega_0^2=k/m$ et $2\gamma=\alpha/m$, on obtient

$$
\ddot x+2\gamma\dot x+\omega_0^2x=\frac{F_0}{m}\cos(\omega t).
$$

La solution comporte un régime transitoire, qui décroît à cause du frottement, et un régime permanent à la pulsation imposée $\omega$. Après disparition du transitoire, on peut écrire

$$
x(t)=X(\omega)\cos(\omega t-\delta),
$$

où $X(\omega)$ est l'amplitude du régime permanent et $\delta$ le déphasage par rapport à la force. En injectant cette forme dans l'équation (ou en séparant les composantes en cosinus et sinus), on trouve

$$
X(\omega)=\frac{F_0/m}{\sqrt{(\omega_0^2-\omega^2)^2+(2\gamma\omega)^2}},
\qquad
\tan\delta=\frac{2\gamma\omega}{\omega_0^2-\omega^2}.
$$

## La courbe de résonance : l'amplitude au carré

La quantité qui dépend seulement de la pulsation d'excitation est l'amplitude au carré $X^2(\omega)$, et non le déplacement instantané $x(t)^2$, qui oscille aussi au cours du temps. À partir de l'expression de l'amplitude,

$$
X^2(\omega)=\frac{(F_0/m)^2}{(\omega_0^2-\omega^2)^2+4\gamma^2\omega^2}
=\frac{(F_0/m)^2}{(\omega_0^2-\omega^2)^2+(\alpha\omega/m)^2}.
$$

Cette fonction est positive. À fréquence nulle, l'oscillateur se comporte comme un ressort déformé par une force constante et $X(0)=F_0/k$. À haute fréquence, l'inertie limite le mouvement et $X(\omega)$ tend vers zéro. Entre ces deux régimes, l'amplitude présente un maximum de résonance lorsque l'amortissement est assez faible.

Pour trouver ce maximum, on minimise le dénominateur

$$
D(\omega)=(\omega_0^2-\omega^2)^2+4\gamma^2\omega^2.
$$

La dérivée s'annule, pour le maximum non nul, à

$$
\omega_{\mathrm{r}}=\sqrt{\omega_0^2-2\gamma^2}
=\sqrt{\omega_0^2-\frac{\alpha^2}{2m^2}},
$$

si $\gamma<\omega_0/\sqrt{2}$. Lorsque le frottement est faible, $\omega_{\mathrm{r}}$ est proche de $\omega_0$. Plus le frottement augmente, plus le pic s'élargit et s'abaisse ; si l'amortissement est trop fort, il n'y a plus de maximum de résonance à fréquence non nulle.

On peut visualiser cette réponse dans la [simulation de résonance](progjava/resonance.html). La simulation aide à lire la courbe, tandis que les expressions précédentes expliquent la position et la forme du pic.

## À retenir

- Un système qui subit une force de rappel linéaire autour d'un équilibre stable suit l'équation de l'oscillateur harmonique.
- La pulsation propre dépend des propriétés du système : $\sqrt{k/m}$ pour un ressort, $\sqrt{g/L}$ pour un pendule aux petits angles.
- Une force périodique impose sa pulsation au régime permanent ; l'amplitude dépend de l'écart entre cette pulsation et la résonance ainsi que du frottement.
- Le frottement évite une amplitude infinie à la résonance et fixe la hauteur et la largeur du pic de $X^2(\omega)$.
