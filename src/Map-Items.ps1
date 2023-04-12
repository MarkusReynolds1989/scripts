# Takes a function and a collection and then maps the function onto the collection.
param(
    [Parameter(Mandatory = $true)]
    [scriptblock]$mapper,
    [Parameter(Mandatory = $true, ValueFromPipeLine = $true)]
    [Array]$elements
)

Process {
    foreach ($item in $elements) {
        & $mapper $item
    }
}
