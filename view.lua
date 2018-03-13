View = Object:extend()

function View:new(x, y)
  self.x = x
  self.y = y
  self.width = blocksize*10
  self.height = blocksize*20.5
  
  --Resize the window if needed
  self.widthWindow = love.graphics.getWidth()
  self.heightWindow = love.graphics.getHeight()
  
  self.widthRequired = self.x+self.width+blocksize
  self.heightRequired = self.y+self.height+blocksize

  if self.widthWindow < self.widthRequired then
    self.widthWindow = self.widthRequired
  end
  
  if self.heightWindow < self.heightRequired then
    self.heightWindow = self.heightRequired
  end
  
  love.window.setMode(self.widthWindow, self.heightWindow)
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
end

function View:getX()
  return self.x
end

function View:getY()
  return self.y
end