local args = { ... }
peripheral.find("modem", rednet.open)

settings.load("config.txt")
local target_id = settings.get("target_id")

print("Going to " .. args[1] .. "," .. args[2])
rednet.send(target_id, { tonumber(args[1]), 0, tonumber(args[2]) })
