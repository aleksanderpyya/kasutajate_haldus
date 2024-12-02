# määrame, kus asub fail, mille sees on kasutajate andmed
$Fail = "C:\Users\Aleksander\kasutajate_haldus\kasutajad.csv"
# loeme failist sisu, info jaotatakse ; järgi
$Kasutajad = Import-Csv $Fail -Encoding Default -Delimiter ";"
# failis iga kasutaja andmestik on eraldi reas
# vaatame faili siu ridade kaupa
# selleks salvestame iga rea $kasutaja muutuja sisse
foreach ($kasutaja in $Kasutajad)
{
    # kuna reas on mitu väärtust, siis iga element on kättesaadav veeru nimetuse järgi, milleks me paneme
    # $muutuja.VeeruNimetus kujul kirja
    $Kasutajanimi = $kasutaja.Kasutajanimi
    $Taisnimi = $kasutaja.Taisnimi
    $KontoKirjeldus =$kasutaja.Kontokirjeldus
    $Parool = $kasutaja.Parool | ConvertTo-SecureString -AsPlainText -Force
    # kasutades saadud info lisame kasutaja
    New-LocalUser -Name $Kasutajanimi -Password $Parool -FullName "$Taisnimi" -Description "$KontoKirjeldus"
}