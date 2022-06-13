dice = {}

function dice.roll()
	roll1 = math.random(10)
	roll2 = math.random(10)
	print(' ... Rolling', roll1, roll2)
	return roll1+roll2
end

function dice.fire(ammo)
	roll1 = math.random(10)
	roll2 = math.random(10)
	print(' ... Rolling', roll1, roll2)
	if roll1 <= ammo then
		print('     Ammo Depleted')
	end
	return {
		roll1+roll2,
		roll1 <= ammo
	}
end

return dice
