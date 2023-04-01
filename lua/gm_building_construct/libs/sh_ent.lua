-- Test func
function PG.Ent:ExplodeNPC(npc)
    if not IsValid(npc) or not npc:IsNPC() then return end

    npc:Ignite(4, 200)

    local explo = ents.Create("env_explosion")
    explo:SetPos(npc:GetPos())
    explo:Spawn()
    explo:Fire("Explode")
    explo:SetKeyValue("IMagnitude", 20)
end
