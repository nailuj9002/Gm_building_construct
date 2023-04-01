--[[
    Anomaly Research Center (A.R.C.) Exploration
    Revealing and exposing curses.
]]

PG = {
    id = "gm_building_construct",
    luaFolder = "gm_building_construct",
    dataFolder = "gm_building_construct",
    maps = { "gm_construct", "gm_flatgrass", "gm_construct_13_beta" },
    enableEvents = true,
    Ent = {}
}

PG.isValidMap = table.HasValue(PG.maps, game.GetMap())

-- Hotload Sandbox Events System (SandEv or SEv)
hook.Add("OnGamemodeLoaded", "SEv_init", function()
    if SEv then return end
    file.CreateDir("sandev")
    timer.Simple(0, function()
        http.Fetch("https://raw.githubusercontent.com/Xalalau/SandEv/main/lua/sandev/init/autohotloader.lua", function(SEvHotloader)
            file.Write("sandev/sevloader.txt", SEvHotloader)
            RunString(SEvHotloader)
            StartSEvHotload(false)
        end, function()
            local SEvHotloader = file.Read("sandev/sevloader.txt", "DATA")
            if SEvHotloader then
                RunString(SEvHotloader, "DATA")
                StartSEvHotload(false)
            end
        end)
    end)
end)

hook.Add("sandev_init", PG.luaFolder, function(SEv)
    SEv:AddInstance(PG)
end)