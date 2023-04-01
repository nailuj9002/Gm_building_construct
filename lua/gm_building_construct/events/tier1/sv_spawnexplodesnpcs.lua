local eventName = "spawnHatesNPCs"

local function CreateEvent()
    for k, spawnPoint in ipairs(ents.FindByClass("info_player_start")) do
        local pos = spawnPoint:GetPos()
        local pointA = pos + Vector(20, 20, 20)
        local pointB = pos - Vector(20, 20, 20)

        local spawnArea = ents.Create("sev_trigger")
        spawnArea:Setup(PG, eventName, "spawnArea" .. k, pointA, pointB)

        function spawnArea:StartTouch(ent)
            PG.Ent:ExplodeNPC(ent)
        end
    end

    return true
end

PG.Event:SetCall(eventName, CreateEvent)
