-- Phases - for order of play

-- Each phase has 
-- name
-- description
-- code modules used in this phase
local phase_data = {
	1: {
		name = 'Corps Orders',
		description = 'Issue and activate Corps Orders',
		code = require('corps-orders')
	}, {
		name = '',
		description = '',
		code = require() 
	}
}

phases = {}

function phases.get(order)
	return orders[order]
end

function phases.next(current)
	return {}
end

return phases
