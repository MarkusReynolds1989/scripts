# Takes a reduce function, a starting state, and a collection and then returns the function applied to the state
# and every element of the collection.

param(
    [Parameter(Mandatory = $true)]
    [scriptblock]$reducer,
    [Parameter(Mandatory = $true)]
    $state,
    [Parameter(Mandatory = $true, ValueFromPipeLine = $true)]
    [Array]$elements
)

Process {
    foreach ($item in $elements) {
        $state = & $reducer $state $item
    }
}

End {
    $state
}
