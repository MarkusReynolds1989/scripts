# Takes a filter function and a collection and then returns any element that matches the filter.

param(
    [Parameter(Mandatory = $true)]
    [scriptblock]$filter,
    [Parameter(Mandatory = $true, ValueFromPipeLine = $true)]
    [Array]$elements
)

Process {
    foreach ($item in $elements) {
        if (& $filter $item) {
            $item
        }
    }
}
