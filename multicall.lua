-------------------------------------------------------------------
-- MULTI-CALL CONTRACT
-------------------------------------------------------------------

function aggregate(...)
  local args = {...}
  local results = {}

  if type(args[1][1]) == 'table' then
    args = args[1]
  end

  for i,call in ipairs(args) do
    results[i] = contract.call(unpack(call))
  end

  return results
end

function force_aggregate(...)
  local args = {...}
  local results = {}

  if type(args[1][1]) == 'table' then
    args = args[1]
  end

  for i,call in ipairs(args) do
    local success, result = pcall(contract.call, unpack(call))
    results[i] = {success, result}
  end

  return results
end

abi.register_view(aggregate, force_aggregate)

-- Helper Functions - they can also be called via the aggregator above

function getBlockheight()
  return system.getBlockheight()
end

function getPrevBlockHash()
  return system.getPrevBlockHash()
end

function getTimestamp()
  return system.getTimestamp()
end

function getAergoBalance(address)
  return contract.balance(address)
end

function isContract(address)
  return system.isContract(address)
end

abi.register_view(getBlockheight, getPrevBlockHash, getTimestamp, getAergoBalance, isContract)
