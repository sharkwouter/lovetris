Block = Object:extend()

function Block:new(x, y, color)
  self.x = x
  self.y = y
  self.color = color
end

function Block:update(dt, level)
  self.drawx = self.x*blocksize
  self.drawy = self.y*blocksize+blocksize/2
end

function Block:draw(viewx, viewy)
  love.graphics.setColor(colors.black)
  love.graphics.rectangle("line", viewx+self.drawx, viewy+self.drawy, blocksize-1, blocksize-1)
  love.graphics.setColor(self.color)
  love.graphics.rectangle("fill", viewx+self.drawx, viewy+self.drawy, blocksize-1, blocksize-1)
end

function Block:move(movex,movey)
  self.x = self.x +movex
  self.y = self.y + movey
end