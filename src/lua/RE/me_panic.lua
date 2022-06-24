-- ME Panic check phase

local me_panic = {
	causes = {
		'The ME was within 20" of a friendly ME that broke or was otherwise destroyed',
		'The ME was within 30" of a Guard ME that broke or was otherwise destroyed'
	},

}

-- module help
function me_panic:help()
	print('ME Panic Check')
	print(Util.line)
	-- print attribs
	Util.Print(self)
	Util.PrintFunctions('me_panic', self)
	print(Util.dline)

	print('Test Params:')
	print('  rating     ','ME rating from 10 (OldGuard) through to 0 (Rabble)')
	print('  wrecked    ','50% or more casaulties to the ME')
	print('  decimated  ','25% or more casaulties to the ME')
	print('  additional ','Number of additional causes, beyond the first')

	print('  bad')
	print('    infantry ','Number of Infantry Bns lost / bad morale')
	print('    artillery','Number of Artillery Btys lost / bad morale')
	print('    cavalry  ','Number of Cavalry Grps lost / bad morale ')
	print('  structures')
	print('    held     ','Number of structures held')
	print('    lost     ','Number of structures lost')
	print('  defeat     ','Number of CloseAction defeats this turn')
	print('  victory    ','Number of CloseAction victories this turn')
	print('  fatigue    ','Number of ME Fatigue points')
	print('  campaign_fatigue -1 Weary / -2 Haggard / -5 Spent')
	print('  leader +1 Inspirational +3 Charismatic leader attached')
	print('  previously_shaken','true or false, ME was previously shaken')
	print('  interpenetrated  ','true or false, ME is interpenetrated by friendly ME')
	print('  other','any other modifiers')
	print(Util.dline)
end

-- validate params
function me_panic:get_params(p)
	local params = {
		grade = Troops.regular,
		wrecked = false,
		decimated = false, 
		additional = 0,
		fatigue = 0,
		shaken = false,
		retreat_blocked = false,
		lost_strongpoint = 0,
		corps_withdraw_order = false,
		campaign_fatigue = 0,
		interpenetrated = false,
		leader = 0,
		no_bad_morale = true,
		other = 0
	}
	return Util.Merge(params, p)
end

-- me panic test
function me_panic:test(params, roll)
	roll = roll or Dice.roll()
	params = self:get_params(params)
	-- any mods here ??
	local mods = 0
	roll = roll + mods
	if roll >= Troops.panic[0] then
		return {
			result = 'Carry On',
			shaken = false,
			broken = false,
		}
	elseif roll <= Troops.panic[1] then
		return {
			result = 'ME is shaken. All units -2 on morale and shock values',
			shaken = true,
			broken = false,
		}
	else
		return {
			result = 'Broken, retreat 24" in Bad Morale',
			shaken = false,
			broken = true,
			fatigue = 1,
			retreat = 24,
		}
	end
end

return me_panic
