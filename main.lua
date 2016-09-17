require "button"
require "menu"
require "game"

function love.load()
  gamestate = "game"
end

function love.update(dt)
  if gamestate == "menu" then
    menu.update()
  elseif gamestate == "game" then
    game.update()
  end
end

function love.draw()
  if gamestate == "menu" then
    menu.draw()
  elseif gamestate == "game" then
    game.draw()
  end
end
