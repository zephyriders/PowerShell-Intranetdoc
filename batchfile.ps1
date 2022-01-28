
$Entite = $Racine
$RepertorieaTraiter = "\\srvfic1\Intranet\"+$Entite

$varCheminRepertoireScript = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)
$currentScriptName = $MyInvocation.MyCommand.Name #Récupération du nom du script en cours

#On ne prend que le nom du script sans l'extention. Pour cela on chercher la position d'un point en partant de la droite et on prend tout ce qui est à sa gauche
$currentScriptName = $currentScriptName.substring(0,$($currentScriptName.lastindexofany(".")))

#Création du fichier vierge
$EmplacementFichier = "$varCheminRepertoireScript\rep$($Entite)\$($Entite)_File.txt"
$MonFichier = New-Item -type file $EmplacementFichier -Force

$MesObjets = get-childitem $RepertorieaTraiter -Recurse
#get-childitem "C:\" -Recurse

#entêtes de collones
$MyLine = "Nom `t Chemin`t Rep_Id`t Taille `t Date_creation `t Modifie_le `t Date_dernier_acces"
add-content $MonFichier $MyLine

foreach ($UneLigne in $MesObjets){
	
    if ([string]::IsNullOrEmpty($UneLigne.Extension)) {
       # Write-Host "c est un repertoire";
       $repId = Get-Date -Format "yyyyMMdd_HHmmssfff"
       $MyLine = "$($UneLigne.Name)`t$($UneLigne.FullName)`t$("Rep_"+$repId)`t$($UneLigne.Length)`t$($UneLigne.CreationTime)`t$($UneLigne.LastWriteTime)`t$($UneLigne.LastAccessTime)"
       add-content $MonFichier $MyLine

       C:\tmp\script\Rep_security.ps1 -RepId $repId -Location $UneLigne.FullName

    }else{

    #$UneLigne | select name,CreationTime,LastWriteTime,LastAccessTime
    #Write-Host "$($UneLigne.Name), $($UneLigne.FullName), $($UneLigne.PSParentPath)"
    #Write-Host $UneLigne.FullName

    $MyLine = "$($UneLigne.Name)`t$($UneLigne.FullName)`t$($UneLigne.Extension)`t$($UneLigne.Length)`t$($UneLigne.CreationTime)`t$($UneLigne.LastWriteTime)`t$($UneLigne.LastAccessTime)"
    add-content $MonFichier $MyLine
    }

}