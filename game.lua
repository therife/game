game = {}

b = _button:create(100, 100, 80, 60, "step", menu.font, 15, "center")

p = { {-1, -1, -1, -1, -1, -1, -1},
      {-1,  5,  0,  0,  0,  0, -1},
      {-1,  0,  0,  1,  0,  0, -1},
      {-1,  0,  1,  2,  0,  0, -1},
      {-1,  0,  0,  0,  0,  0, -1},
      {-1, -1, -1, -1, -1, -1, -1}}
pm = 6
pn = 5
x, y = 2, 2

r = { {0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0},
      {0, 0, 0, 0, 0, 0, 0}}
rm = pm
rn = pn

ni = 0
nk = 5

for i = 2, pn do
  for j = 2, pm do
    if p[i][j] == 1 then r[i][j] = 255
    elseif p[i][j] == 0 then r[i][j] = 254
    elseif p[i][j] == 2 then r[i][j] = 0
    elseif p[i][j] == 5 then r[i][j] = 253 end
  end
end
for ni = 0, nk do
  for i = 2, pn do
    for j = 2, pm do
      if r[i][j] == ni then
        if r[i - 1][j] == 253 then
          --p10
        elseif r[i - 1][j] == 254 then
          r[i - 1][j] = ni + 1
        end

        if r[i + 1][j] == 253 then
          --p10
        elseif r[i + 1][j] == 254 then
          r[i + 1][j] = ni + 1
        end

        if r[i][j - 1] == 253 then
          --p10
        elseif r[i][j - 1] == 254 then
          r[i][j - 1] = ni + 1
        end

        if r[i][j + 1] == 253 then
          --p10
        elseif r[i][j + 1] == 254 then
          r[i][j + 1] = ni + 1
        end
      end
    end
  end
end
for i = 1, 1 do
  min = 999
  if min > r[x - 1][y] and r[x - 1][y] ~= 0 then
    min = r[x - 1][y]
    minx = x - 1
    miny = y
  elseif min > r[x + 1][y] and r[x + 1][y] ~= 0 then
    min = r[x + 1][y]
    minx = x + 1
    miny = y
  elseif min > r[x][y - 1] and r[x][y - 1] ~= 0 then
    min = r[x][y - 1]
    minx = x
    miny = y - 1
  elseif min > r[x][y + 1] and r[x][y + 1] ~= 0 then
    min = r[x][y + 1]
    minx = x
    miny = y + 1
  end
  x = minx
  y = miny
end

function game.update()

end
function game.draw()
  for i = 2, pm do
    for k = 2, pn do
      if p[k][i] == 0 then love.graphics.setColor(150, 150, 150)
      elseif p[k][i] == 1 then love.graphics.setColor(250, 250, 250)
      elseif p[k][i] == 2 then love.graphics.setColor(100, 170, 100)
      elseif p[k][i] == 5 then love.graphics.setColor(70, 150, 70) end
      love.graphics.rectangle("line", i * 50 + 400, k * 50 + 200, 45, 45)
      love.graphics.print(r[k][i], i * 50 + 400, k * 50 + 200)
    end
  end
  b:draw()
  love.graphics.print(tostring(min.." - "..x..":"..y), 10, 10)
  love.graphics.print(tostring(min.." - "..minx..":"..miny), 10, 30)
end
