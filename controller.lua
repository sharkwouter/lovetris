Controller = Object:extend()

function Controller:new(view)
  self.view = view
  self.currentshape = Shape(3,-1,0)
  self.droptimer = droptimer
end

function Controller:update(dt)
  self.view:update(dt)
  self.currentshape:update(dt, self.level)
  
  --Timer for the current block falling
  self.droptimer = self.droptimer - dt
  
  if self.droptimer < 0 then
    self.currentshape:move(0,1)
    self.droptimer = droptimer
  end
  
end

function Controller:draw()
  self.view:draw()
  self.currentshape:draw(self.view:getX(), self.view:getY())
end