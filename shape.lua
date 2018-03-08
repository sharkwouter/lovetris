Shape = Object:extend()

function Shape:new(x, y, shape)
  self.x = x
  self.y = y
  
  self.type = type
  
  self.blocks = {}
  self:setShape(shape)
    
  self.done = false
end

function Shape:update(dt, level)
  for i,b in ipairs(self.blocks) do
    b:update(dt, level)
  end
end

function Shape:draw(viewx, viewy)
  for i,b in ipairs(self.blocks) do
    b:draw(viewx, viewy)
  end
end

function Shape:setShape(shape)
  table.insert(self.blocks, Block(self.x+0, self.y+0, colors.orange))
  table.insert(self.blocks, Block(self.x+1, self.y+0, colors.orange))
  table.insert(self.blocks, Block(self.x+2, self.y+0, colors.orange))
  table.insert(self.blocks, Block(self.x+0, self.y+1, colors.orange))
end

function Shape:move(x,y)
  for i,b in ipairs(self.blocks) do
    b:move(x,y)
  end
end