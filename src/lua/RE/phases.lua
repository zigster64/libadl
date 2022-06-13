-- Phases - for order of play

-- Each phase has 
-- name
-- description
-- code modules used in this phase
phases = {
	{
		name = "Corps Orders",
		description = "Issue Corps Orders from Army Commander"
	},
	{
		name = "ME Orders",
		description = "Issue ME Orders from Corps Commanders"
	}
}

function phases:help()
	print('List of phases in order')
	local u = require('util')
	for index, value in ipairs(self) do
		print(index, value.name)
		print(value.description)
		print(u.line)
	end
end

return phases
