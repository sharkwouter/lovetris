Shape = Object:extend()

function Shape:new(x, y, rotation)
  self.x = x
  self.y = y
  
  self.type = type
  self.blocks = {}
    table.insert(self.blocks, Block(self.x+0, self.y+0))
    table.insert(self.blocks, Block(self.x+1, self.y+0))
    table.insert(self.blocks, Block(self.x+2, self.y+0))
    table.insert(self.blocks, Block(self.x+0, self.y+1)) 
end

function Shape:update(dt)
  for i,b in ipairs(self.blocks) do
        b:update(dt)
    end
end

function Shape:draw()
  for i,b in ipairs(self.blocks) do
        b:draw()
    end
end

function Shape:rotate(direction)
  
end

function Shape:setShape()
  
end