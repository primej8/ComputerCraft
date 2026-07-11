peripheral.find("modem", rednet.open)

settings.load("config.txt")
local target_id = settings.get("target_id")

print("Stoping")
rednet.send(target_id,"stop")