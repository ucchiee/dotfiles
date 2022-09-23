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
          hs.keycodes.setMethod('Romaji')
				elseif keyCode == map["rightcmd"] then
          hs.keycodes.setMethod('Hiragana')
				end
			end
			isCmdAsModifier = false
		end
	end
end

eventTap = hs.eventtap.new({ keyDown, flagsChanged }, switchInputSourceEvent)
eventTap:start()
