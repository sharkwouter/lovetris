Controller = Object:extend()

function Controller:new(view)
  self.view = view
  self.currentshape = Shape(3,-1,0)
  self.level = 0
end

function Controller:update(dt)
  self.view:update(dt)
  self.currentshape:update(dt, self.level)
end

function Controller:draw()
  self.view:draw()
  self.currentshape:draw(self.view:getX(), self.view:getY())
end