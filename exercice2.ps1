# exercice2.ps1

param([string]$FilePath = "C:\Scripts\Log.log", [string]$Content)

Function Log {
    param([string]$Message)
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Message"
    Add-Content -Path $FilePath -Value $logLine
}

Function Random-Password {
    param([int]$length = 10)
    $chars = 46..46 + 48..57 + 65..90 + 97..122
    -join (Get-Random -Count $length -InputObject $chars | ForEach-Object {[char]$_})
}

Function ManageAccentsAndCapitalLetters {
    param ([String]$String)
    If (-not $String) { return "" }
    $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u' | ForEach-Object { $_.ToLower() }
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

If (-not (Test-Path -Path $CsvFile)) {
    Write-Host "Erreur : Le fichier Users.csv est introuvable à l'emplacement $CsvFile."
    Exit
}

# Vérification de l'importation du fichier
$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Encoding utf8 | Select-Object prenom, nom, description, fonction

Write-Host "Liste des utilisateurs importés :"
$Users | ForEach-Object { Write-Host "$($_.prenom) $($_.nom)" }

foreach ($User in $Users) {
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.nom
    $Name = "$Prenom.$Nom"

    # Vérifier si les valeurs ne sont pas vides
    If (-not $Prenom -or -not $Nom) {
        Write-Host "Erreur : prénom ou nom manquant pour une entrée du fichier CSV."
        Log "Erreur : prénom ou nom manquant pour une entrée du fichier CSV."
        Continue
    }

    # Vérifier si l'utilisateur existe déjà
    If (Get-LocalUser -Name $Name -ErrorAction SilentlyContinue) {
        Write-Host "Utilisateur $Name existe déjà."
        Log "Utilisateur $Name existe déjà."
    } Else {
        $Pass = Random-Password
        $Password = ConvertTo-SecureString $Pass -AsPlainText -Force
        $Description = "$($User.description) - $($User.fonction)"

        Write-Host "Création de l'utilisateur : $Name"

        # Création de l'utilisateur
        New-LocalUser -Name $Name -FullName $Name -Password $Password -Description $Description -AccountNeverExpires

        # Ajout au groupe des utilisateurs locaux
        Add-LocalGroupMember -Group "Utilisateurs" -Member $Name

        Write-Host "Utilisateur $Name créé avec succès. Mot de passe : $Pass"
        Log "Utilisateur $Name créé avec succès. Mot de passe : $Pass"
    }
}





    # sortie : 
    PS C:\Scripts> C:\Scripts\AddLocalUsers.ps1
Liste des utilisateurs importés :
Anna Dumas
Quentin Colin
Matheo Aubert
Rose Bourgeois
Utilisateur anna.dumas existe déjà.
Utilisateur quentin.colin existe déjà.
Utilisateur matheo.aubert existe déjà.
Utilisateur rose.bourgeois existe déjà.
