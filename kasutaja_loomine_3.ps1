$firstname = Read-Host 'Sisesta oma eesnimi'
$lastname = Read-Host 'Sisesta oma perenimi'

$username = $firstname.ToLower() + "." + $lastname.ToLower()
$userPassword = ConvertTo-SecureString 'Parool1!' -AsPlainText -Force
$fullname = $firstname + " " + $lastname
$description = "Local account"

Write-Host 'Loodud kasutaja on ' $username

$userExists = Get-LocalUser $username -ErrorAction SilentlyContinue

if(($userExists | Select Name).Name.Count -ge 1){
    Write-Host 'Problem to create user - user already exists'
    Exit
} else {
    New-LocalUser $username -Password $userPassword -FullName $fullname -Description $description
}