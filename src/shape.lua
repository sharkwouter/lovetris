Shape = Object:extend()

function Shape:new(x, y, shape)
  self.x = x
  self.y = y
  self.shape = shape
  
  self:setShape(self.shape)
end

function Shape:draw(viewx, viewy)
  for i,b in ipairs(self.blocks) do
    b:draw(viewx, viewy)
  end
end

function Shape:setShape(shape)
  --Create the array of blocks in the correct color based on the value of shape
  self.blocks = {}
  if(shape == 1) then
    self.color = colors.orange
    table.insert(self.blocks, Block(self.x+0, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+2, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+0, self.y+1, self.color))
  elseif(shape == 2) then
    self.color = colors.blue
    table.insert(self.blocks, Block(self.x+0, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+2, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+2, self.y+1, self.color))
  elseif(shape == 3) then
    self.color = colors.purple
    table.insert(self.blocks, Block(self.x+0, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+2, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+1, self.color))
  elseif(shape == 4) then
    self.color = colors.red
    table.insert(self.blocks, Block(self.x+1, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+1, self.color))
    table.insert(self.blocks, Block(self.x+0, self.y+1, self.color))
    table.insert(self.blocks, Block(self.x+0, self.y+2, self.color))
  elseif(shape == 5) then
    self.color = colors.green
    table.insert(self.blocks, Block(self.x+0, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+0, self.y+1, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+1, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+2, self.color))
  elseif(shape == 6) then
    self.color = colors.cyan
    table.insert(self.blocks, Block(self.x+0, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+2, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+3, self.y+0, self.color))
  else
    self.color = colors.yellow
    table.insert(self.blocks, Block(self.x+0, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+0, self.color))
    table.insert(self.blocks, Block(self.x+0, self.y+1, self.color))
    table.insert(self.blocks, Block(self.x+1, self.y+1, self.color))
  end
end

function Shape:move(movex,movey)
  --Move this object, otherwise we can't rotate
  self.x = self.x + movex
  self.y = self.y + movey
  
  --Move the blocks which are part of this object
  for i,b in ipairs(self.blocks) do
    b:move(movex,movey)
  end
end

function Shape:rotate(rotation)
  --rotate
  for i,b in ipairs(self.blocks) do
    local startX = b:getX()-self.x
    local startY = b:getY()-self.y
    local rad = math.atan2(startX,startY)-0.5*math.pi+rotation/180*math.pi
    local cos = math.cos(rad)
    local sin = math.sin(rad)
    local distance = math.sqrt(startX*startX+startY*startY)
    
    local moveX = math.floor(self.x+cos*distance+0.5)
    local moveY = math.floor(self.y-sin*distance+0.5)
    b:setPosition(moveX, moveY)
  end
end

function Shape:getBlocks()
  return self.blocks
end

function Shape:getShape()
  print(self.shape)
  return self.shape
end