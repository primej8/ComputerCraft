local args = { ... }
peripheral.find("modem", rednet.open)

local target_id = settings.get("primej8.target_id")

print("Going to " .. args[1] .. "," .. args[2])
rednet.send(target_id, { tonumber(args[1]), 0, tonumber(args[2]) })
