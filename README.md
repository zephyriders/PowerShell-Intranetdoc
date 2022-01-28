# PowerShell-Intranetdoc
Scan intranet documentaire

lancer start process qui va permetre de scanner le repertoire en paramètre
  ce process va appeller batchfile.ps1 qui va pour chaque repertoire racine créé un répertoire dans lequell il va inscrire dans un fichier le résultat du parse des fichier et repertoire de chaque repertoire racine.

    dès qu'il tombe sur un repertoire in créé un identifiant unique basé sur la date du jour l'heure les minutes  secondes et milisecondes, puis envoyer en paramètre l'execution du dernier process qui va repertorié les droits d'accès sur chaques repertoires dans un fichier avec le nom de l'id paramètre 

Objectif intégrer ces résultats dans une base de donnée pour pouvoir faire du reporting et avoir un cliché de l'état des fichiers et des droits sur chaques repertoires
