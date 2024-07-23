local CoolDownTime = {}

function checkCooldown()
    local source = GetPlayerServerId(PlayerId())
    if CoolDownTime[source] then
        local time = GetGameTimer()
        if CoolDownTime[source] > time then
            local timeLeft = (CoolDownTime[source] - GetGameTimer()) / 1000
            timeLeft = tostring(ESX.Math.Round(timeLeft))
            ShowNotification(locale('error'), locale('cooldown', timeLeft), 'error')
            return true
        end
    end
    CoolDownTime[source] = GetGameTimer() + Config.CoolDown * 1000
    return false
end

function CreateNpc()
    lib.requestModel('g_m_y_ballaeast_01')
    local coords = GetEntityCoords(cache.ped)
    local npcCreated = CreatePed(1, 'g_m_y_ballaeast_01', coords.x, coords.y, coords.z, 0, false, false)
end

RegisterCommand('createnpc', function()
    CreateNpc()
end)

function callPolice()
    -- Here you can add your own police call system
end

function StartRobbery(data)
    local robberyFinish = false
    if checkCooldown() then return end
    callPolice()
    local pCoords, victimCoords
    CreateThread(function()
        while true do
            if robberyFinish then
                break
            end
            pCoords = GetEntityCoords(cache.ped)
            victimCoords = GetEntityCoords(data.entity)
            if #(pCoords - victimCoords) > 2 then
                lib.cancelProgress()
                break
            end
            Wait(0)
        end
    end)
    if lib.progressCircle({
        duration = Config.StealDuration * 1000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
        },
        anim = {
            dict = 'missexile3',
            clip = 'ex03_dingy_search_case_base_michael'
        },
    }) then 
        local giveItems = lib.callback.await('Roda_Carterista:server:getReward', false, NetworkGetNetworkIdFromEntity(data.entity))
        if not giveItems then
            ShowNotification(locale('error'), locale('no_items'), 'error')
            return
        end
        ShowNotification(locale('success'), locale('robbery_successful'), 'success')
        robberyFinish = true
    else 
        ShowNotification(locale('error'), locale('robbery_canceled'), 'error')
    end
end


function ShowNotification(title, text, type)
    if not text then return end
    if not title then 
        title = GetCurrentResourceName()
    end
    if not type then 
        type = 'inform'
    end
    lib.notify({
        title = title,
        description = text,
        type = type,
        position = 'center-right',
    })
end

RegisterNetEvent('Roda_Carterista:client:showNotification')
AddEventHandler('Roda_Carterista:client:showNotification', ShowNotification)
