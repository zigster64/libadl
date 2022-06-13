-- util functions and data
require 'util'
require 'dice'

-- RE specific logic
require "phases"
require "corps_orders"
require "me_orders"

-- iterate over loaded modules and print :help for each one
rules = {}

function rules:help()
	for key, value in pairs(package.loaded) do
		if key ~= 'rules' and type(value) == 'table' then
			h = value['help']
			if type(h) == 'function' then
				print(key)
				h(value)
				print()
				print(util.dline)
			end
		end
	end
end

print("All functions loaded")
return rules
