local isInvincible = false

Citizen.CreateThread(function()
    while true do
        isInvincible = GetPlayerInvincible(PlayerId())
        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        
        local ped = PlayerPedId()
        local player = PlayerId()
        if isInvincible then
            DrawLabel("~r~You are currently in godmode which is ~h~prohibited~h~ on this server, disable it now.")
            FreezeEntityPosition(ped, true)
            DisablePlayerFiring(player, true)
            if IsPedInAnyVehicle(ped, false) then
                FreezeEntityPosition(GetVehiclePedIsIn(ped, false), true)
            end
        else
            FreezeEntityPosition(ped, false)
            if IsPedInAnyVehicle(ped, false) then
                FreezeEntityPosition(GetVehiclePedIsIn(ped, false), false)
            end 
        end
        
        Citizen.Wait(0)
    end
end)

function DrawLabel(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end