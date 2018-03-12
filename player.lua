Player = Object:extend()

function Player:new(config)
  self.moveX = 0
  self.speedup= false
end

function Player:update(dt)
  if love.keyboard.isDown("left", "a") then
    self.moveX = -1
  end
  if love.keyboard.isDown("right", "d") then
    self.moveX = 1
  end
   if love.keyboard.isDown("down", "s") then
    self.speedup = true
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