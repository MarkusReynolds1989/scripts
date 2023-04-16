# Takes a csv and turns it into a list of classes for data analysis or other tasks.
param(
    $deliminator,
    $data
)

Process {
    $output = New-Object System.Collections.ArrayList
    $data = $data.Split([System.Environment]::NewLine)
    $target_length = $data[0].Split($deliminator).Length

    $header_items = $data[0].Split($deliminator)
    $lines = $data[1..$data.Length]

    foreach ($line in $lines) {
        $fields = @{}
        for ($i = 0; $i -lt $target_length; $i += 1) {
            $items = $line.Split($deliminator)
            $fields.add($header_items[$i], $items[$i])
        }

        [void]$output.Add([pscustomobject]$fields)
    }
}

End {
    $output
}
