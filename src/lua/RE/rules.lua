-- util functions and data
require 'util'
require 'dice'

-- RE specific logic
require "phases"
require "corps_orders"
require "me_orders"
require "me_morale"

-- iterate over loaded modules and print :help for each one
rules = {}

function rules:help(topic)
	if topic ~= nil then
		topic:help()
		return
	end
	print("Topics:")
	for key, value in pairs(package.loaded) do
		if key ~= 'rules' and type(value) == 'table' then
			local h = value['help']
			if type(h) == 'function' then
				print(' ', key)
			end
		end
	end
end

print("All functions loaded")
return rules
