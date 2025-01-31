# Küsib kasutajalt ees- ja perenime
$eesnimi = Read-Host "Sisesta kasutaja eesnimi"
$perenimi = Read-Host "Sisesta kasutaja perenimi"

# Koostab kasutaja täisnime
$kasutajaNimi = "$eesnimi $perenimi"

# Otsib kasutajat lokaalsete kasutajate hulgast
$kasutaja = Get-LocalUser | Where-Object { $_.FullName -eq $kasutajaNimi }

# Kontrollib, kas kasutaja leiti
if ($kasutaja) {
    # Kustutab kasutaja
    Remove-LocalUser -Name $kasutaja.Name
    Write-Host "Kasutaja '$kasutajaNimi' on edukalt kustutatud."
} else {
    Write-Host "Kasutajat '$kasutajaNimi' ei leitud."
}
