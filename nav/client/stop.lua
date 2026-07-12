peripheral.find("modem", rednet.open)

local target_id = settings.get("primej8.target_id")

print("Stopping")
rednet.send(target_id,"stop")
