peripheral.find("modem", rednet.open)

local target_id = settings.get("primej8.target_id")

print("Stoping")
rednet.send(target_id,"stop")