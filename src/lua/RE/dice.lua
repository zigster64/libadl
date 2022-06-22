-- Dice rolling functions
math.randomseed(os.time())

dice = {}

function dice:help()
	print('Die Rolling')
	util.PrintFunctions('dice', self)
end

function dice.roll()
	local roll1 = math.random(10)
	local roll2 = math.random(10)
	print(' ... Rolling', roll1, roll2)
	return roll1+roll2
end

function dice.fire(ammo)
	ammo = ammo or 1
	local roll1 = math.random(10)
	local roll2 = math.random(10)
	local roll3 = math.random(6)
	print(' ... Rolling', roll1, roll2, '..', roll3)
	if roll1 <= ammo then
		print('     Ammo Depleted')
	end
	return {
		roll1+roll2,
		roll1 <= ammo,
		roll3
	}
end

return dice
