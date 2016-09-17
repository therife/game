game = {}

b = _button:create(500, 500, 80, 60, "step", menu.font, 15, "center")
b2 = _button:create(500, 600, 80, 60, "way", menu.font, 15, "center")

r = 50
m = 15
n = 7
ni = 0
min = 200

map = { {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0},
        {0, 0, 0, 1, 0, 1, 0, 1, 0, 2, 0, 2, 0, 1, 0, 1, 0, 0, 0},
        {0, 0, 1, 0, 1, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0},
        {0, 0, 0, 1, 0, 1, 0, 4, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0},
        {0, 0, 1, 0, 1, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 1, 0, 0},
        {0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0},
        {0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}}

mar = {}

way = {{8, 6}}
wayn = 2

for i = 1, n + 4 do
  mar[i] = {}
  for k = 1, m + 4 do
    if map[i][k] == 1 then
      mar[i][k] = 254
    elseif map[i][k] == 2 then
      mar[i][k] = 255
    elseif map[i][k] == 3 then
      mar[i][k] = 0
    elseif map[i][k] == 4 then
      mar[i][k] = 253
    end
  end
end

function step()
  for i = 3, n + 2 do
    for k = 3, m + 2 do
      if mar[i][k] == ni then
        if mar[i][k - 2] == 254 then
          mar[i][k - 2] = ni + 1
        end
        if mar[i - 1][k - 1] == 254 then
          mar[i - 1][k - 1] = ni + 1
        end
        if mar[i + 1][k - 1] == 254 then
          mar[i + 1][k - 1] = ni + 1
        end
        if mar[i][k + 2] == 254 then
          mar[i][k + 2] = ni + 1
        end
        if mar[i + 1][k + 1] == 254 then
          mar[i + 1][k + 1] = ni + 1
        end
        if mar[i - 1][k + 1] == 254 then
          mar[i - 1][k + 1] = ni + 1
        end
      end
    end
  end
  ni = ni + 1
end

function stepway()
  if mar[way[wayn][1]][way[wayn][2] - 2] < min then
    min = mar[way[wayn][1]][way[wayn][2] - 2]
    way[wayn] = {way[wayn][1], way[wayn][2] - 2}
  end
  if mar[way[wayn][1] - 1][way[wayn][2] - 1] < min then
    min = mar[way[wayn][1] - 1][way[wayn][2] - 1]
    way[wayn] = {way[wayn][1] - 1, way[wayn][2] - 1}
  end
  if mar[way[wayn][1] + 1][way[wayn][2] - 1] < min then
    min = mar[way[wayn][1] + 1][way[wayn][2] - 1]
    way[wayn] = {way[wayn][1] + 1, way[wayn][2] - 1}
  end
  if mar[way[wayn][1]][way[wayn][2] + 2] < min then
    min = mar[way[wayn][1]][way[wayn][2] + 2]
    way[wayn] = {way[wayn][1], way[wayn][2] + 2}
  end
  if mar[way[wayn][1] + 1][way[wayn][2] + 1] < min then
    min = mar[way[wayn][1] + 1][way[wayn][2] + 1]
    way[wayn] = {way[wayn][1] + 1, way[wayn][2] + 1}
  end
  if mar[way[wayn][1] - 1][way[wayn][2] + 1] < min then
    min = mar[way[wayn][1] - 1][way[wayn][2] + 1]
    way[wayn] = {way[wayn][1] - 1, way[wayn][2] + 1}
  end
  wayn = wayn + 1
end

function game.update()
  if b:click() then
    step()
  end
  if b2:click() then
    stepway()
  end
end

function game.draw()
  for i = 3, m + 2 do
    for k = 3, n + 2 do
      if map[k][i] == 1 then
        love.graphics.setColor(150, 150, 150)
        love.graphics.circle("line", i * r / 2, k * r, r / 2)
        --love.graphics.print(tostring(i..":"..k), i * r / 2 - 10, k * r - 10)
      end
      if map[k][i] == 2 then
        love.graphics.setColor(200, 100, 100)
        love.graphics.circle("line", i * r / 2, k * r, r / 2)
        --love.graphics.print(tostring(i..":"..k), i * r / 2 - 10, k * r - 10)
      end
      if map[k][i] == 3 then
        love.graphics.setColor(100, 200, 100)
        love.graphics.circle("line", i * r / 2, k * r, r / 2)
        --love.graphics.print(tostring(i..":"..k), i * r / 2 - 10, k * r - 10)
      end
      if map[k][i] == 4 then
        love.graphics.setColor(50, 150, 50)
        love.graphics.circle("line", i * r / 2, k * r, r / 2)
        --love.graphics.print(tostring(i..":"..k), i * r / 2 - 10, k * r - 10)
      end
      if mar[k][i] ~= nil then
        love.graphics.print(tostring(mar[k][i]), i * r / 2 - 10, k * r - 10)
      end
    end
  end
  for i, k in pairs(way) do
    love.graphics.setColor(100, 100, 150)
    love.graphics.circle("line", k[1] * r / 2, k[2] * r, r / 4)
  end
  b:draw()
  b2:draw()
end
