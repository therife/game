menu = {}
menu.font = "fonts/button.ttf"
menu.state = "main"
menu.btnstart = _button:create(100, 100, 200, 40, "PLAY", menu.font, 20, "center")
menu.btnsets = _button:create(100, 200, 200, 40, "SETTINGS", menu.font, 20, "center")
menu.btnexit = _button:create(100, 300, 200, 40, "EXIT", menu.font, 20, "center")
menu.btnback = _button:create(100, 500, 200, 40, "BACK", menu.font, 20, "center")

function menu.update()
  if menu.state == "main" then
    if menu.btnstart:click() then
      gamestate = "game"
    elseif menu.btnsets:click() then
      menu.state = "sets"
    elseif menu.btnexit:click() then
      love.event.quit()
    end
  elseif menu.state == "sets" then
    if menu.btnback:click() then
      menu.state = "main"
    end
  end
end

function menu.draw()
  if menu.state == "main" then
    menu.btnstart:draw()
    menu.btnsets:draw()
    menu.btnexit:draw()
  elseif menu.state == "sets" then
    menu.btnback:draw()
  end
end
