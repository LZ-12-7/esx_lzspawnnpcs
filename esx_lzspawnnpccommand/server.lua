local ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('lz_spawnnpccommand:checkAdmin', function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player.getGroup() ~= 'user' then -- si el rango del usuario es diferente a usuario
        cb(true) -- le decimos que si
    else
        cb(false) -- le decimos que no
    end
end)
