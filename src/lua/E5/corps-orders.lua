-- Corps Orders Functions

local orders = {
	['A'] = {
		name = 'Attack',
		stipulations = [[ 
Until Engaged, every ME must have
Attack
Maneuver
Prepare

One ME must be engaged at all times
		]],
		me = {'Attack', 'Prepare', 'Defend', 'Support', 'Maneuver', 'BreakOff', 'ReDeploy', 'Rest'},
	},
	['D'] = {
		name = 'Defend',
		stipulations = [[ 
At least 1 ME must have a defend order
within the specified defensive position
		]],
		me = {'Attack', 'Defend', 'Support', 'Maneuver', 'BreakOff', 'Screen', 'ReDeploy', 'Rest'},
	},
	['M'] = {
		name = 'Maneuver',
		stipulations = [[ 
MEs may no vuluntarily engage. 
Deviations up to 3x Engagement Range
to avoid enemy held structures 
		]],
		me = {'Support', 'Maneuver'},
	},
	['W'] = {
		name = 'Withdraw',
		stipulations = [[Corps]],
		me = {'Defend', 'Support', 'Maneuver', 'Rearguard', 'BreakOff', 'Rest'},
	}
}

corps_orders = {}

-- Get constraints for a corps order
function corps_orders.get(order)
	return orders[order]
end

function corps_orders.set(order, objective, path, enemy, friendly)
	return {}
end

function corps_orders.independent_action(rating, army_commander, dice)
	return false
end

return corps_orders
