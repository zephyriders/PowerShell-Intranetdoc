$varCheminRepertoireScript = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Definition)


#Création du fichier vierge
$EmplacementFichier = "$varCheminRepertoireScript\rep"+$Entite+"\$($RepId)_Rep.txt"
$MonFichier = New-Item -type file $EmplacementFichier -Force

echo "location = " $UneLigne

$FolderPath = $UneLigne 



#ForEach ($Folder in $FolderPath) {

    $Acl = Get-Acl -Path $FolderPath.FullName
ForEach ($Access in $Acl.Access) {
    #$Properties = [ordered]@{'Folder Name'=$Folder.FullName;'Group/User'=$Access.IdentityReference;'Permissions'=$Access.FileSystemRights;'Inherited'=$Access.IsInherited}
    #$Output += New-Object -TypeName PSObject -Property $Properties   

    $Properties = "$("Rep_"+$repId)`t$($FolderPath.FullName)`t$($Access.IdentityReference)`t$($Access.FileSystemRights)`t$($Access.IsInherited)"
 add-content $MonFichier $Properties
         
}

#}
$Output | Out-GridView