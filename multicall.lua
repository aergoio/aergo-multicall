-------------------------------------------------------------------
-- MULTI-CALL CONTRACT
-------------------------------------------------------------------

function aggregate(...)
  local results = {}

  for i,call in ipairs({...}) do
    results[i] = contract.call(unpack(call))
  end

  return results
end

abi.register_view(aggregate)

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
