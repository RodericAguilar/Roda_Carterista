ESX = exports['es_extended']:getSharedObject()

CreateThread(function()
    print('Script made by ^1Roda team^0 | https://roda.tebex.io')
end)

lib.callback.register('Roda_Carterista:server:checkCops', function(source)
    local copsOnline = CheckCops()
    return copsOnline
end)

lib.callback.register('Roda_Carterista:server:getReward', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local rewards = Config.Rewards 
    if not rewards then
        return false
    end
    if rewards.items then 
        if next(rewards.items) then
            local itemToGive = getRandomReward(rewards.items)
            xPlayer.addInventoryItem(itemToGive.item, math.random(itemToGive.min, itemToGive.max))
        end
    end
    if rewards.money then 
        if next(rewards.money) then
            local moneyToGive = getRandomReward(rewards.money)
            xPlayer.addAccountMoney(moneyToGive.account, math.random(moneyToGive.min, moneyToGive.max))
        end
    end
    return true
end)

function getRandomReward(tableInfo)
    local random = math.random(1, #tableInfo)
    return tableInfo[random]
end