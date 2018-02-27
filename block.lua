Block = Object:extend()

function Block:new(x, y)
  self.x = x
  self.y = y
end

function Block:update(dt)
  self.drawx = self.x*blocksize+self.x
  self.drawy = self.y*blocksize+self.y
  
  --self.y=self.y+fallspeed*dt
end

function Block:draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", self.drawx, self.drawy, blocksize, blocksize)
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", self.drawx, self.drawy, blocksize, blocksize)
end