-- util functions and data
Util = require('Util')
Dice = require('Dice')
Grades = require('Grades')

-- RE specific logic
Phases = require('Phases')
Corps_orders = require('Corps_orders')
ME_orders = require('ME_orders')
ME_morale = require('ME_morale')
ME_panic = require('ME_panic')

-- iterate over loaded modules and print :help for each one
local rules = {}

function Help(topic)
	if topic ~= nil then
		topic:help()
		return
	end
	print("Topics:")
	for key, value in pairs(package.loaded) do
		if key ~= 'rules' and key ~= '_G' and type(value) == 'table' then
			local h = value['Help']
			if type(h) == 'function' then
				print(' ', key)
			end
		end
	end
end

print("All functions loaded")
return rules
