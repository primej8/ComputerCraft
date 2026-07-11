local args = { ... }

local urls = {
    "https://raw.githubusercontent.com/primej8/ComputerCraft/refs/heads/main/nav/client/goto.lua",
    "https://raw.githubusercontent.com/primej8/ComputerCraft/refs/heads/main/nav/client/come.lua",
    "https://raw.githubusercontent.com/primej8/ComputerCraft/refs/heads/main/nav/client/stop.lua"
}
for i, l in ipairs(urls) do
    shell.run("wget", l)
end

settings.define("primej8.target_id", {
    description = "ID of computer to control",
    type = "number"
})

if #args > 0 then
    local target_id = tonumber(args[1])
    if target_id then
        settings.set("primej8.target_id", target_id)
        settings.save()
    else
        print("Incorect arguments")
    end
elseif settings.get("primej8.target_id") == nil then
    print("No target computer config please run set primej8.target_id {id}")
end
