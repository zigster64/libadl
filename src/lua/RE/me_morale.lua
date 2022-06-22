-- ME morale phase

me_morale = {
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
function me_morale:help()
	print('ME Morale')
	print(util.line)
	-- print attribs
	for _, value in ipairs(self) do
		if type(value) == 'table' then
			me_orders.print(value)
			print(util.line)
		end
	end
	util.PrintFunctions('me_orders', self)
	print(util.dline)
end

-- me morale test
function me_morale:test()
end

return me_morale
