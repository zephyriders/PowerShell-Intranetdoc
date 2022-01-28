# PowerShell-Intranetdoc
Scan intranet documentaire

Prérequis: 
    avoir les droits d'accès en lecture  sur tous les repertoires qui vont être scannés

1: Placer les trois scripts dans un repertoire c:/temp/script   par exemple

2: lancer start process qui va permetre de scanner le repertoire en paramètre
  
  Execution:
      Ce process va appeller batchfile.ps1 qui va pour chaque repertoire racine créé un répertoire dans lequell il va inscrire dans un fichier le résultat du parse des fichier et repertoire de chaque repertoire racine. Dès qu'il tombe sur un repertoire il va créer un identifiant unique basé sur la date du jour l'heure les minutes  secondes et milisecondes, puis envoyer en paramètre l'execution du dernier process qui va repertorier les droits d'accès sur chaques repertoires dans un fichier avec le nom de l'id paramètre.

Objectif:
  Intégrer ces résultats dans une base de donnée pour pouvoir faire du reporting et avoir un cliché de l'état des fichiers et des droits sur chaques repertoires
