Controller = Object:extend()

function Controller:new(view)
  self.view = view
  self.currentshape = Shape(3,0,0)
end

function Controller:update(dt)
  self.view:update(dt)
  self.currentshape:update(dt)
end

function Controller:draw()
  self.view:draw()
  self.currentshape:draw(self.view:getX(), self.view:getY())
end