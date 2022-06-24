-- Phases - for order of play

-- Each phase has:
-- name
-- description
-- code modules used in this phase
local phases = {
	{
		name = 'Corps Orders',
		description = 'Issue Corps Orders from Army Commander',
		module = 'Corps_orders'
	},
	{
		name = 'ME Orders',
		description = 'Issue ME Orders from Corps Commanders',
		module = 'ME_orders'
	},
	{
		name = 'ME Morale',
		description = 'Test ME Morale Levels',
		module = 'ME_morale'
	},
	{
		name = 'ME Panic',
		description = 'ME Panic Tests',
		module = 'ME_panic'
	}
}

function phases:help(module)
	if module ~= nil then
		module:help()
		return
	end
	print('List of phases in order')
	for index, value in ipairs(self) do
		print(string.format('%d: %s\n  %s\n  (%s)',
			index,
			value.name,
			value.description,
			value.module
		))
		print(util.line)
	end
	Util.PrintFunctions('Phases', self)
end

return phases
