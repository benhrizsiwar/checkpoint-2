# exercice2.ps1

function Log {
    param (
        [string]$message
    )
    Add-Content -Path "C:\Scripts\log.txt" -Value "$([datetime]::Now) - $message"
}

function Generate-Password {
    $length = 10
    $chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    $password = -join ((65..90) + (97..122) + (48..57) | Get-Random -Count $length | ForEach-Object { [char]$_ })
    return $password
}

# Exécution du script AddLocalUsers.ps1 avec privilèges élevés
$scriptPath = "C:\Scripts\AddLocalUsers.ps1"
Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File $scriptPath" -Verb RunAs

# Code du script AddLocalUsers.ps1

$users = Import-Csv -Path "C:\Scripts\Users.csv" | Select-Object Name,Password,Prenom,Nom,Description

foreach ($user in $users) {
    # Initialisation de la variable $Name
    $Name = "$($user.Prenom).$($user.Nom)"

    if (Get-LocalUser -Name $user.Name) {
        Write-Output "L'utilisateur $($user.Name) existe déjà."
        Log "L'utilisateur $($user.Name) existe déjà."
    } else {
        # Génération d'un mot de passe de 10 caractères aléatoires
        $user.Password = Generate-Password

        # Création de l'utilisateur local
        New-LocalUser -Name $Name -Password (ConvertTo-SecureString $user.Password -AsPlainText -Force) -FullName "$($user.Prenom) $($user.Nom)" -Description $user.Description -PasswordNeverExpires

        # Affichage du mot de passe créé
        Write-Output "Le compte de l'utilisateur $($user.Name) a été créé avec le mot de passe : $($user.Password)"
        Log "Création du compte utilisateur $($user.Name) avec le mot de passe $($user.Password)"

        # Ajout de l'utilisateur dans le groupe local
        Add-LocalGroupMember -Group "Utilisateurs" -Member $user.Name
    }
}
