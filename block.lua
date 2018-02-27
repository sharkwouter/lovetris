Block = Object:extend()

function Block:new(x, y)
  self.x = x
  self.y = y
end

function Block:update(dt)
  self.drawx = self.x*blocksize+self.x
  self.drawy = self.y*blocksize+self.y+blocksize/2
end

function Block:draw(viewx, viewy)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", viewx+self.drawx, viewy+self.drawy, blocksize-1, blocksize-1)
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", viewx+self.drawx, viewy+self.drawy, blocksize-1, blocksize-1)
end