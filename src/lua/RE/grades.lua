-- Troop Grades

-- me_morale: modifier for ME morale test
-- panic:     1st number or higher = pass,  2nd number or lower = break, inbetween = shaken
local grades = {
	old_guard = {
		me_morale = 10,
		panic = {4,2},
	},
	guard = {
		me_morale = 9,
		panic = {6,3},
	},
	grenadier = {
		me_morale = 8,
		panic = {7,4},
	},
	elite = {
		me_morale = 7,
		panic = {7,5},
	},
	crack = {
		me_morale = 6,
		panic = {8,5},
	},
	veteran = {
		me_morale = 5,
		panic = {8,6},
	},
	regular = {
		me_morale = 4,
		panic = {9,7},
	},
	conscript = {
		me_morale = 3,
		panic = {10,8},
	},
	landwehr = {
		me_morale = 2,
		panic = {11,8},
	},
	militia = {
		me_morale = 1,
		panic = {12,10},
	},
	rabble = {
		me_morale = 0,
		panic = {13,11},
	}
}

return grades
