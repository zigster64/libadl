-- ME Panic check phase

local me_panic = {
	causes = {
		'The ME was within 20" of a friendly ME that broke or was otherwise destroyed',
		'The ME was within 30" of a Guard ME that broke or was otherwise destroyed'
	},

}

-- module help
function me_panic:Help()
	print('ME Panic Check')
	print(Util.line)
	-- print attribs
	Util.Print(self)
	Util.PrintFunctions('me_panic', self)
	print(Util.dline)

	print('Test Params:')
	print('  grade      ','ME rating from old_guard through to rabble (See Help(Grades) for complete list)')
	print('  losses     ','% of units that are in bad morale or destroyed')
	print('  additional ','Number of additional causes, beyond the first')
	print('  lost_strongpoint','Number of strongpoints lost to the enemy within 30"')
	print('  guard_broken','true or false, Guard unit within 30" has broken')
	print('  guard_shaken','true or false, Guard unit within 30" is broken')
	print('  no_bad     ','true or false, No units in bad morale')
	print('  shaken     ','true or false, ME is shaken')
	print('  blocked    ','true or false, Retreat path is blocked by enemy')
	print('  interpenetrated','true or false, ME is interpenetrated by friendly ME')
	print('  corps_withdraw_order','true or false, ME is under a Corps Withdraw order')
	print('  fatigue    ','Number of ME fatigue points')
	print('  campaign_fatigue -2 Weary / -4 Haggard / -6 Spent')
	print('  leader +1 Inspirational +3 Charismatic leader attached')
	print('  other','any other modifiers')
	print(Util.dline)
end

-- validate params
function me_panic:get_params(p)
	local params = {
		grade = Grades.regular,
		guard_broken = false,
		guard_shaken = false,
		attrition = 0,
		additional = 0,
		fatigue = 0,
		shaken = false,
		blocked = false,
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
	local mods = (params.additional * -2) +
		(params.fatigue * -1) +
		(params.lost_strongpoint * -2) +
		(params.campaign_fatigue) +
		(params.leader) +
		(params.other)
	if (params.guard_broken) then mods = mods -5 end
	if (params.guard_shaken) then mods = mods -3 end
	if (params.shaken) then mods = mods -2 end
	if (params.blocked) then mods = mods -2 end
	if (params.corps_withdraw_order) then mods = mods -1 end
	if (params.interpenetrated) then mods = mods -1 end
	if (params.losses >= 50) then
		mods = mods -6
	elseif (params.losses >= 25) then
		mods = mods -3
	end

	print('Roll '..roll..' + mods '..mods..' = '..(roll+mods))
	roll = roll + mods
	if roll >= params.grade.panic[1] then
		return {
			result = 'Carry On',
			shaken = false,
			broken = false,
		}
	elseif roll <= params.grade.panic[2] then
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
