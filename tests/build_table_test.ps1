$content = Get-Content "fake.csv"
$result = & "../src/Build-Table.ps1" "," "markdown" $content

Write-Output $result
