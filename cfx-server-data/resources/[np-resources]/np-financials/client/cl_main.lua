RegisterNetEvent("financial:openUI", function()
    local isNearATM = isNearATM()

    if isNearATM then
        financialAnimation(isNearATM, true)
        Citizen.Wait(1400)
        Wait(50)

        SetNuiFocus(true, true)

        SendNUIMessage({
            type = "open",
            character_id = RPC.execute("np-base:getCharDetails").id,
            account_id = nil,
            account_name = nil
        })
        -- exports["np-ui"]:openApplication("atm")
    end
end)

RegisterNUICallback("close", function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("np-ui:getCash", function(data, cb)
    local cash = RPC.execute("np-financials:getCurrentCash")
    cb(cash)
end)
