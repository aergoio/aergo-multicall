# Aergo Multicall

Multicall aggregates results from multiple contract function calls.

This reduces the number of separate requests that need to be sent to the blockchain
network, while also providing the guarantee that all values returned are from the
same block (like an atomic read).

It is also possible to return the block number or the timestamp in the same call.


## How to Use

Your app sends a single request to the multicall contract, informing the calls
that must be made

Each call is a list in this format: `[contract_address, function_name, arg1, arg2, ...]`

The calls are passed as arguments to the `aggregate` function:

```
results = aggregate(
[contract_address, function_name, arg1, arg2, ...],
[contract_address, function_name, arg1, arg2, ...],
[contract_address, function_name, arg1, arg2, ...]
)
```

They can also be passed as an array in the first argument:

```
var calls = [
[contract_address, function_name, arg1, arg2, ...],
[contract_address, function_name, arg1, arg2, ...],
[contract_address, function_name, arg1, arg2, ...]
]

results = aggregate(calls)
```

If some of the calls fail, then all the transaction fails. To avoid that you
can use the `force_aggregate` function instead. It returns, for each call, a
tuple of `[success, result_or_error]`


## Helper Functions

These functions can be called via the aggregator by passing the contract address

```
function getBlockheight()

function getPrevBlockHash()

function getTimestamp()

function getAergoBalance(address)

function isContract(address)
```


### Multicall Contract Addresses

| Chain   | Address |
| ------- | ------- |
| Mainnet | [AmhD86dERD3zdNf7spPSuE1YQaHKL6vDTErmrSZ77WZ6Gjwhixoe](https://mainnet.aergoscan.io/account/AmhD86dERD3zdNf7spPSuE1YQaHKL6vDTErmrSZ77WZ6Gjwhixoe/?tab=interactive) |
| Testnet | [AmhDxQqkmLaXCRQWmU1moKKZ9hwVNA4Gg4Akra82pWuoaAFcpmnH](https://testnet.aergoscan.io/account/AmhDxQqkmLaXCRQWmU1moKKZ9hwVNA4Gg4Akra82pWuoaAFcpmnH/?tab=interactive) |
| Alphanet | [Amhrr8FJ8EcAZfbwdX3WBYHrDuYDpgeUswGsAsFzr83rtUjwRdpS](https://alpha.aergoscan.io/account/Amhrr8FJ8EcAZfbwdX3WBYHrDuYDpgeUswGsAsFzr83rtUjwRdpS/?tab=interactive) |
