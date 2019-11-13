if Langue == "fr" then
    LangueChoisie = Locales.fr
elseif Langue == "en" then
    LangueChoisie = Locales.en
elseif Langue == "es" then
    LangueChoisie = Locales.es
end

local function RGB(frequence)
    local result = {}
    local temps = GetGameTimer() / 1000
    result.r = math.floor( math.sin( temps * frequence + 0 ) * 127 + 128 )
    result.g = math.floor( math.sin( temps * frequence + 2 ) * 127 + 128 )
    result.b = math.floor( math.sin( temps * frequence + 4 ) * 127 + 128 )
    return result
end

RegisterNetEvent("RebornProject:DisplayHelpText")
AddEventHandler('RebornProject:DisplayHelpText', function(texte)
    SetTextComponentFormat("STRING")
    AddTextComponentString(texte)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end)

RegisterNetEvent("RebornProject:notif")
AddEventHandler('RebornProject:notif', function(texte)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(texte)
    DrawNotification(true, false)
end)

RegisterNetEvent("RebornProject:VerificationWhiteListe_Client")
AddEventHandler('RebornProject:VerificationWhiteListe_Client', function(SteamID)
    for _, item in pairs(ListeBlanche) do
        if SteamID == item.steam then
            Administration = true
        end
    end
end)

RegisterNetEvent("RebornProject:GestionDeLouverture_Client")
AddEventHandler('RebornProject:GestionDeLouverture_Client', function(x, y, z)
    for i=1, #Coordonnees do
        if x == Coordonnees[i].x1 and y == Coordonnees[i].y1 and z == Coordonnees[i].z1 then
            if Coordonnees[i].verrouiller == false then
                Coordonnees[i].verrouiller = true
            else
                Coordonnees[i].verrouiller = false
            end
        end
    end
end)

RegisterNetEvent("RebornProject:GestionDeLouverture2_Client")
AddEventHandler('RebornProject:GestionDeLouverture2_Client', function(x, y, z)
    for i=1, #Coordonnees do
        if x == Coordonnees[i].x2 and y == Coordonnees[i].y2 and z == Coordonnees[i].z2 then
            if Coordonnees[i].verrouiller == false then
                Coordonnees[i].verrouiller = true
            else
                Coordonnees[i].verrouiller = false
            end
        end
    end
end)

function TexteFlotant(x,y,z, texte) 
    local Ecran,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
    local taille = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*130
    local taille = taille*fov
    if Ecran then
        SetTextScale(0.2*taille, 0.5*taille)
        SetTextFont(1)
        SetTextProportional(1)
        local Couleur = RGB(2)
        SetTextColour(Couleur.r, Couleur.g, Couleur.b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(texte)
        World3dToScreen2d(x,y,z, 0) 
        DrawText(_x,_y)
    end

end

function TeleportationDuJoueur()
    for i=1, #Coordonnees do
        local targetPed = GetPlayerPed(-1)
        if GetDistanceBetweenCoords(GetEntityCoords(targetPed), Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1, true) < 0.8009 then
            if timer == 0 then
                if Coordonnees[i].vehicule == true then
                    if IsPedInAnyVehicle(targetPed) then
                        DoScreenFadeOut(2000)
                        while IsScreenFadingOut() do Wait(0) end
                        NetworkFadeOutEntity(targetPed, true, false)
                        Wait(2000)
                        targetPed = GetVehiclePedIsUsing(targetPed)
                        SetEntityCoords(targetPed, Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2)
                        SetEntityHeading(targetPed, Coordonnees[i].h2)
                        NetworkFadeInEntity(targetPed, 0)
                        Wait(2000)
                        current_coords = i
                        timer = 5
                        SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                        DoScreenFadeIn(2000)
                        while IsScreenFadingIn() do Wait(0) end
                    else
                        DoScreenFadeOut(2000)
                        while IsScreenFadingOut() do Wait(0) end
                        NetworkFadeOutEntity(targetPed, true, false)
                        Wait(2000)
                        SetEntityCoords(targetPed, Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2)
                        SetEntityHeading(targetPed, Coordonnees[i].h2)
                        NetworkFadeInEntity(targetPed, 0)
                        Wait(2000)
                        current_coords = i
                        timer = 5
                        SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                        DoScreenFadeIn(2000)
                        while IsScreenFadingIn() do Wait(0) end
                    end
                else
                    if IsPedInAnyVehicle(targetPed) then
                       TriggerEvent("RebornProject:notif", LangueChoisie.refusvehicule)
                    else
                        DoScreenFadeOut(2000)
                        while IsScreenFadingOut() do Wait(0) end
                        NetworkFadeOutEntity(targetPed, true, false)
                        Wait(2000)
                        SetEntityCoords(targetPed, Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2)
                        SetEntityHeading(targetPed, Coordonnees[i].h2)
                        NetworkFadeInEntity(targetPed, 0)
                        Wait(2000)
                        current_coords = i
                        timer = 5
                        SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                        DoScreenFadeIn(2000)
                        while IsScreenFadingIn() do Wait(0) end
                    end
                end
            end
        end
    end
end

function TeleportationDuJoueur2()
    for i=1, #Coordonnees do
        local targetPed = GetPlayerPed(-1)
        if GetDistanceBetweenCoords(GetEntityCoords(targetPed), Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2, true) < 0.8009 then
            if timer == 0 then
                if Coordonnees[i].vehicule == true then
                    if IsPedInAnyVehicle(targetPed) then
                        DoScreenFadeOut(2000)
                        while IsScreenFadingOut() do Wait(0) end
                        NetworkFadeOutEntity(targetPed, true, false)
                        Wait(2000)
                        targetPed = GetVehiclePedIsUsing(targetPed)
                        SetEntityCoords(targetPed, Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1)
                        SetEntityHeading(targetPed, Coordonnees[i].h1)
                        NetworkFadeInEntity(targetPed, 0)
                        Wait(2000)
                        current_coords = i
                        timer = 5
                        SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                        DoScreenFadeIn(2000)
                        while IsScreenFadingIn() do Wait(0) end
                    else
                        DoScreenFadeOut(2000)
                        while IsScreenFadingOut() do Wait(0) end
                        NetworkFadeOutEntity(targetPed, true, false)
                        Wait(2000)
                        SetEntityCoords(targetPed, Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1)
                        SetEntityHeading(targetPed, Coordonnees[i].h1)
                        NetworkFadeInEntity(targetPed, 0)
                        Wait(2000)
                        current_coords = i
                        timer = 5
                        SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                        DoScreenFadeIn(2000)
                        while IsScreenFadingIn() do Wait(0) end
                    end
                else
                    if IsPedInAnyVehicle(targetPed) then
                       TriggerEvent("RebornProject:notif", LangueChoisie.refusvehicule)
                    else
                        DoScreenFadeOut(2000)
                        while IsScreenFadingOut() do Wait(0) end
                        NetworkFadeOutEntity(targetPed, true, false)
                        Wait(2000)
                        SetEntityCoords(targetPed, Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1)
                        SetEntityHeading(targetPed, Coordonnees[i].h1)
                        NetworkFadeInEntity(targetPed, 0)
                        Wait(2000)
                        current_coords = i
                        timer = 5
                        SimulatePlayerInputGait(PlayerId(), 1.0, 100, 1.0, 1, 0)
                        DoScreenFadeIn(2000)
                        while IsScreenFadingIn() do Wait(0) end
                    end
                end
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if timer > 0 then
            timer=timer-1
            if timer == 0 then current_coords = 0 end
        end
    end
end)

Citizen.CreateThread(function()
    if ActivationBlip == true then
        for _, item in pairs(Coordonnees) do
            item.blip = AddBlipForCoord(item.x1, item.y1, item.z1)
            SetBlipSprite(item.blip, BlipID)
            SetBlipAsShortRange(item.blip, true)
            SetBlipColour(item.blip, BlipCouleur)
            SetBlipScale(item.blip, BlipTaille)
            SetBlipDisplay(item.blip, 2)
            SetBlipFlashes(item.blip, BlipClignotant)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(item.nom)
            EndTextCommandSetBlipName(item.blip)
            item.blip2 = AddBlipForCoord(item.x2, item.y2, item.z2)
            SetBlipSprite(item.blip2, BlipID)
            SetBlipAsShortRange(item.blip2, true)
            SetBlipColour(item.blip2, BlipCouleur)
            SetBlipScale(item.blip2, BlipTaille)
            SetBlipDisplay(item.blip2, 2)
            SetBlipFlashes(item.blip2, BlipClignotant)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(item.nom)
            EndTextCommandSetBlipName(item.blip2)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Wait(0)
        for i=1, #Coordonnees do
            if (GetDistanceBetweenCoords(Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1, GetEntityCoords(PlayerPedId())) < 5.001) and Coordonnees[i].verrouiller == true then
                    DrawMarker(27, Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1-1.0001, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 0.5001, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            end
            if (GetDistanceBetweenCoords(Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1, GetEntityCoords(PlayerPedId())) < 5.001) and Coordonnees[i].verrouiller == false then
                    DrawMarker(27, Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1-1.0001, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 0.5001, 0, 255, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            end
            if (GetDistanceBetweenCoords(Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2, GetEntityCoords(PlayerPedId())) < 5.001) and Coordonnees[i].verrouiller == true then
                    DrawMarker(27, Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2-1.0001, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 0.5001, 255, 0, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            end
            if (GetDistanceBetweenCoords(Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2, GetEntityCoords(PlayerPedId())) < 5.001) and Coordonnees[i].verrouiller == false then
                    DrawMarker(27, Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2-1.0001, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 0.5001, 0, 255, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            end
            if (GetDistanceBetweenCoords(Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2, GetEntityCoords(PlayerPedId())) < 5.001) and Coordonnees[i].verrouiller == false then
                    DrawMarker(27, Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2-1.0001, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 0.5001, 0, 255, 0, 255, 0, 0, 0, 1, 0, 0, 0)
            end
            if (GetDistanceBetweenCoords(Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1, GetEntityCoords(PlayerPedId())) < 0.499) and Coordonnees[i].verrouiller == false then
                TeleportationDuJoueur()
            end
            if (GetDistanceBetweenCoords(Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2, GetEntityCoords(PlayerPedId())) < 0.499) and Coordonnees[i].verrouiller == false then
                TeleportationDuJoueur2()
            end
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Coordonnees[i].x1,Coordonnees[i].y1,Coordonnees[i].z1, true) < 5.001 then
                if AffichageDuTexteFlotant == true then
                    if Coordonnees[i].verrouiller == true then
                        TexteFlotant(Coordonnees[i].x1, Coordonnees[i].y1, Coordonnees[i].z1, Coordonnees[i].nom.. " 🔒")
                        TriggerEvent("RebornProject:DisplayHelpText", LangueChoisie.ouvrir)
                    else
                        TexteFlotant(Coordonnees[i].x1, Coordonnees[i].y1, Coordonnees[i].z1, Coordonnees[i].nom.. " 🔓")
                        TriggerEvent("RebornProject:DisplayHelpText", LangueChoisie.fermer)
                    end
                end
                if IsControlJustPressed(1, ToucheClavier) then
                    TriggerServerEvent("RebornProject:VerificationWhiteListe_Serveur")
                    Wait(200)
                    if Coordonnees[i].whiteliste == true then
                        if Administration == true then
                            TriggerServerEvent("RebornProject:GestionDeLouverture_Serveur", Coordonnees[i].x1, Coordonnees[i].y1, Coordonnees[i].z1)
                            PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "BOMB_DISARMED", "GTAO_SPEED_CONVOY_SOUNDSET", 0, 0, 1)
                        else
                            TriggerEvent("RebornProject:notif", LangueChoisie.notifwhiteliste)
                            PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
                        end
                    else
                        TriggerServerEvent("RebornProject:GestionDeLouverture_Serveur", Coordonnees[i].x1, Coordonnees[i].y1, Coordonnees[i].z1)
                        PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "BOMB_DISARMED", "GTAO_SPEED_CONVOY_SOUNDSET", 0, 0, 1)
                    end
                end
            end
            if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), Coordonnees[i].x2,Coordonnees[i].y2,Coordonnees[i].z2, true) < 5.001 then
                if AffichageDuTexteFlotant == true then
                    if Coordonnees[i].verrouiller == true then
                        TexteFlotant(Coordonnees[i].x2, Coordonnees[i].y2, Coordonnees[i].z2, Coordonnees[i].nom.. " 🔒")
                        TriggerEvent("RebornProject:DisplayHelpText", LangueChoisie.ouvrir)
                    else
                        TexteFlotant(Coordonnees[i].x2, Coordonnees[i].y2, Coordonnees[i].z2, Coordonnees[i].nom.. " 🔓")
                        TriggerEvent("RebornProject:DisplayHelpText", LangueChoisie.fermer)
                    end
                end
                if IsControlJustPressed(1, ToucheClavier) then
                    TriggerServerEvent("RebornProject:VerificationWhiteListe_Serveur")
                    Wait(200)
                    if Coordonnees[i].whiteliste == true then
                        if Administration == true then
                            TriggerServerEvent("RebornProject:GestionDeLouverture2_Serveur", Coordonnees[i].x2, Coordonnees[i].y2, Coordonnees[i].z2)
                            PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "BOMB_DISARMED", "GTAO_SPEED_CONVOY_SOUNDSET", 0, 0, 1)
                        else
                            TriggerEvent("RebornProject:notif", LangueChoisie.notifwhiteliste)
                            PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
                        end
                    else
                        TriggerServerEvent("RebornProject:GestionDeLouverture2_Serveur", Coordonnees[i].x2, Coordonnees[i].y2, Coordonnees[i].z2)
                        PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "BOMB_DISARMED", "GTAO_SPEED_CONVOY_SOUNDSET", 0, 0, 1)
                    end
                end
            end
        end
    end
end)
