function love.load()
  --Load the classic library so we can do oop
  Object = require "libraries/classic"
  
  --Load the transform library, used for rotating things
  require "libraries/transform"
  
  --Set the random seed
  math.randomseed(os.time())
  
  --global variables
  blocksize = 48
  droptimer = 1 --in seconds
  movecooldown = 0.1
  speedupcooldown = 0.05
  rotatecooldown = 0.25
  gamepads = love.joystick.getJoysticks()
  
  for i, joystick in ipairs(gamepads) do
        print("gamepad "..joystick:getID()..": "..joystick:getName())
    end
  
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
  controllers = { }
  controllers[1] = Controller(View(blocksize, 0),Player(gamepads[1]))
  --controllers[2] = Controller(View(blocksize+600, 0),Player(gamepads[2]))
end

function love.update(dt)
  for i, controller in ipairs(controllers) do
    controller:update(dt)
  end
  
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end
  
  if love.keyboard.isDown("f5") then
    love.event.quit("restart")
  end
end

function love.draw()
  for i, controller in ipairs(controllers) do
    controller:draw()
  end
end