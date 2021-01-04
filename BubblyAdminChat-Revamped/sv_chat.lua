local modeId = 1

RegisterCommand('Adminchat', function(source, args)
	local object = json.decode(args[1])
	modeId += 1
	
	local modeName = ('%s_%d'):format(GetCurrentResourceName(), modeId)

	exports.chat:registerMode({
		name = modeName,
		displayName = object.name,
		color = object.color or '#09f',
		seObject = object.permission,
		cb = function(source, message, cbs)
			cbs.updateMessage({
				template = object.prefix .. ' {}'
			})

			cbs.setSeObject(object.permission)
		end
	})
	
	print('^1[^0Admin Chat^1] ^0added an chat: ^1' .. object.name .. '^1')
end, true)
