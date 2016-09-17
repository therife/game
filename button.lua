_button = {}

function _button:create(x, y, w, h, label, font, fontsize, align, color, labelcolor)
  local obj = {}
  obj.x = x
  obj.y = y
  obj.w = w
  obj.h = h
  obj.label = " "..label.." "
  obj.font = love.graphics.newFont(font, fontsize)
  obj.align = align
  obj.color = color or {150, 150, 150}
  obj.labelcolor = labelcolor or {50, 50, 50}
  obj.state = 0

  function obj:click()
    local state = obj.state
    local function pressed()
      return love.mouse.isDown(1)
    end
    local function insert()
      local mx = love.mouse.getX()
      local my = love.mouse.getY()
      local x1 = obj.x
      local x2 = obj.x + obj.w
      local y1 = obj.y
      local y2 = obj.y + obj.h
      if mx > x1 and mx < x2 and my > y1 and my < y2 then
        return true
      else
        return false
      end
    end
    if pressed() and not insert() and state ~= 2 then
      state = -1
    elseif not pressed() and not insert() then
      state = 0
    elseif not pressed() and insert() and (state == 0 or state == -1) then
      state = 1
    elseif pressed() and insert() and state == 1 then
      state = 2
    elseif not pressed() and insert() and state == 2 then
      state = 1
      obj.state = state
      return true
    end
    obj.state = state
  end

  function obj:draw()
    love.graphics.setColor(obj.color)
    love.graphics.rectangle("fill", obj.x, obj.y, obj.w, obj.h)
    love.graphics.setColor(obj.labelcolor)
    love.graphics.setFont(obj.font)
    love.graphics.printf(obj.label, obj.x, obj.y + obj.h / 2 - obj.font:getHeight() / 2, obj.w, obj.align)
  end

  setmetatable(obj, self)
  self.__index = self
  return obj
end
