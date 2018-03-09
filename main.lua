function love.load()
  --Load the classic library so we can do oop
  Object = require "classic"
  
  --global variables
  blocksize = 48
  droptimer = 1 --in seconds
  movetimer = 0.1
  
  --Color variables
  colors={
    red={255,0,0},
    blue={0,0,255},
    green={0,255,0},
    cyan={0,255,255},
    purple={128,0,255},
    orange={255,128,0},
    yellow={255,255,0},
    white={255,255,255},
    black={0,0,0}
  }
  
  --Load our classes
  require "player"
  require "view"
  require "block"
  require "shape"
  require "controller"
  
  --Set the window title
  love.window.setTitle("lovetris")
  
  --Set the background color
  love.graphics.setBackgroundColor(colors.white)
  
  --Create controller, which controls all movement and the view
  controller = Controller(View(blocksize, 0),Player("config/keyboard-player1.lua"))
end

function love.update(dt)
  controller:update(dt)
  
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  
  if love.keyboard.isDown("f5") then
    love.event.quit("restart")
  end
end

function love.draw()
  controller:draw()
end