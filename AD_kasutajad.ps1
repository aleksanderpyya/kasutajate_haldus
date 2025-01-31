# location of AD users file
$file = "C:\Users\Administrator\Documents\'adusers.csv'"
# import file content
$users = Import-Csv $file -Encoding Default -Delimiter ";"
# foreach user data row in file
foreach ($user in $users){
    # username is firstname.lastname
    $username = $user.Firstname + "." + $user.LastName
    $username = $username.ToLower()
    echo $username
}
# function translit UTF-8 characters to LATIN
function Translit {
    # function use as parameter string to translit
    param(
        [string] $inputString
    )
    # define the characters which have to be translited
        $Translit = @{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
        }
    # create translited output
    $outputString=""
    # transfer string to array of characters and by character
    foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {
        # if character is exists in list of characters for transliting
        if ($Translit[$character] -cne $Null ){
            # add to output translited character
            $outputString += $Translit[$character]
        } else {
            # otherwise add the initial character
            $outputString += $character
        }
    }
    Write-Output $outputString
}