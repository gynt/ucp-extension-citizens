
local function nops(n)
  local r = {}
  for i=1,n do
    table.insert(r, 0x90)
  end
  return r
end

return {
  disableSpawns = function(config)
    if config.disable.child == true then
      --[[
        Remove child spawning
      --]]
      local childSpawnAddress = core.AOBScan("6A 40 51")
      core.writeCode(childSpawnAddress, nops(30))
      core.writeCode(childSpawnAddress, {core.AssemblyLambda("xor eax, eax", {})})
    end

    if config.disable.mother == true then
      --[[
      Remove mother spawning
      --]]
      local motherSpawnAddress = core.AOBScan("6A 3F 51")
      core.writeCode(motherSpawnAddress, nops(30))
      core.writeCode(motherSpawnAddress, {core.AssemblyLambda("xor eax, eax", {})})
    end

    if config.disable.drunk == true then
      --[[
      Remove drunk spawning
      --]]
      local drunkSpawnAddress = core.AOBScan("6A 23 03 C9")
      core.writeCode(drunkSpawnAddress, nops(29))
      core.writeCode(drunkSpawnAddress, {core.AssemblyLambda("xor eax, eax", {})})
    end

    if config.disable.chicken == true then
      --[[
      Remove chicken spawning
      --]]
      local chickenSpawnAddress = core.AOBScan("6A 3E 03 C9")
      core.writeCode(chickenSpawnAddress, nops(29))
      core.writeCode(chickenSpawnAddress, {core.AssemblyLambda("xor eax, eax", {})})
    end

    if config.disable.jester == true then
      local jesterSpawnAddress = core.AOBScan("6A 39 52 8D 04 ED 00 00 00 00")
      core.writeCode(jesterSpawnAddress, nops(31))
      core.writeCode(jesterSpawnAddress, {core.AssemblyLambda("xor eax, eax", {})})

    end
  end,
}
