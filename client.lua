ESX = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) 
			ESX = obj 
		end)
		Citizen.Wait(250)
	end
end)

antyCL = false

RegisterNetEvent('luzz:block')
AddEventHandler('luzz:block', function()
	local AntyClTime = 2 * 60 * 1000 -- 2 minuty
	local playerPed = PlayerPedId()
	antyCL = true
	TriggerServerEvent("luzz:data", antyCL)
    ESX.Progressbar('Jesteś podczas antycl',AntyClTime)
	Citizen.Wait(AntyClTime)
	antyCL = false
	TriggerServerEvent("luzz:data", antyCL)
end)

CreateThread(function()
	while true do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()
        if IsPedShooting(playerPed) and antyCL == false then
			TriggerEvent('luzz:block')
			print('xD?')
		end
	end
end)