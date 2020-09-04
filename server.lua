local everyoneAllowed = false -- true = toda a gente pode fazer || false = usa steamIDs e IPs listados para ter permissão

local allowed = 
{
	"steam:1100001349e86b1",
}

AddEventHandler('chatMessage', function(source, n, msg)
	local msg = string.lower(msg)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/fix" then
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('bro0ks_fix:fix', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('bro0ks_fix:fix', source)
			else
				TriggerClientEvent('bro0ks_fix:noPerms', source)
			end
		end
	elseif msg == "/clean" then 
		CancelEvent()
		if everyoneAllowed == true then
			TriggerClientEvent('bro0ks_fix:clean', source)
		else
			if checkAllowed(identifier) then
				TriggerClientEvent('bro0ks_fix:clean', source)
			else
				TriggerClientEvent('bro0ks_fix:noPerms', source)
			end
		end
	end
end)

function checkAllowed(id)
	for k, v in pairs(allowed) do
		if id == v then
			return true
		end
	end
	
	return false
end