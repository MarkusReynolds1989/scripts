# Takes input as a TSV and then splits it up and prints it out as either a markdown table
# or a Jira table.

param(
    [Parameter(Mandatory = $true)]
    [string]$deliminator,
    [Parameter(Mandatory = $true)]
    [string]$output_type,
    [Parameter(Mandatory = $true)]
    $content
)

Process {
    $output_buffer = New-Object System.Text.StringBuilder

    function convert_line($line, $buffer) {
        $items = $line.split($deliminator)
        [void]$buffer.Append("| ")
        foreach ($item in $items) {
            [void]$buffer.Append(" $item |")
        }
    }

    $lines = $content -split [System.Environment]::NewLine

    convert_line $lines[0] $output_buffer
    [void] $output_buffer.AppendLine()

    $length = $lines[0].Split($deliminator).length
    [void] $output_buffer.Append("| ")
    for ($i = 0; $i -lt $length; $i += 1) {
        [void] $output_buffer.Append(" --- |")
    }

    [void] $output_buffer.AppendLine()
    foreach ($line in $lines[1..$lines.length]) {
        convert_line $line $output_buffer
        [void] $output_buffer.AppendLine()
    }
}

End {
    $output_buffer.ToString()
}
