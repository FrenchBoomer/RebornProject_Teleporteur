RegisterServerEvent("RebornProject:VerificationWhiteListe_Serveur")
AddEventHandler("RebornProject:VerificationWhiteListe_Serveur", function()
  local SteamID = GetPlayerIdentifiers(source)[1]
	TriggerClientEvent("RebornProject:VerificationWhiteListe_Client", source, SteamID)
end)

RegisterServerEvent("RebornProject:GestionDeLouverture_Serveur")
AddEventHandler("RebornProject:GestionDeLouverture_Serveur", function(x,y,z)
  TriggerClientEvent("RebornProject:GestionDeLouverture_Client", -1, x, y, z)
end)

RegisterServerEvent("RebornProject:GestionDeLouverture2_Serveur")
AddEventHandler("RebornProject:GestionDeLouverture2_Serveur", function(x,y,z)
  TriggerClientEvent("RebornProject:GestionDeLouverture2_Client", -1, x, y, z)
end)

-- NE PAS TOUCHER !!!

local VersionActuelle = '1.0.1'
local NomGithub = 'RebornProject_Teleporteur'
local Proprietaire = 'Walter White'

PerformHttpRequest('https://raw.githubusercontent.com/WalterWhite84/'.. NomGithub .. '/master/Version', function(Error, NewestVersion, Header)
    print('\n')
    print('\n')
    print('#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#')
    print("## Nom de la ressource : "..NomGithub)
    print('## Production: ' .. Proprietaire)
    print('## Derniere version : ' .. NewestVersion)
    print('## Version en cours : ' .. VersionActuelle)
    print('Lien de telechargement de telechargement du script : https://github.com/WalterWhite84/RebornProject_Teleporteur')
    print('#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#')
    print('\n')
    print('\n')
end)

-- FIN
