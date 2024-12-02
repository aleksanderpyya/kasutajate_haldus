﻿# kontrollime edastatud parameetrite arvu
if($args.Count -ne 3 ){
    # kui edastatud parameetrite arv ei ole 3
    #siis trükime kasutusjuhendi
    echo '.\SkriptiNimi kasutajanimi "Ees Perenimi" "Konto kirjeldus"'
} else {
# defineerime vajaliku käsurea parameetrid
$Kasutajanimi = $args[0]
$TaisNimi = $args[1]
$KontoKirjeldus = $args[2]
# loome kasutajale parooli
$KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force
# lisame kasutaja vastavate andmetega
New-LocalUser "$Kasutajanimi" -Password $KasutajaParool -FullName "$TaisNimi" -Description "$KontoKirjeldus"
}