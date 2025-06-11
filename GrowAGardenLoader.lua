-- Professional Loader for Grow A Garden
local repo = "https://raw.githubusercontent.com/thewhitesee/GrowAGardenScript/main/"
local scriptFile = "GrowAGardenMain.lua"

local function fetchScript(url)
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    if success then
        return result
    else
        warn("[GrowAGarden] Failed to fetch the script!")
        return nil
    end
end

local fullUrl = repo .. scriptFile
local scriptContent = fetchScript(fullUrl)

if scriptContent then
    local success, err = pcall(function()
        loadstring(scriptContent)()
    end)
    if not success then
        warn("[GrowAGarden] Error executing script:", err)
    end
else
    warn("[GrowAGarden] Script content is empty.")
end
