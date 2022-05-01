local ESX = exports['es_extended']:getSharedObject()

RegisterCommand('spawnnpc', function(source, args, rawCommand)
    ESX.TriggerServerCallback('lz_spawnnpccommand:checkAdmin', function(isAdmin)
        local Player = PlayerPedId()
        local pedcoords = GetEntityCoords(Player)
        local pedheading = GetEntityHeading(Player)
        if isAdmin then
            if args[1] then
                SpawnNPC(args[1], pedcoords, pedheading)
            elseif args[1] == nil then
                TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Tienes que poner /spawnnpc [modelo], si no no vas a spawnear nada")
            end
        else
            TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "No tienes permisos para spawnear NPCs")
        end
    end)
end)

SpawnNPC = function(modelo, x,y,z,h)
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    crearNPC = CreatePed(5, hash, x,y,z, h, false, false)
end

--[[RegisterCommand('spawnnpc', function(source, args, rawCommand)
    local Player = PlayerPedId()
    local pedcoords = GetEntityCoords(Player)
    local pedheading = GetEntityHeading(Player)
    if ESX.GetPlayerData().
    if args[1] then
        SpawnNPC(args[1], pedcoords, pedheading)
    elseif args[1] == nil then
        TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, "Tienes que poner /spawnnpc [modelo], si no no vas a spawnear nada")
    end

end)]]--