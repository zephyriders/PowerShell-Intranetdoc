
$RepertoireRacine = "\\srvfic1\Intranet\"

$varCheminRepertoireScript = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)
$currentScriptName = $MyInvocation.MyCommand.Name #Récupération du nom du script en cours




$MesDossiers = get-childitem $RepertoireRacine 
#get-childitem "C:\" -Recurse

foreach ($Racine in $MesDossiers){
	
    if ([string]::IsNullOrEmpty($Racine.Extension)) {
       echo "c est un repertoire racine" $Racine
       

       C:\tmp\script\batchfile.ps1 
    }
}