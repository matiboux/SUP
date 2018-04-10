# Conventions de nommage des fichiers

AUCUNE PULL REQUEST NE SERA ACCEPTÉE SI LES CONVENTIONS NE SONT PAS RESPECTÉES.

N'hésitez pas à regarder les fichiers existants pour voir des exemples de noms de fichiers.

Veuillez aussi à bien compresser les pdf avant de les soumettre. Pour ce faire :

* `gs -q -dSAFER -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -sOutputFile=output.pdf -f input.pdf`
* `python3 cleaner.py` à la racine de votre repo git

-----

Un fichier pdf (sauf pour les QCMs) se doit d'être au format suivant :

`[Partiel/MidTerm/controle-TD]-[Promotion]-[Semestre]-[Matière]-[informations additionnelles][_c if cleaned].pdf`

Exemple : `Partiel-2021-s2-algo-corrige-fr_c.pdf`

Un fichier pdf pour les QCM doit être au format suivant :

qmc-[Promotion]-[Semestre]-[Numéro du QCM]-[informations additionnelles][_c if cleaned].pdf

Exemple : `qcm-2021-s2-2.pdf`

[informations additionnelles] peut être la langue ("fr" ou "en"), si c'est la version corrigée ("corrige"), ou la feuille réponse ("feuille_reponse")