$content = Get-Content "fake.csv"
$md_goal = Get-Content "fake_output.md" -Raw
$result = & "../src/Build-Table.ps1" "," "markdown" $content

if ($result -eq $md_goal.ToString()) {
    Write-Output "Markdown Pass"
}
else {
    Write-Output "Markdown Fail"
    Write-Output $result
}

$jira_goal = Get-Content "fake_output_jira.txt" -Raw
$result = & "../src/Build-Table.ps1" "," "jira" $content

if ($result -eq $jira_goal.ToString()) {
    Write-Output "Jira Pass"
}
else {
    Write-Output "Jira Fail"
    Write-Output $result
}
