-- Maneuver Element / Division Orders

local me_orders = {
	{
		name = 'Attack',
		unengaged = 'Must move as fast as possible to become engaged',
		engaged = 'Must make every effort to remain engaged',
	},
	{
		name = 'Prepare',
		unengaged = 'Must move to within 16" from target, then halt',
		engaged = 'Use skirmishers and artillery to prepare the assault',
		pending = {'Attack'}

	},
	{
		name = 'Defend',
		unengaged = 'May not voluntarily move more than 8" from the Baseline',
		engaged = 'Stay within 8" of the Defended location'
	},
	{
		name = 'Maneuver',
		notes = 'Include a written description of destination or relative to friendly troops',
		unengaged = 'May move between half and full move towards objective',
		engaged = 'Halt, convert to Defend order',
		on_contact = 'Defend'
	},
	{
		name = 'RearGuard',
		notes = 'On activate, half Grand Tactical movement to the rear',
		unengaged = 'Units may not voluntarily move more than 8" from the baseline',
		engaged = 'Half of units may fall back half a tactical move'
	},
	{
		name = 'BreakOff',
		unengaged = 'If re-engaged, unit is shaken',
		engaged = 'Full Grand Tactical move to leave the engagement',
		on_contact = 'Defend',
		shaken_if_re_engaged = true
	},
	{
		name = 'Screen',
		cav_only = true,
		pending = {'Attack', 'RearGuard', 'BreakOff'},
		on_contact = 'Defend'
	},
	{
		name = 'Support',
		notes = 'Counts as a pending order with 5 activation points',
		unengaged = 'Keep relative formation with supported unit. Engage at 20" distance',
		engaged = 'Will counter charge any enemy cavalry',
		cav_only = true,
	},
	{
		name = 'ReDeploy',
		unengaged = '3D6 points for Grand Tactical Adjustments',
		shaken_if_re_engaged = true,
		engaged = 'Defend'
	},
	{
		name = 'Rest',
		unengaged = 'Free activation',
		on_contact = 'BreakOff',
		shaken_if_re_engaged = true
	}
}

-- module help
function me_orders:Help(order)
	print('ME Level Orders')
	if order ~= nil then
		me_orders.print(order)
		return
	end
	print(util.line)
	-- print attribs
	for _, value in ipairs(self) do
		if type(value) == 'table' then
			me_orders.print(value)
			print(util.line)
		end
	end
	util.PrintFunctions('ME_orders', self)
	print(util.dline)
end

-- find by name
function me_orders:get(name)
	for _, value in ipairs(self) do
		if string.upper(name) == string.upper(value.name) then
			return value
		end
	end
	return nil
end

-- print the contents of an order
function me_orders.print(order)
	print(order.name)
	print()
	if order.notes ~= nil then
		print('Notes    ', ':', order.notes)
	end
	if order.unengaged ~= nil then
		print('Unengaged', ':', order.unengaged)
	end
	if order.engaged ~= nil then
		print('Engaged  ', ':', order.engaged)
	end
	if order.cav_only ~= nil then
		print('Cavalry Only')
	end
	if order.on_contact ~= nil then
		print('OnContact', ':', order.on_contact)
	end
	if order.shaken_if_re_engaged ~= nil then
		print('Shaken if re-Engaged')
	end
	if order.pending ~= nil then
		io.write('Pending Order: ')
		for index, value in ipairs(order.pending) do
			if index > 1 then
				io.write(', ')
			end
			io.write(value)
		end
		print()
	end
end

-- delay for a new order reaching target - same as Corps Orders
-- but worse because its harder to find Div HQ
function me_orders.delay(distance, weather, roll)
	return corps_orders.delay(distance, weather*2, roll)
end

return me_orders
