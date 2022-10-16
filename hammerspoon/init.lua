-- Configs below are for changing input sources.
local map = hs.keycodes.map
local keyDown = hs.eventtap.event.types.keyDown
local flagsChanged = hs.eventtap.event.types.flagsChanged

local isCmdAsModifier = false

local function switchInputSourceEvent(event)
  local eventType = event:getType()
  local keyCode = event:getKeyCode()
  local flags = event:getFlags()
  local isCmd = flags["cmd"]

  if eventType == keyDown then
    if isCmd then
      isCmdAsModifier = true
    end
  elseif eventType == flagsChanged then
    if not isCmd then
      if isCmdAsModifier == false then
        -- 入力された command キーの入力ソースと現在の入力ソースが異なるときだけ実行
        if keyCode == map["cmd"] then
          hs.keycodes.setMethod("Romaji")
        elseif keyCode == map["rightcmd"] then
          hs.keycodes.setMethod("Hiragana")
        end
      end
      isCmdAsModifier = false
    end
  end
end

eventTap = hs.eventtap.new({ keyDown, flagsChanged }, switchInputSourceEvent)
eventTap:start()

-- Configs below are for emacs binding in microsoft app.
local function keyCode(key, modifiers)
  modifiers = modifiers or {}
  return function()
    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
    --[[ hs.timer.usleep(1000) ]]
    hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  end
end

local function remapKey(modifiers, key, keyCode)
  hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
  for k, v in pairs(hs.hotkey.getHotkeys()) do
    v["_hk"]:disable()
  end
end

local function enableAllHotkeys()
  for k, v in pairs(hs.hotkey.getHotkeys()) do
    v["_hk"]:enable()
  end
end

local function handleGlobalAppEvent(name, event, app)
  if event == hs.application.watcher.activated then
    -- hs.alert.show(name)
    -- if name == "Microsoft Word" then
    if string.find(name, "Microsoft") then
      enableAllHotkeys()
    else
      disableAllHotkeys()
    end
  end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

remapKey({ "ctrl" }, "p", keyCode("up"))
remapKey({ "ctrl" }, "n", keyCode("down"))
remapKey({ "ctrl" }, "b", keyCode("left"))
remapKey({ "ctrl" }, "f", keyCode("right"))

remapKey({ "ctrl" }, "a", keyCode("home"))
remapKey({ "ctrl" }, "e", keyCode("end"))

remapKey({ "ctrl" }, "h", keyCode("delete")) -- backspace
remapKey({ "ctrl" }, "d", keyCode("forwarddelete")) -- delete

remapKey({ "ctrl" }, "w", keyCode("delete", { "alt" }))
