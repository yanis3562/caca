
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.ESX..'esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local JailTime = 0
local inJail = false

RegisterNetEvent("requestRequetteJailTime")
AddEventHandler("requestRequetteJailTime", function(result)
    JailTime = tonumber(result) or 0

    if JailTime <= 0 then
        JailTime = 0
        inJail = false
        RageUI.CloseAll()
    end
end)

RegisterNetEvent("ronflex:menujail")
AddEventHandler("ronflex:menujail", function(time, raison, staffname)
    local mainjail = RageUI.CreateMenu("", "Bienvenue en prison")
    mainjail.Closable = false

    RageUI.Visible(mainjail, true)
    inJail = true

    while mainjail do
        Wait(0)

        -- ✅ KILL SWITCH : si plus en jail -> on ferme et on STOP la boucle
        if tonumber(JailTime) <= 0 then
            JailTime = 0
            inJail = false
            RageUI.Visible(mainjail, false) -- important
            RMenu:DeleteType('mainjail')
            break
        end

        RageUI.IsVisible(mainjail, function()
            RageUI.Button("→ ~s~Vous êtes actuellement en Prison", nil, {}, true, {
                onActive = function()
                    RageUI.Info('Informations :',
                        {'~r~Temps Restants~s~ : ','~r~Raison ~s~: ', '~r~Par le Staff ~s~: '},
                        { ESX.Math.Round(JailTime).." minutes", raison == nil and "Raison inconnu" or raison, staffname == nil and "Console" or staffname }
                    )
                end
            })

            RageUI.Button("→ ~s~Un Staff à fait une erreur ? Allez en BDA", nil, {}, true, {
                onActive = function()
                    RageUI.Info('Informations :',
                        {'~r~Temps Restants~s~ : ','~r~Raison ~s~: ', '~r~Par le Staff ~s~: '},
                        { ESX.Math.Round(JailTime).." minutes", raison == nil and "Raison inconnu" or raison, staffname == nil and "Console" or staffname }
                    )
                end
            })
        end)
    end
end)

Citizen.CreateThread(function()
    Wait(2500)
    TriggerServerEvent("requestjailtime")

    while true do
        if tonumber(JailTime) >= 1 then
            -- on attend 60s, mais on vérifie chaque seconde si on a été unjail
            for i = 1, 60 do
                Wait(1000)
                if tonumber(JailTime) < 1 then
                    break
                end
            end

            -- si on est toujours en jail après les 60 secondes, on décrémente
            if tonumber(JailTime) >= 1 then
                JailTime = JailTime - 1
                TriggerServerEvent("UpdateJailTick", JailTime)
            end
        else
            Wait(1000)
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        if tonumber(JailTime) >= 1 then
            if #(GetEntityCoords(PlayerPedId()) - Config.PointEntrer) > 50 then
                SetEntityCoords(PlayerPedId(), Config.PointEntrer)
            end
            if tonumber(JailTime) == 1 then 
            else
            end
        end
        if tonumber(JailTime) >= 1 then
            Wait(0)
        else
            Wait(2500)
        end
    end
end)

TriggerEvent('chat:addSuggestion', '/jail', 'uid, temps, raison', {
	{ name="uid", help="ID Unique" },
    { name="Temps", help="Temps en minutes" },
    { name="Raison", help="Raison du jail" }
})

TriggerEvent('chat:addSuggestion', '/unjail', 'ID Unique', {
	{ name="uid", help="ID Unique du joueur" },
})