View = Object:extend()

function View:new(x, y)
  self.x = x
  self.y = y
end

function View:update(dt)

end

function View:draw()
  love.graphics.setColor(0, 0, 0)
  
  for linehor=0, 20, 1 do
    love.graphics.line(self.x, self.y+blocksize/2+linehor*blocksize, self.x+blocksize*10, self.y+blocksize/2+linehor*blocksize)
  end
  
  for linevert=0, 10, 1 do
      love.graphics.line(self.x+linevert*blocksize, self.y,  self.x+linevert*blocksize, self.y+blocksize*20.5)
  end
end

function View:getX()
  return self.x
end

function View:getY()
  return self.y
end