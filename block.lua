Block = Object:extend()

function Block:new(x, y)
  self.x = x
  self.y = y
  self.timer = 1
end

function Block:update(dt, level)
  
  --timer
  self.timer = self.timer - dt
  
  if self.timer < 0 then
    self.y = self.y +1
    self.timer = 1-level*80
  end
  
  self.drawx = self.x*blocksize
  self.drawy = self.y*blocksize+blocksize/2
end

function Block:draw(viewx, viewy)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", viewx+self.drawx, viewy+self.drawy, blocksize-1, blocksize-1)
  love.graphics.setColor(255, 0, 0)
  love.graphics.rectangle("fill", viewx+self.drawx, viewy+self.drawy, blocksize-1, blocksize-1)
end