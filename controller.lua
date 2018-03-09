Controller = Object:extend()

function Controller:new(view, player)
  self.view = view
  self.player = player
  self.currentshape = Shape(3,-1,math.random(6))
  self.droptimer = droptimer
  self.movetimer = movetimer
end

function Controller:update(dt)
  self.view:update(dt)
  self.player:update(dt)
  self.currentshape:update(dt)
  
  --Timer for the current block falling
  self.droptimer = self.droptimer - dt
  
  if self.droptimer < 0 then
    self.currentshape:move(self.player:getMoveX(),1)
    self.droptimer = droptimer
  end
  
end

function Controller:draw()
  self.view:draw()
  self.currentshape:draw(self.view:getX(), self.view:getY())
end