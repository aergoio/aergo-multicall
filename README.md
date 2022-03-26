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
| Mainnet | [AmhAzXNo7o9jK7Wsq6v3DcJcY7vvsD8EYPhuWNHq5RFFYxwJR5kX](https://mainnet.aergoscan.io/account/AmhAzXNo7o9jK7Wsq6v3DcJcY7vvsD8EYPhuWNHq5RFFYxwJR5kX/?tab=interactive) |
| Testnet | [AmgdCQrHpEo9CTndsMQoH8mQ1famXVFmwin8vyGba7PrRshkT9sL](https://testnet.aergoscan.io/account/AmgdCQrHpEo9CTndsMQoH8mQ1famXVFmwin8vyGba7PrRshkT9sL/?tab=interactive) |
| Alphanet | [AmgjhaVAtHB9WUWakYfXjqziwPeFts2HqtXbKo7ESe5MLLfALLX6](https://alpha.aergoscan.io/account/AmgjhaVAtHB9WUWakYfXjqziwPeFts2HqtXbKo7ESe5MLLfALLX6/?tab=interactive) |
