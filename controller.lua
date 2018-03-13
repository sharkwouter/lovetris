Controller = Object:extend()

function Controller:new(view, player)
  self.view = view
  self.player = player
  
  --timers
  self.droptimer = droptimer
  self.movecooldown = 0
  self.speedupcooldown = 0
  self.rotatecooldown = 0
  
  self.placed = { } --Array of blocks on the field
  
  self.viewX = self.view:getX()
  self.viewY = self.view:getY()
  
  self.currentshape = Shape(3, -1, math.random(7))
end

function Controller:update(dt)
  self.view:update(dt)
  self.player:update(dt)
  
  --Check if we have lines to clear first
  self:checkForLines()
  
  --Timer to prevent the blocks from moving to fast when the player holds a move button
  self.movecooldown = self.movecooldown - dt
  self.speedupcooldown = self.speedupcooldown - dt
  self.rotatecooldown = self.rotatecooldown - dt
  
  --process user input
    if(self.player:getRotate() and self.rotatecooldown <= 0) then
    self.currentshape:rotate(1)
    self.rotatecooldown = rotatecooldown
  end
  
  local moveX = self.player:getMoveX()
  if(moveX ~= 0 and self:currentshapeCanMove(moveX, 0) and self.movecooldown <= 0) then
    self.currentshape:move(moveX,0)
    self.movecooldown = movecooldown
  end
  
  if(self.player:getSpeedup() and self.speedupcooldown <= 0) then
    self.droptimer = 0
    self.speedupcooldown = speedupcooldown
  end
  
  --Timer for the current block falling
  self.droptimer = self.droptimer - dt
  
  if self.droptimer < 0 then
    if(self:currentshapeCanMove(0,1)) then
      self.currentshape:move(0,1)
    else
      self:resetCurrentshape()
    end
  
    self.droptimer = droptimer
  end
  
end

function Controller:draw()
  self.view:draw()
  self.currentshape:draw(self.viewX, self.viewY)
  for i,b in ipairs(self.placed) do
    b:draw(self.viewX, self.viewY)
  end
end

function Controller:resetCurrentshape()
  for i,b in ipairs(self.currentshape:getBlocks()) do
    table.insert(self.placed, b)
  end
  --Game over check is done here, for now
  if(self:isGameOver()) then
      self:gameOver()
  end
  self.currentshape = Shape(3, -1, math.random(7))
end

function Controller:checkFree(xpos, ypos)
  if(xpos < 0 or xpos > 9 or ypos > 19) then
    return false
  end

   for i,b in ipairs(self.placed) do
      if(b:getX() == xpos and b:getY() == ypos) then
          return false
      end
   end
   
  return true
end

function Controller:currentshapeCanMove(moveX, moveY)
  for i,b in ipairs(self.currentshape:getBlocks()) do
    if(self:checkFree(b:getX()+moveX, b:getY()+moveY) == false) then
      return false
    end
  end
  return true
end

function Controller:isGameOver()
  for i,b in ipairs(self.placed) do
    if(b:getY() < 0) then
      return true
    end
  end
   return false
end

function Controller:gameOver()
  self.placed = { }
end

--Checks if there are lines to clear and adjusts the field accordingly
function Controller:checkForLines()
  for ypos=19, -1, -1 do
    local full = true --If no position is free, full will remain true
    for xpos=0, 10, 1 do
      if(self:checkFree(xpos,ypos)) then
        full = false
        break
      end
    end
    if(full) then
      --first make a list of items to remove
      local toRemove = { }
      for i=#self.placed, 1, -1 do
        print(i)
        local blockY = self.placed[i]:getY()
        if(blockY == ypos) then
          table.remove(self.placed, i)
        elseif(blockY < ypos) then
          self.placed[i]:move(0,1)
        end
      end
    end
  end
end