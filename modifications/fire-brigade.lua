
local buildingPrioritiesArrayNoFire = core.AOBScan("20 00 07 00 21 00 1e 00 11 00 22 00 03 00 14 00 04 00 05 00 06 00 0c 00 0d 00 0e 00 0f 00 10 00 46 00 1b 00 1f 00 12 00 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00")
local buildingPrioritiesArrayFire = core.AOBScan("46 00 1b 00 20 00 07 00 21 00 1e 00 11 00 22 00 03 00 14 00 04 00 05 00 06 00 0c 00 0d 00 0e 00 0f 00 10 00 1f 00 12 00 16 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00")

local prioritizablebuildingTypes = {
  WATERPOT = 0x46,
  WELL = 0x1b,
  APPLEFARM = 0x20,
  HUNTERSHUT = 0x07,
  DAIRYFARM = 0x21,
  WHEATFARM = 0x1e,
  BAKERY = 0x11,
  MILL = 0x22,
  WOODCUTTERSHUT = 0x03,
  QUARRY = 0x14,
  OXTETHER = 0x04,
  IRONMINE = 0x05,
  PITCHRIG = 0x06,
  FLETCHER = 0x0c,
  BLACKSMITH = 0x0d,
  POLETURNER = 0x0e,
  ARMOURER = 0x0f,
  TANNER = 0x10,
  HOPFARM = 0x1f,
  BREWERY = 0x12,
  INN = 0x16,
}

return {
  setFireBrigadePriorities = function(config)
    for k, v in ipairs(config.fireBrigade.peasantAssignmentPriority.fire) do
      local raw = prioritizablebuildingTypes[v]
      
      if raw == nil then error(debug.traceback("unknown building type: %s", v))
      
      core.writeSmallInteger(buildingPrioritiesArrayFire + ((k-1)*2), raw)
    end
    
    for k, v in ipairs(config.fireBrigade.peasantAssignmentPriority.nofire) do
      local raw = prioritizablebuildingTypes[v]
      
      if raw == nil then error(debug.traceback("unknown building type: %s", v))
      
      core.writeSmallInteger(buildingPrioritiesArrayNoFire + ((k-1)*2), raw)
    end
  end,
}
