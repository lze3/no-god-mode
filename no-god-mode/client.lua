local isInvincible = false
local isAdmin = false

Citizen.CreateThread(function()
    while true do
        isInvincible = GetPlayerInvincible(PlayerId())
        isInVeh = IsPedInAnyVehicle(PlayerPedId(), false)
        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do
        
        local ped = PlayerPedId()
        local player = PlayerId()
        if isInvincible and not isAdmin then
            DrawLabel("~r~You are currently in godmode which is ~h~prohibited~h~ on this server, disable it now.")
            FreezeEntityPosition(ped, true)
            DisablePlayerFiring(player, true) -- true/false - doesn't seem to do anything different, still disables every frame
            if isInVeh then
                FreezeEntityPosition(GetVehiclePedIsIn(ped, false), true)
            end
        else
            FreezeEntityPosition(ped, false)
            if isInVeh then
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

RegisterNetEvent("sendAcePermissionToClient")
AddEventHandler("sendAcePermissionToClient", function(state)
    isAdmin = state
end)