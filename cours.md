# Cours de Android
## Fondamentaux

- Activity

  Une activité (ou Activity, en anglais) est le point d’entrée de n’importe quelle application Android. C'est elle qui va contenir l'ensemble des éléments graphiques du type texte, bouton, titre, etc. Elle intercepte aussi les interactions faites à l’écran par l’utilisateur. 

- Fragment

  Un fragment contient également des éléments visuels. Il correspond à une portion d’un écran, voire à un écran complet. Tout comme une activité, il est également capable d’intercepter les interactions de l’utilisateur. Un fragment ne peut exister qu’au sein d’une activité.

## Convention de nommage

- PascalCase pour les .java
- snake_case pour les ressources

## Répertoire principaux d'un projet Android

- manifests

  Ce répertoire contient généralement un seul fichier : le fichier AndroidManifest.xml. Ce fichier est la carte d'identité de votre application. Il permet entre autres de préciser le nom de l'application, l'icône à utiliser, quelle activité lancer au démarrage, etc.

- java

  Ce répertoire contient l'ensemble du code source Java ou Kotlin de l'application, ainsi que les différents tests associés. Dans notre exemple, nous voyons apparaître entre autres le fichier MainActivity  (l'extension .java  est automatiquement masquée par l'IDE). Au fur et à mesure de l'avancement du projet, ce répertoire se remplira de fichiers, voire de sous-dossiers afin d'isoler les composants fonctionnels entre eux.

- res

  Ce répertoire contient toutes les ressources de l'application, et comprend quatre sous-répertoires :

  -  le dossier drawable  , qui contient l'ensemble des images et contenus à afficher à l'écran (par exemple une image, une icône ou un logo) ;

  -  le dossier layout  , contenant l'ensemble des fichiers qui décrivent le rendu visuel des différents écrans de l’application ;

  -  le dossier mipmap  , qui contient principalement l'icône de lancement de l'application ;

  -  le dossier values  , qui contient différents paramétrages et valeurs, par exemple les couleurs à utiliser dans l'application, les différentes traductions de texte à utiliser, ou les styles graphiques à appliquer.

### Dessiner l'application

## Les Conteneurs

- FrameLayout: permet de positionner les éléments les uns au-dessus des autres ;

- LinearLayout: permet de positionner les éléments les uns à la suite des autres, dans le sens horizontal ou vertical ;

- ConstraintLayout: permet de positionner les éléments les uns par rapport aux autres en utilisant des règles de positionnement ;

- RelativeLayout: c’est l’ancêtre de ConstraintLayout, il permet également de positionner les éléments les uns par rapport aux autres. 

## Les attributs

### Occupation de l'espace

2 balises XML fondamentaux : layout_width  et  layout_height.
Ils définissent comment afficher un élément au sein de son conteneur.
Les quatres valeurs possibles sont :

- match_parent 

  l'élément doit occuper tout l’espace disponible offert par son parent (vous pourriez voir apparaître de temps en temps fill_parent  au détour d'un tutoriel ou d'un site web : c'est un attribut obsolète, ancêtre de match_parent  ) ;

- wrap_content

  l'élément doit n'occuper que la place nécessaire à l'affichage de son contenu ;

- 0dp

  la taille de l’élément est définie par ses contraintes avec un conteneur de type ConstraintLayout  ;

- la valeur brute en dp, même s’il est plutôt recommandé d’utiliser les trois options précédentes pour un rendu plus “responsive”.

_L'unité de mesure dp  permet de s'affranchir des incohérences d'affichage suivant la résolution des téléphones. Vous pouvez lire cette page pour mieux comprendre cette notion._
_https://material.io/design/layout/pixel-density.html#pixel-density-on-android_

### Gravitation

La notion de gravitation peut s'appliquer à un élément ou à son contenu. Elle permet de déterminer comment positionner un élément par rapport à son conteneur, ou comment positionner les enfants d'un élément.

- android:layout_gravity

  Pour définir unitairement le positionnement d'un élément au sein de son layout parent.
  Les valeurs possibles sont nombreuses : start  , end  , center  , center_vertical  , center_horizontal  , etc. 

- android:gravity

  Pour définir globalement le positionnement des éléments enfants d’un conteneur.
  Les valeurs possibles sont identiques à l'attribut layout_gravity.

### Text

Utiliser l'attribut android:text pour inclure du texte bruts ou des chaînes de caractères internationalisées.
Ces chaînes de caractères internationalisées doivent être spécifiées dans un fichier strings.xml  présent dans le répertoire res/values/.
_Il est fortement recommandé d'utiliser ce dernier._

D'autres attributs existes pour alterer ce texte :

- android:textSize

  pour changer la taille du texte. L’unité attendue est de type sp  , qui signifie scale-independant pixels. Cette unité se base sur la densité de pixels de l’appareil, mais prend aussi en compte la taille de la police définie dans les réglages de l’appareil. Cela permet à l’interface d’afficher le texte en plus en moins gros selon ce réglage, et donc de rendre votre application plus accessible ;

- android:textStyle

  pour mettre le texte en gras ou en italique (soit respectivement la valeur bold  ou italic  ) ;

- android:background

  pour changer sa couleur de fond.

_Si cela vous intéresse, vous pouvez consulter la liste des attributs XML de l'élément TextView  dans la documentation officielle._
_https://developer.android.com/reference/android/widget/TextView#xml-attributes_

### Marge

- android:layout_margin

  Modifie l'espacement entre l'élement et container.

- layout_marginTop, layout_marginBottom, layout_marginStart ou layout_marginEnd.

  Modifier l'espacement dans une seul direction.

### Padding

Modifie l'espacement interne à l'élement.