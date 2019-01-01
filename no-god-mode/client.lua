Citizen.CreateThread(function()

    local player_l = PlayerPedId()
    local ped_l = PlayerId()
    while true do

        if GetPlayerInvincible(ped_l) then
            DrawLabel("~r~You are currently in godmode which is ~h~prohibited~h~ on this server, disable it now.")
            FreezeEntityPosition(player_l, true)
            DisablePlayerFiring(ped_l, true)
            if IsPedInAnyVehicle(player_l, false) then
                FreezeEntityPosition(GetVehiclePedIsIn(player_l, false), true)
            end
        else
            FreezeEntityPosition(player_l, false) 
            DisablePlayerFiring(ped_l, false)      
            if IsPedInAnyVehicle(player_l, false) then
                FreezeEntityPosition(GetVehiclePedIsIn(player_l, false), true)
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