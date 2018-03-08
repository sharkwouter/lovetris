function love.load()
  --Load the classic library so we can do oop
  Object = require "classic"
  
  --global variables
  blocksize = 48
  droptimer = 1 --in seconds
  
  --Color variables
  require "colors"
  
  --Load our classes
  require "view"
  require "block"
  require "shape"
  require "controller"
  
  --Set the window title
  love.window.setTitle("lovetris")
  
  --Set the background color
  love.graphics.setBackgroundColor(colors.white)
  
  --Create controller, which controls all movement and the view
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