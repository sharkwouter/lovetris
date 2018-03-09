Player = Object:extend()

function Player:new(config)
  self.moveX = 0
  self.tempMoveX = 0
end

function Player:update(dt)
  if love.keyboard.isDown("a") then
    self.moveX = -1
  end
  if love.keyboard.isDown("d") then
    self.moveX = 1
  end
end

function Player:getMoveX()
  --returns the amount the current block should move horizontal, based on input
  self.tempMoveX = self.moveX
  self.moveX = 0
  return self.tempMoveX
end