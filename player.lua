Player = Object:extend()

function Player:new(gamepad)
  self.gamepad = gamepad
  
  self.moveX = 0
  self.speedup= false
  self.rotate = false
end

function Player:update(dt)
  --use keyboard if the controller doesn't exist
  if not self.gamepad then
    if love.keyboard.isDown("left", "a") then
      self.moveX = -1
    end
    if love.keyboard.isDown("right", "d") then
      self.moveX = 1
    end
    if love.keyboard.isDown("down", "s") then
      self.speedup = true
    end
    if love.keyboard.isDown("up", "w", " ") then
      self.rotate = true
    end
  else
    if self.gamepad:isGamepadDown("dpleft") or self.gamepad:getGamepadAxis("leftx") < -0.5 then
      self.moveX = -1
    end
    if self.gamepad:isGamepadDown("dpright") or self.gamepad:getGamepadAxis("leftx") > 0.5  then
      self.moveX = 1
    end
    if self.gamepad:isGamepadDown("dpdown")  or self.gamepad:getGamepadAxis("lefty") > 0.5 then
      self.speedup = true
    end
    if self.gamepad:isGamepadDown("a", "dpup") then
      self.rotate = true
    end
  end
end

function Player:getMoveX()
  --returns the amount the current block should move horizontal, based on input
  local tempMoveX = self.moveX
  self.moveX = 0
  return tempMoveX
end

function Player:getSpeedup()
  if(self.speedup) then
    self.speedup = false
    return true
  end
  return false
end

function Player:getRotate()
  if(self.rotate) then
    self.rotate = false
    return true
  end
  return false
end