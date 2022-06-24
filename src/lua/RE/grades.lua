-- Troop Grades

-- me_morale: modifier for ME morale test
-- panic:     1st number or higher = pass,  2nd number or lower = break, inbetween = shaken
local grades = {
	old_guard = {
		name = 'OLd Guard',
		me_morale = 10,
		panic = {4,2},
	},
	guard = {
		name = 'Guard',
		me_morale = 9,
		panic = {6,3},
	},
	grenadier = {
		name = 'Grenadier',
		me_morale = 8,
		panic = {7,4},
	},
	elite = {
		name = 'Elite',
		me_morale = 7,
		panic = {7,5},
	},
	crack = {
		name = 'Crack Line',
		me_morale = 6,
		panic = {8,5},
	},
	veteran = {
		name = 'Veteran',
		me_morale = 5,
		panic = {8,6},
	},
	regular = {
		name = 'Regular',
		me_morale = 4,
		panic = {9,7},
	},
	conscript = {
		name = 'Conscript',
		me_morale = 3,
		panic = {10,8},
	},
	landwehr = {
		name = 'Landwehr',
		me_morale = 2,
		panic = {11,8},
	},
	militia = {
		name = 'Militia',
		me_morale = 1,
		panic = {12,10},
	},
	rabble = {
		name = 'Rabble',
		me_morale = 0,
		panic = {13,11},
	}
}

local sorted = {
	grades.old_guard,
	grades.guard,
	grades.grenadier,
	grades.elite,
	grades.crack,
	grades.veteran,
	grades.regular,
	grades.conscript,
	grades.landwehr,
	grades.militia,
	grades.rabble
}

-- Print Grades
function grades:Help()
	print('Troop Grades')
	print(Util.line)
	for k,v in ipairs(sorted) do
		if type(v) == "table" then
			print(string.format("%-16s", v.name),':', 'ME Morale +'..v.me_morale, 'Panic:', 'Steady at '..v.panic[1]..' Break at '..v.panic[2]..' or less')
		end
	end
	print()
	Util.PrintFunctions('Grades', self)
	print(Util.dline)
end

return grades
