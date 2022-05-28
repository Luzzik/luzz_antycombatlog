ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

antyCLsv = nil

RegisterNetEvent('luzz:data')
AddEventHandler('luzz:data', function(antyCL)
    antyCLsv = antyCL
	print(antyCLsv)
end)

AddEventHandler('playerDropped', function(reason)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if antyCLsv == true then
		--Trigger do zbanowania osoby
		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
		for i=1, #xPlayer.loadout, 1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	end
end)		