RegisterNetEvent('bro0ks_fix:fix')
AddEventHandler('bro0ks_fix:fix', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleEngineHealth(vehicle, 1000)
		SetVehicleEngineOn( vehicle, true, true )
		SetVehicleFixed(vehicle)
		notification("~w~O teu veiculo foi arranjado.")
	else
		notification("~r~Tu não te encontras em um veículo.")
	end
end)

RegisterNetEvent('bro0ks_fix:clean')
AddEventHandler('bro0ks_fix:clean', function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed, false) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDirtLevel(vehicle, 0)
		notification("~w~O teu veiculo foi limpo.")
	else
		notification("~r~Tu não te encontras em um veículo.")
	end
end)

RegisterNetEvent('bro0ks_fix:noPerms')
AddEventHandler('bro0ks_fix:noPerms', function()
	notification("~w~Não tens permissões para usar este comando.")
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end