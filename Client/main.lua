ESX = exports['es_extended']:getSharedObject()
exports.ox_target:addGlobalPed({
    label = locale('pickpocket'),
    icon = 'fas fa-user-ninja',
    distance = 1.5,
    canInteract = function(entity, distance)
        local PedType = GetPedType(entity)
        return PedType ~= 28
    end,  
    onSelect = function(data)
        local policeAvailable = lib.callback.await('Roda_Carterista:server:checkCops', false)
        if not policeAvailable then
            ShowNotification(locale('error'), locale('not_enough_cops'), 'error')
            return false
        end
        StartRobbery(data)
    end,
})
