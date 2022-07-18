-- Corps Orders Data and Functions

local corps_orders = {
	{
		name = 'Attack',
		stipulations = [[ 
Until Engaged, every ME must have
Attack
Maneuver towards Enemy
Prepare

One ME must be engaged at all times
		]],
		me = {'Attack', 'Prepare', 'Defend', 'Support', 'Maneuver', 'BreakOff', 'ReDeploy', 'Rest'},
	},
	{
		name = 'Defend',
		stipulations = [[ 
At least 1 ME must have a Defend order
within the specified defensive position
		]],
		me = {'Attack', 'Defend', 'Support', 'Maneuver', 'BreakOff', 'Screen', 'ReDeploy', 'Rest'},
	},
	{
		name = 'Maneuver',
		stipulations = [[ 
MEs may not voluntarily engage. 
Deviations up to 16" are permissible
to avoid enemy held structures
		]],
		me = {'Support', 'Maneuver'},
	},
	{
		name = 'Withdraw',
		stipulations = [[ 
The Corps is to withdraw from eneny forces
		]],
		me = {'Defend', 'Support', 'Maneuver', 'Rearguard', 'BreakOff', 'Rest'},
	}
}

-- get by name
function corps_orders:get(name)
	for _, value in ipairs(self) do
		if string.upper(name) == string.upper(value.name) then
			return value
		end
	end
	return nil
end

-- module help
function corps_orders:Help()
	print('Corps Level Orders')
	print(Util.line)
	-- print attribs
	for _, value in ipairs(self) do
		if type(value) == 'table' then
			corps_orders.print(value)
			print(Util.line)
		end
	end
	Util.PrintFunctions('corps_orders', self)
	print(Util.dline)
end

-- print the contents of an order
function corps_orders.print(order)
	print('Corps Order ', ':', order.name)
	print('  Stipulations:')
	print(order.stipulations)
	print('  ME Orders:')
	io.write('    ')
	for index, value in ipairs(order.me) do
		if index > 1 then
			io.write(', ')
		end
		io.write(value)
	end
	print('')
end

-- validate a set of ME Orders
function corps_orders.validate(corps_order, is_engaged, me_orders)
	return true
end

-- delay for a new order reaching target
function corps_orders.delay(distance, weather, roll)
	if roll == 0 then
		roll = Dice.roll()
	end
	roll = roll - weather
	if roll < 6 then
		distance = distance * 3
	elseif roll < 9 then
		distance = distance * 2
	elseif roll > 15 then
		distance = distance * 0.9
	end
	print('Effective distance', distance)
	local d = 0
	if distance <= 24 then
		d = 0
	elseif distance <= 60 then
		d = 1
	elseif distance <= 120 then
		d = 2
	else
		d = 3 + (distance - 120)/90
	end
	d = math.floor(d)
	print(d,'turns delay')
	return d
end

-- attempt to do independent action
function corps_orders.independent_action_mods(new_order, rating, army_commander_near)
	local mods = rating
	if army_commander_near then
		mods = mods -3
	end
	return mods
end

function corps_orders.independent_action(new_order, rating, army_commander_near, roll)
	if roll == 0 then
		roll = Dice.roll()
	end
	local mods = corps_orders.independent_action_mods(new_order, rating, army_commander_near)

	print('Die Mods', mods)
	roll = roll + mods
	print('Dice Total', roll)
	if roll >= 15 then
		return true
	elseif roll >= 13 then
		if new_order == 'Attack' then
			print('Would be enough, but not for Attack orders')
			return false
		end
		return true
	else
		return false
	end
end

return corps_orders
