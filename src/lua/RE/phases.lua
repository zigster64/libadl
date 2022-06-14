-- Phases - for order of play

-- Each phase has:
-- name
-- description
-- code modules used in this phase
phases = {
	{
		name = 'Corps Orders',
		description = 'Issue Corps Orders from Army Commander',
		module = 'corps_orders'
	},
	{
		name = 'ME Orders',
		description = 'Issue ME Orders from Corps Commanders',
		module = 'me_orders'
	}
}

function phases:help(module)
	if module ~= nil then
		module:help()
		return
	end
	print('List of phases in order')
	for index, value in ipairs(self) do
		print(string.format('%d: %s', index, value.module))
		print('  ', value.name)
		print('  ', value.description)
		print(util.line)
	end
	util.PrintFunctions('phases', self)
end

return phases
