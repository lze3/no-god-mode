local isInvincible = false
local isAdmin = false
local player = 0
local ped = 0
local currentVehicle = 0

Citizen.CreateThread(function()
    while true do
        
        player = PlayerId()
        ped = PlayerPedId()
        isInvincible = GetPlayerInvincible(player)
        currentVehicle = IsPedInAnyVehicle(ped, false)
        Citizen.Wait(500)
    end
end)

Citizen.CreateThread(function()
    while true do

        if isInvincible and not isAdmin then
            DrawLabel("~r~You are currently in godmode which is ~h~prohibited~h~ on this server, disable it now.")
            FreezeEntityPosition(ped, true)
            DisablePlayerFiring(player, true) -- true/false - doesn't seem to do anything different, still disables every frame
            if currentVehicle > 0 then
                FreezeEntityPosition(currentVehicle, true)
            end
        else
            FreezeEntityPosition(ped, false)
            if currentVehicle > 0 then
                FreezeEntityPosition(currentVehicle, false)
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
