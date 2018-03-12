Block = Object:extend()

function Block:new(x, y, color)
  self.x = x
  self.y = y
  self.color = color
end

function Block:update(dt)
end

function Block:draw(viewx, viewy)
  love.graphics.setColor(colors.black)
  love.graphics.rectangle("line", viewx+self.x*blocksize, viewy+self.y*blocksize+blocksize/2, blocksize-1, blocksize-1)
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", viewx+self.x*blocksize, viewy+self.y*blocksize+blocksize/2, blocksize-1, blocksize-1)
end

function Block:move(movex,movey)
  self.x = self.x +movex
  self.y = self.y + movey
end

function Block:getX()
  return self.x
end

function Block:getY()
  return self.y
end