$KasutajaParool = ConvertTo-SecureString "qwerty" -AsPlainText -Force

New-LocalUser "Kasutaja1" -Password $KasutajaParool -FullName "Esimene Kasutaja" -Description "Local Account - kasutaja1"