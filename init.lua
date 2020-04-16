require "preload"
local modal = require "modal"
require "preview-app"

modal.setHotkey({"cmd", "ctrl"}, "space")

hs.hints.style = "vimperator"
hs.hints.showTitleThresh = 4
hs.hints.titleMaxSize = 20
hs.hints.fontSize = 30

require("windows").addState(modal)
require("apps").addState(modal)
require("multimedia").addState(modal)
-- require("emacs").addState(modal)

local stateMachine = modal.createMachine()
stateMachine:toMain()

-- Use Cmd+\ to show 1Password everywhere except Visual Studio Code
function activate_1password()
  local client = hs.application.frontmostApplication()
  if client:title() == 'Code' then
    hs.eventtap.keyStroke({"cmd"}, "f11")
  else
    hs.eventtap.keyStroke({"cmd"}, "f12")
  end
end
hs.hotkey.bind({"cmd"}, "\\", activate_1password)

hs.alert.show("Config Loaded")
