-- Corps Orders Data and Functions

corps_orders = {
	['Attack'] = {
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
	['Defend'] = {
		name = 'Defend',
		stipulations = [[ 
At least 1 ME must have a Defend order
within the specified defensive position
		]],
		me = {'Attack', 'Defend', 'Support', 'Maneuver', 'BreakOff', 'Screen', 'ReDeploy', 'Rest'},
	},
	['Maneuver'] = {
		name = 'Maneuver',
		stipulations = [[ 
MEs may not voluntarily engage. 
Deviations up to 3x Engagement Range
to avoid enemy held structures 
		]],
		me = {'Support', 'Maneuver'},
	},
	['Withdraw'] = {
		name = 'Withdraw',
		stipulations = [[Corps]],
		me = {'Defend', 'Support', 'Maneuver', 'Rearguard', 'BreakOff', 'Rest'},
	},

	print = function(self, order) 
		print('Order:', order.name)
		print('Stipulations:')
		print(order.stipulations)
		print('ME Orders:')
		for index, value in ipairs(order.me) do
			if index > 1 then
				io.write(', ')
			end
			io.write(value)
end
		print('')
	end,

	-- validate a set of ME Orders
	validate = function(self, corps_order, is_engaged, me_orders)
		return true
	end,

	-- delay for a new order reaching target
	delay = function(distance, weather, roll)
		if roll == 0 then
			roll = require('dice').roll()
		end
		roll = roll - weather
		if roll < 6 then
			distance = distance * 2
		elseif roll < 9 then
			distance = distance * 1.2
		elseif roll > 15 then
			distance = distance * 0.9
		end
		print('Effective distance', distance)
		d = 0
		if distance <= 4 then
			d = 0
		elseif distance <= 10 then
			d = 1
		elseif distance <= 20 then
			d = 2
		else
			d = 3 + (distance - 20)/15
		end
		print(d,'turns delay')
		return d
	end,

	-- attempt to do independent action
	independent_action = function(new_order, rating, army_commander_near, roll)
		if roll == 0 then
			roll = require('dice').roll()
		end
		mods = rating
		if army_commander_near then
			mods = mods -3
		end

		print('Die Mods', mods)
		roll = roll + mods
		print('Dice Total', roll)
		if roll >= 15 then
			return true
		elseif roll >= 13 then	
			if new_order == 'A' then
				print('Would be enough, but not for Attack orders')
				return false
			end
			return true
		else 
			return false
		end
	end
}

return corps_orders
