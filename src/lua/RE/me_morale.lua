-- ME morale phase

local me_morale = {
	causes = {
		'Had a unit go into bad morale',
		'During Grand Tactical Movement, a unit in march column engaged in the flank or rear',
		'ME is shaken and still engaged',
		'Leader or line commander is wounded / killed / captured',
		'ME is engaged whilst on redeploy order'
	},
	shaken = {
		'Result of a panic test',
		'During a BreakOff order, being re-engaged whilst still under the order',
		'Infantry or mixed ME interpenetrated by Cavalry ME',
		'Friendly ME routs through this ME'
	},
}

-- module help
function me_morale:Help()
	print('ME Morale')
	print(Util.line)
	-- print attribs
	Util.Print(me_morale)
	Util.PrintFunctions('ME_morale', self)

	print('Test Params:')
	print('  grade      ','ME troop grade')
	print('  good       ','Number of Bns / Btys / Cav Grps in good morale with no ammo depletion')
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
function me_morale:get_params(p)
	local params = {
		grade = Grades.regular,
		other = 0,
		good = 1,
		bad = {infantry = 0, artillery = 0, cavalry = 0},
		structures = {held = 0, lost = 0},
		defeat = 0,
		victory = 0,
		fatigue = 0,
		campaign_fatigue = 0,
		leader = 0,
		previously_shaken = false,
		interpenetrated = false,
	}
	return util.Merge(params, p)
end

-- me morale test
function me_morale:test(params, roll)
	roll = roll or Dice.roll()
	params = self:get_params(params)
	Util.Print(params)
	local mods = params.grade.me_morale + params.other + params.structures.held - params.structures.lost +
		(params.bad.infantry * -2) + (params.bad.artillery * -2) + (params.bad.cavalry * -6) +
		(params.good) + (params.defeat * -2) + (params.victory * 2) +
		(params.fatigue * -1) + (params.campaign_fatigue) + (params.leader)
	if (params.previously_shaken) then
		mods = mods - 3
	end
	if (params.intepenetrated) then
		mods = mods - 2
	end
	print('Roll', roll, 'mods', mods, '=', roll+mods)
	roll = roll + mods
	if (roll <= 5) then
		return {
			result = 'Broken - entire ME dissolves in bad morale',
			broken = true
		}
	elseif (roll <= 8) then
		return {
			result = 'Retreat and Shaken. ME Converts to BreakOff order and retreats 16". All units -2 rating. 1 Fatigue',
			broken = false,
			shaken = true,
			fatigue = 1,
			retreat = 16
		}
	elseif (roll <= 10) then
		return {
			result = 'Shaken. All units -2 rating. Attacks without impetus fall back 16" and convert to defend. Defending ME may elect to BreakOff',
			broken = false,
			shaken = true,
			retreat = 16
		}
	end
	return {
		result = 'Steady (Remove Shaken)',
		broken = false,
		shaken = false
	}
end

return me_morale
