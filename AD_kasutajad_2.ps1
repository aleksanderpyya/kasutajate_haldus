# Küsib kasutajalt ees- ja perenime
$eesnimi = Read-Host "Sisesta kasutaja eesnimi"
$perenimi = Read-Host "Sisesta kasutaja perenimi"

# Koostab kasutaja täisnime ja sisselogimisnime (SamAccountName)
$kasutajaNimi = "$eesnimi $perenimi"
$sisselogimisNimi = "$eesnimi.$perenimi"  # Näide: john.doe

# Kontrollib, kas kasutaja on olemas AD-s
$kasutajaOlemas = Get-ADUser -Filter { SamAccountName -eq $sisselogimisNimi } -ErrorAction SilentlyContinue

if ($kasutajaOlemas) {
    # Kui kasutaja on olemas, küsitakse kinnitust kustutamiseks
    $kinnitus = Read-Host "Kas olete kindel, et soovite kustutada kasutaja '$kasutajaNimi' (sisselogimisnimi: $sisselogimisNimi)? (Y/N)"
    
    if ($kinnitus -eq 'Y' -or $kinnitus -eq 'y') {
        try {
            # Kustutab kasutaja AD-st
            Remove-ADUser -Identity $sisselogimisNimi -Confirm:$false
            Write-Host "Kasutaja '$kasutajaNimi' on edukalt kustutatud Active Directory'st." -ForegroundColor Green
        } catch {
            # Kui tekib viga, väljastab veateate
            Write-Host "Viga kasutaja kustutamisel: $_" -ForegroundColor Red
        }
    } else {
        Write-Host "Kasutaja '$kasutajaNimi' kustutamine tühistati." -ForegroundColor Yellow
    }
} else {
    # Kui kasutajat pole, väljastab teate
    Write-Host "Kasutajat '$kasutajaNimi' ei leitud Active Directory'st." -ForegroundColor Yellow
}
