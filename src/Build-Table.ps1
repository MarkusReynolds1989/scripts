# Takes input as a TSV and then splits it up and prints it out as either a markdown table
# or a Jira table.

param(
    [Parameter(Mandatory = $true)]
    [string]$tsv,
    [Parameter(Mandatory = $true)]
    [string]$type
)
