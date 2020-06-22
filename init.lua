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

  f.y = f.y - 15
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "K", moveUp, nil, moveUp)

moveLeft = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 20
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "H", moveLeft, nil, moveLeft)

moveRight = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 20
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "L", moveRight, nil, moveRight)

moveDown = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 15
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

  f.x = max.x + (max.w * 0.32)
  f.y = max.y + (max.h * 0.3)
  f.w = max.w * 0.36
  f.h = max.h * 0.4
  win:setFrame(f)
end)

-- Move window center of screen and resize for Email writing
hs.hotkey.bind(hyper3, "E", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.34)
  f.y = max.y + (max.h * 0.15)
  f.w = max.w * 0.32
  f.h = max.h * 0.7
  win:setFrame(f)
end)

-- Move window center of screen and resize medium
hs.hotkey.bind(hyper3, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.2)
  f.y = max.y + (max.h * 0.15)
  f.w = max.w * 0.6
  f.h = max.h * 0.7
  win:setFrame(f)
end)

-- Move window center of screen and resize BIG
hs.hotkey.bind(hyper3, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.1)
  f.y = max.y + (max.h * 0.05)
  f.w = max.w * 0.8
  f.h = max.h * 0.9
  win:setFrame(f)
end)


-- Move window right (half size of the screen)
hs.hotkey.bind(hyper3, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Move windown left (half size of the screen)
hs.hotkey.bind(hyper3, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- Move window right bottom
hs.hotkey.bind(hyper3, ".", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h * 0.5)
  f.w = max.w / 2
  f.h = max.h * 0.5
  win:setFrame(f)
end)

-- Move window right bottom - smaller
hs.hotkey.bind(hyper, ".", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h * 0.7)
  f.w = max.w / 2
  f.h = max.h * 0.3
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

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h * 0.5
  win:setFrame(f)
end)


-- Move window left bottom
hs.hotkey.bind(hyper3, "M", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y + (max.h * 0.5)
  f.w = max.w / 2
  f.h = max.h * 0.5
  win:setFrame(f)
end)

-- Move window left top
hs.hotkey.bind(hyper3, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h * 0.5
  win:setFrame(f)
end)

-- Center Window (window resizes to half the horizontal size of the screen)
hs.hotkey.bind(hyper3, "C", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 4)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
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

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
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

hs.hotkey.bind("alt", "1", function()
  -- hs.application.launchOrFocus("Google Chrome")
  hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind("alt", "2", function()
  centerWindow(hs.application.open("kitty", 2, true))
end)

hs.hotkey.bind("alt", "3", function()
  hs.application.launchOrFocus("Emacs")
end)

hs.hotkey.bind("alt", "4", function()
  hs.application.launchOrFocus("Visual Studio Code")
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

hs.hotkey.bind(hyper, "1", applyCodingLayout)
