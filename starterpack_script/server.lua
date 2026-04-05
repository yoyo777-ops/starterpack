local items = {
    ['testburger'] = 5,
    ['water'] = 5,

}

lib.callback.register('ClaimStarterPack', function()
    local src = source
    local player = Ox.GetPlayer(src)
    if not player then return false, 'player not found' end


    local playerStateid = player.stateId
    local checkclaimed = MySQL.scalar.await('SELECT stateid FROM starter_claims WHERE stateid = ?', { playerStateid })


    if checkclaimed then
        return false, 'already claimed'
    end

    MySQL.insert('INSERT INTO starter_claims (stateid) VALUES (?)', { playerStateid })

    for key, value in pairs(items) do
        exports.ox_inventory:AddItem(src, key, value)
    end
    return true, 'claimed'
end)

--[[ RegisterNetEvent('ClaimStarterPack', function()
    local src = source
    local player = Ox.GetPlayer(src)
    if not player then return end


    local playerStateid = player.stateId
    local checkclaimed = MySQL.scalar.await('SELECT stateid FROM starter_claims WHERE stateid = ?', { playerStateid })


    if checkclaimed then
        TriggerClientEvent('ox_lib:notify', src,
            { type = 'error', description = 'you have already claimed the starter pack' })
        return
    end

    MySQL.insert('INSERT INTO starter_claims (stateid) VALUES (?)', { playerStateid })

    for key, value in pairs(items) do
        exports.ox_inventory:AddItem(src, key, value)
    end
end)
 ]]
