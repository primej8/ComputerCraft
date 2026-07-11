local args = { ... }

local urls = {
    "raw.githubusercontent.com/primej8/ComputerCraft/refs/heads/main/nav/client/goto.lua",
    "raw.githubusercontent.com/primej8/ComputerCraft/refs/heads/main/nav/client/come.lua",
    "raw.githubusercontent.com/primej8/ComputerCraft/refs/heads/main/nav/client/stop.lua"
}
for l in urls do
    shell.run("wget", l)
end

settings.define("primej8.target_id", {
    description = "ID of computer to control",
    type = "number"
})

if #args > 0 then
    if type(args[1] == "number") then
        settings.save()
    else
        print("Incorect arguments")
    end
elseif settings.get("primej8.target_id") == nil then
    print("No target computer config please run set primej8.target_id {id}")
end
