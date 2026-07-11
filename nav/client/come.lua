peripheral.find("modem", rednet.open)

local target_id = settings.get("primej8.target_id")

while true do
    g_x, g_y, g_z = gps.locate()
    x = math.floor(g_x + 0.5)
    z = math.floor(g_z + 0.5)

    if x ~= l_x or z ~= l_z then
        l_x = x
        l_z = z

        term.clear()
        term.setCursorPos(1, 1)
        print("Going to " .. x .. "," .. z)

        rednet.send(target_id, { x, z })
    end
    sleep(0.1)
end
