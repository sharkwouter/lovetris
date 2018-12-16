View = Object:extend()

function View:new(x, y)
  self.x = x
  self.y = y
  self.width = blocksize*10
  self.height = blocksize*20.5
  
  --Variables for information at the side
  self.linesCleared = 0
  self.nextNr = 4
  self.nextshape= Shape(12, 2, math.random(7))
  self.savedshape = -1
end

function View:update(dt)
end

function View:draw()
  --Draw the field
  love.graphics.setColor(colors.black)
  
  for linehor=0, 20, 1 do
    love.graphics.line(self.x, self.y+blocksize/2+linehor*blocksize, self.x+self.width, self.y+blocksize/2+linehor*blocksize)
  end
  
  for linevert=0, 10, 1 do
      love.graphics.line(self.x+linevert*blocksize, self.y,  self.x+linevert*blocksize, self.y+self.height)
  end
  
  --Draw text
  love.graphics.printf(self.linesCleared.." lines", self.x+self.width+blocksize/2, self.y, blocksize*4, "left")
  
  --Draw our shape
  self.nextshape:draw(self.x, self.y)
end

function View:getX()
  return self.x
end

function View:getY()
  return self.y
end

function View:getNextshape()
  local s = self.nextshape:getShape()
  self.nextshape = Shape(12, 2, math.random(7))
  return s
end

function View:lineCleared()
    self.linesCleared = self.linesCleared + 1
end  