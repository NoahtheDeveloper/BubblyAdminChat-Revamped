local modeId = 1

RegisterCommand('addAclChat', function(source, args)
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
	
	print('^3[bubblyRestrictedChat] added ACL chat: ^2' .. object.name .. '^7')
end, true)