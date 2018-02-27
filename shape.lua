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

function Shape:rotate(direction)
  
end

function Shape:setShape()
  
end