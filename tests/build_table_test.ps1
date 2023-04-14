$content = Get-Content "fake.csv"
$goal = Get-Content "fake_output.md" -Raw
$result = & "../src/Build-Table.ps1" "," "markdown" $content

if ($result -eq $goal.ToString()) {
    Write-Output "Pass"
}
else {
    Write-Output "Fail"
    Write-Output $result
}
