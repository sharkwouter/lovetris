function love.load()
  --Load the classic library so we can do oop
  Object = require "classic"
  
  --global variables
  blocksize = 70
  fallspeed = 100
  
  --Load our classes
  require "view"
  require "block"
  require "shape"
  require "controller"
  
  --Set the background color
  love.graphics.setBackgroundColor(255, 255, 255)
  
  controller = Controller(View(blocksize, 0))
  
end

function love.update(dt)
  --keyboard input
    if love.keyboard.isDown("s") then
    playerMove(0)
  end
  if love.keyboard.isDown("d") then
    playerMove(90)
  end
  if love.keyboard.isDown("w") then
    playerMove(180)
  end
  if love.keyboard.isDown("a") then
    playerMove(270)
  end
  
  controller:update(dt)
  
end

function love.draw()
  controller:draw()
end