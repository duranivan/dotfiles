-- local variables

local screenMargin = 30
local wingap = 15

-- Functions

resizeMediumCenter = function(app)
  local win = app:focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.2)
  f.y = max.y + (max.h * 0.15)
  f.w = max.w * 0.6
  f.h = max.h * 0.7
  win:setFrame(f)
end

centerWindow = function(app)
  local win = app:focusedWindow()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w - f.w)/2
  f.y = max.y + (max.h - f.h)/2
  win:setFrame(f)
end


-- Set up
local hyper  = {"ctrl", "cmd", "alt"}
local hyper2 = {"shift", "ctrl", "cmd", "alt"}
local hyper3 = {"shift", "ctrl", "cmd"}
local hyper4 = {"shift", "cmd", "alt"}

-- Reload config
hs.hotkey.bind({"alt", "ctrl"}, "1", function()
  hs.reload()
end)
hs.alert.show("Config loaded")


--------------------------------------------------
-- Move Window (nudging - not resizing)
--------------------------------------------------
-- Moving windows in the following directions:
-- y   k   u
-- h       l
-- b   j   n

delay = hs.eventtap.keyRepeatDelay()

moveUp = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 25
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "K", moveUp, nil, moveUp)

moveLeft = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 50
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "H", moveLeft, nil, moveLeft)

moveRight = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 50
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "L", moveRight, nil, moveRight)

moveDown = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 25
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "J", moveDown, nil, moveDown)


--------------------------------------------------
-- Window Location and Resizing
--------------------------------------------------

-- Move window top-middle of the screen and resize
hs.hotkey.bind(hyper3, "I", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 4)
  f.y = max.y
  f.w = max.w * 1 / 2
  f.h = max.h * 1 / 2
  win:setFrame(f)
end)

-- Move window bottom-middle of the screen and resize
hs.hotkey.bind(hyper3, "/", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 4)
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- Move window center of screen and resize small
hs.hotkey.bind(hyper3, "S", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local proportion = 0.62

  f.x = max.x + (max.w * (1 - proportion)/2)
  f.w = max.w * proportion
  f.h = f.w * 9/16
  f.y = max.y + (max.h - f.h)/2
  win:setFrame(f)
end)

-- Move window center of screen and resize small
hs.hotkey.bind(hyper3, "A", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local proportion = 0.45

  f.x = max.x + (max.w * (1 - proportion)/2)
  f.w = max.w * proportion
  f.h = f.w * 9/16
  f.y = max.y + (max.h - f.h)/2
  win:setFrame(f)
end)

-- Move window center of screen and resize for Email writing
hs.hotkey.bind(hyper3, "E", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local proportion = 0.36

  f.x = max.x + (max.w * (1 - proportion)/2)
  f.w = max.w * proportion
  f.h = max.h * 0.80
  f.y = max.y + (max.h - f.h)/2
  win:setFrame(f)
end)

-- Move window center of screen and resize medium
hs.hotkey.bind(hyper3, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local proportion = 0.7

  f.x = max.x + (max.w * (1-proportion)/2)
  f.w = max.w * proportion
  f.h = f.w * 9/16
  f.y = max.y + (max.h - f.h)/2
  win:setFrame(f)
end)

-- Move window center of screen and resize BIG
hs.hotkey.bind(hyper3, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local proportion = 0.78

  f.x = max.x + (max.w * (1-proportion)/2)
  f.w = max.w * proportion
  f.h = f.w * 9/16
  f.y = max.y + (max.h - f.h)/2
  win:setFrame(f)
end)


-- Move window right (half size of the screen)
hs.hotkey.bind(hyper3, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + screenMargin + wingap + (max.w - screenMargin*2 - wingap) / 2
  f.y = max.y + screenMargin
  f.w = (max.w - screenMargin*2 - wingap) / 2
  f.h = max.h - screenMargin*2
  win:setFrame(f)
end)

-- Move windown left (half size of the screen)
hs.hotkey.bind(hyper3, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + screenMargin
  f.y = max.y + screenMargin
  f.w = (max.w - screenMargin*2 - wingap) / 2
  f.h = max.h - screenMargin*2
  win:setFrame(f)
end)

-- Move window right bottom
hs.hotkey.bind(hyper3, ".", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + screenMargin + wingap + (max.w - screenMargin*2 - wingap) / 2
  f.y = max.y + screenMargin + wingap + (max.h - screenMargin*2 - wingap) / 2
  f.w = (max.w - screenMargin*2 - wingap) / 2
  f.h = (max.h - screenMargin*2 - wingap) / 2
  win:setFrame(f)
end)

-- Move window right - smaller than half horizontal screen
hs.hotkey.bind(hyper, "'", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.66)
  f.y = max.y
  f.w = max.w * 0.34
  f.h = max.h
  win:setFrame(f)
end)

-- Move window left - bigger than half horizontal screen
hs.hotkey.bind(hyper, ";", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w * 0.66
  f.h = max.h
  win:setFrame(f)
end)


-- Move window right top
hs.hotkey.bind(hyper3, "O", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + screenMargin + wingap + (max.w - screenMargin*2 - wingap) / 2
  f.y = max.y + screenMargin
  f.w = (max.w - screenMargin*2 - wingap) / 2
  f.h = (max.h - screenMargin*2 - wingap) / 2
  win:setFrame(f)
end)


-- Move window left bottom
hs.hotkey.bind(hyper3, "M", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local proportion = 0.4

  f.x = max.x + screenMargin
  f.y = max.y + screenMargin + wingap + (max.h - screenMargin*2 - wingap) / 2
  f.w = (max.w - screenMargin*2 - wingap) / 2
  f.h = (max.h - screenMargin*2 - wingap) / 2
  win:setFrame(f)
end)

-- Move window left top
hs.hotkey.bind(hyper3, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + screenMargin
  f.y = max.y + screenMargin
  f.w = (max.w - screenMargin*2 - wingap) / 2
  f.h = (max.h - screenMargin*2 - wingap) / 2
  win:setFrame(f)
end)

-- Center Window (window resizes to 50% the horizontal size of the screen)
hs.hotkey.bind(hyper3, "C", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + screenMargin + wingap + (max.w - screenMargin*2 - wingap) / 4
  f.y = max.y + screenMargin
  f.w = (max.w - screenMargin*2 - wingap) / 2
  f.h = max.h - screenMargin*2
  win:setFrame(f)
end)

-- Center Window (does not resize) both horizontally and vertically
hs.hotkey.bind(hyper4, "C", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w - f.w)/2
  f.y = max.y + (max.h - f.h)/2
  win:setFrame(f)
end)

-- Move Window far right bottom (does not resize)
hs.hotkey.bind(hyper4, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w - f.w)
  f.y = max.y + (max.h - f.h)
  win:setFrame(f)
end)

-- Move Window far left bottom (does not resize)
hs.hotkey.bind(hyper4, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h - f.h)
  win:setFrame(f)
end)

-- Full screen
hs.hotkey.bind(hyper3, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + screenMargin
  f.y = max.y + screenMargin
  f.w = max.w - screenMargin*2
  f.h = max.h - screenMargin*2
  win:setFrame(f)
end)

-- Full screen (1920x1080)
hs.hotkey.bind(hyper, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w - 1920)/2
  f.y = max.y - 68 + (max.h - 1080)/2
  f.w = 1920
  f.h = 1080 + 68 + 23
  win:setFrame(f)
end)


-------------------------------------------------
-- Focus particular apps
-------------------------------------------------

hs.hotkey.bind({"ctrl", "cmd"}, "k", function()
  centerWindow(hs.application.open("kitty", 2, true))
end)

hs.hotkey.bind("alt", "1", function()
  hs.application.launchOrFocus("Google Chrome")
end)

-- hs.hotkey.bind("alt", "2", function()
--   -- hs.application.launchOrFocus("iTerm")
--   hs.application.open("Brave Browser")
--   -- hs.application.open("Marta")
-- end)

hs.hotkey.bind("alt", "3", function()
  hs.application.launchOrFocus("Visual Studio Code")
end)

hs.hotkey.bind({"ctrl", "cmd"}, "s", function()
  hs.application.launchOrFocus("Sublime Text")
end)

hs.hotkey.bind({"ctrl", "cmd"}, "f", function()
  hs.application.launchOrFocus("Firefox")
end)

hs.hotkey.bind("alt", "0", function()
  -- hs.application.launchOrFocus("iTerm")
  hs.application.launchOrFocus("kitty")
end)

-------------------------------------------------
-- Show window hints
-------------------------------------------------
hs.hints.showTitleThresh = 0
hs.hotkey.bind("ctrl", ";", function()
    hs.hints.windowHints()
end)

-------------------------------------------------
-- Move window to next display (East or West)
-------------------------------------------------

function moveWindowNext()
  local win = hs.window.focusedWindow()
  win:moveOneScreenEast(0)
  toggleFullScreen(s)
end

function moveWindowPrev()
  local win = hs.window.focusedWindow()
  win:moveOneScreenWest(0)
  toggleFullScreen(s)
end

hs.hotkey.bind(hyper3, "right", moveWindowNext)
hs.hotkey.bind(hyper3, "left", moveWindowPrev)


-------------------------------------------------
-- Window layouts
-------------------------------------------------

local samsungScreen = "S27D590"
local iMacScreen = "iMac"

applyCodingLayout = function()
  hs.application.launchOrFocus("Visual Studio Code")
  hs.application.launchOrFocus("Google Chrome")
end

local redBorder = false
hs.window.highlight.ui.frameColor = {1,0,0,0.7}
hs.window.highlight.ui.frameWidth = 6
hs.window.highlight.ui.isolateColor = {0,0,0,1}
-- hs.window.highlight.start()

redBorderWindow = function()
  if not redBorder then
    hs.window.highlight.ui.overlay=true
    hs.window.highlight.ui.frameColor = {1,0,0,0.7}
    hs.window.highlight.ui.overlayColor = {0,0,0,0.00000001}
    redBorder = true
  else
    hs.window.highlight.ui.overlay=false
    hs.window.highlight.ui.frameColor = {1,0,0,0}
    hs.window.highlight.ui.overlayColor = {0,0,0,0.4}
    redBorder = false
  end
end

isolateWindowMedium = function ()
  hs.window.highlight.ui.isolateColor = {0,0,0,0.5}
  hs.window.highlight.toggleIsolate()
end

isolateWindowFull = function ()
  hs.window.highlight.ui.isolateColor = {0,0,0,0.95}
  hs.window.highlight.toggleIsolate()
end

-- hs.hotkey.bind(hyper, "1", applyCodingLayout)
hs.hotkey.bind(hyper, "1", redBorderWindow)
hs.hotkey.bind(hyper2, "1", isolateWindowMedium)
hs.hotkey.bind(hyper2, "2", isolateWindowFull)

