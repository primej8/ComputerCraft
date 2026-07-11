peripheral.find("modem", rednet.open)

local nav = peripheral.find("navigation_table")
local relay = peripheral.find("redstone_relay")

local target = nil

print("Waiting for location")

while true do
    local id, message = rednet.receive(0.1)
    if message then
        if type(message[1]) == "number" and type(message[2]) == "number" then
            target = vector.new(message[1], 0, message[2])
            print("Going to " .. message[1] .. "," .. message[2])
        elseif message == "stop" then
            target = nil
            print("Stoped tracking")
        end
    end
    if target then
        local pos = vector.new(gps.locate())

        local offset = target - pos

        local heading = nav.getHeadingRad()
        local sin_h = math.sin(heading)
        local cos_h = math.cos(heading)

        local offset_v = vector.new(
            offset.x * cos_h - offset.z * sin_h,
            0,
            offset.x * sin_h + offset.z * cos_h)

        local offset_n = offset_v:normalize() * 15

        local offset_r = vector.new(
            math.floor(offset_n.x + 0.5),
            0,
            math.floor(offset_n.z + 0.5))

        if offset_r.x > 0 then
            relay.setOutput("right", false)
            relay.setAnalogOutput("left", offset_r.x)
        elseif offset_r.x < 0 then
            relay.setOutput("left", false)
            relay.setAnalogOutput("right", -offset_r.x)
        else
            relay.setOutput("right", false)
            relay.setOutput("left", false)
        end

        if offset_r.z > 0 then
            relay.setOutput("back", false)
            relay.setAnalogOutput("front", offset_r.z)
        elseif offset_r.z < 0 then
            relay.setOutput("front", false)
            relay.setAnalogOutput("back", -offset_r.z)
        else
            relay.setOutput("front", false)
            relay.setOutput("back", false)
        end
    else
        relay.setOutput("front", false)
        relay.setOutput("back", false)
        relay.setOutput("right", false)
        relay.setOutput("left", false)
    end
end
