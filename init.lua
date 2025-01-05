
local spawn = require("modifications.spawn")


return {
  enable = function(self, config)
    spawn.disableSpawns(config.spawn)


  end,
  disable = function(self, config) 

  end,
}