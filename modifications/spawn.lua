
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
      core.writeCode(core.AOBScan("6A 40 51"), nops(30))
    end

    if config.disable.mother == true then
      --[[
      Remove mother spawning
      --]]
      core.writeCode(core.AOBScan("6A 3F 51"), nops(30))
    end

    if config.disable.drunk == true then
      --[[
      Remove drunk spawning
      --]]
      core.writeCode(core.AOBScan("6A 23 03 C9"), nops(29))
    end

    if config.disable.chicken == true then
      --[[
      Remove chicken spawning
      --]]
      core.writeCode(core.AOBScan("6A 3E 03 C9"), nops(29))
    end
  end,
}
