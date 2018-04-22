-- Set up
local hyper  = {"ctrl", "cmd", "alt"}
local hyper2 = {"shift", "ctrl", "cmd", "alt"}
local hyper3 = {"shift", "ctrl", "cmd"}

-- Reload config
hs.hotkey.bind({"alt", "ctrl"}, "1", function()
  hs.reload()
end)
hs.alert.show("Config loaded")


-- Resize window (half size of the scree)

-- hs.hotkey.bind(hyper, "R", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.w = max.w / 2
--   f.h = max.h
--   win:setFrame(f)
-- end)

--------------------------------------------------
-- Move Window (nudging - not resizing)
--------------------------------------------------
-- Moving windows in the following directions:
-- y   k   u
-- h       l
-- b   j   n

delay = hs.eventtap.keyRepeatDelay()

hs.hotkey.bind(hyper2, "Y", nil, nil, function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 15
  f.y = f.y - 15
  win:setFrame(f)
end)

moveUp = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 15
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "K", moveUp, nil, moveUp)

hs.hotkey.bind(hyper2, "U", nil, nil, function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 15
  f.y = f.y - 15
  win:setFrame(f)
end)

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

hs.hotkey.bind(hyper2, "B", nil, nil, function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 15
  f.y = f.y + 15
  win:setFrame(f)
end)

moveDown = function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 15
  win:setFrame(f)
end
hs.hotkey.bind(hyper2, "J", moveDown, nil, moveDown)

hs.hotkey.bind(hyper2, "N", nil, nil, function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 15
  f.y = f.y + 15
  win:setFrame(f)
end)

--------------------------------------------------
-- Window Location and Resizing
--------------------------------------------------

-- Move window top-middle of the screen and resize
hs.hotkey.bind(hyper3, "P", function()
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

-- Move window center of screen and resize
hs.hotkey.bind(hyper3, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.15)
  f.y = max.y + (max.h * 0.1)
  f.w = max.w * 0.7
  f.h = max.h * 0.8
  win:setFrame(f)
end)

-- Move window center of screen and resize BIG
hs.hotkey.bind(hyper3, "B", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w * 0.13)
  f.y = max.y + (max.h * 0.07)
  f.w = max.w * 0.75
  f.h = max.h * 0.88
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

  f.x = max.x + (max.w * 0.62)
  f.y = max.y
  f.w = max.w * 0.38
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
  f.w = max.w * 0.62
  f.h = max.h
  win:setFrame(f)
end)

-- -- Move window right bottom - cycle
-- function right_bottom()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w / 2)
--   f.y = max.y + (max.h * 0.5)
--   f.w = max.w / 2
--   f.h = max.h * 0.5
--   win:setFrame(f)
-- end

-- function right_bottom2()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w / 2)
--   f.y = max.y + (max.h * 0.7)
--   f.w = max.w / 2
--   f.h = max.h * 0.3
--   win:setFrame(f)
-- end

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

-- Move window right top -- larger
-- hs.hotkey.bind(hyper, "O", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()
--   local screen = win:screen()
--   local max = screen:frame()

--   f.x = max.x + (max.w / 2)
--   f.y = max.y
--   f.w = max.w / 2
--   f.h = max.h * 0.7
--   win:setFrame(f)
-- end)

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

  f.x = max.x + (max.w / 6)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
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

-- Trying some cycling or sequencing function
-- local cycle_leftop = hs.fnutils.sequence({
--   {function()
--     local win = hs.window.focusedWindow()
--     local f = win:frame()
--     local screen = win:screen()
--     local max = screen:frame()

--     f.x = max.x
--     f.y = max.y
--     f.w = max.w / 2
--     f.h = max.h * 0.5
--     win:setFrame(f)
--   end},

--   {function()
--     local win = hs.window.focusedWindow()
--     local f = win:frame()
--     local screen = win:screen()
--     local max = screen:frame()

--     f.x = max.x
--     f.y = max.y
--     f.w = max.w / 2
--     f.h = max.h * 0.3
--     win:setFrame(f)
--   end}
-- })

-- hs.hotkey.bind(hyper, "Q", function()
--   cycle_leftop()
-- end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------
hs.hotkey.bind(hyper, ']', function()
    hs.window.switcher.nextWindow()
end)

hs.hotkey.bind("alt", "tab", function()
    hs.window.switcher.nextWindow()
end)

hs.hotkey.bind(hyper, '[', function()
    hs.window.switcher.previousWindow()
end)

-- hs.hotkey.bind(hyper, 'k', function()
--     hs.window.focusedWindow():focusWindowNorth()
-- end)

-- hs.hotkey.bind(hyper, 'j', function()
--     hs.window.focusedWindow():focusWindowSouth()
-- end)

-- hs.hotkey.bind(hyper, 'l', function()
--     hs.window.focusedWindow():focusWindowEast()
-- end)

-- hs.hotkey.bind(hyper, 'h', function()
--     hs.window.focusedWindow():focusWindowWest()
-- end)

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
