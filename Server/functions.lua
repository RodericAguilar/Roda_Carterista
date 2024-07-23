
function CheckCops()
    if not Config.NeedCops.enabled then return true end
    local cops = Config.NeedCops.policeJobs
    local copsCount = 0
    for k,v in pairs(cops) do 
        copsCount = #ESX.GetExtendedPlayers('job', v) + copsCount
    end
    return copsCount >= Config.NeedCops.required
end


