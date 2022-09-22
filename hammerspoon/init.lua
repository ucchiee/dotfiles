local map = hs.keycodes.map
local keyDown = hs.eventtap.event.types.keyDown
local flagsChanged = hs.eventtap.event.types.flagsChanged

local SOURCE_ID_EN = "com.apple.keylayout.ABC" -- 「英数」の入力ソースID
local SOURCE_ID_JA = "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese" -- 「かな」の入力ソースID

-- 「入力ソースを切り替えるショートカット」を押す
local function switchInputSource()
	hs.eventtap.keyStroke({ "ctrl" }, "space", 0)
end

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
				local currentSourceID = hs.keycodes.currentSourceID()

				-- 入力された command キーの入力ソースと現在の入力ソースが異なるときだけ実行
				if keyCode == map["cmd"] and currentSourceID ~= SOURCE_ID_EN then
					switchInputSource()
				elseif keyCode == map["rightcmd"] and currentSourceID ~= SOURCE_ID_JA then
					switchInputSource()
				end
			end
			isCmdAsModifier = false
		end
	end
end

eventTap = hs.eventtap.new({ keyDown, flagsChanged }, switchInputSourceEvent)
eventTap:start()
