util = {
	line = '----------------------------------',
	dline = '=================================='
}

function util.GetArgs(func)
    local args = {}
    for i = 1, debug.getinfo(func).nparams, 1 do
        table.insert(args, debug.getlocal(func, i));
    end
    return args;
end

function util.DescribeFunc(module, name, fn)
	local args = util.GetArgs(fn)
	if args[1] == 'self' then
		return string.format('%s:%s(%s)', module, name, table.concat(args, ', ', 2))
	end
	return string.format('%s.%s(%s)', module, name, table.concat(args, ', '))
end

function util.PrintFunctions(module, thing)
	-- print methods
	local has_any = false
	for key, value in pairs(thing) do
		if type(value) == 'function' then
			if has_any == false then
				print("Functions:")
				has_any = true
			end
			print('  ', util.DescribeFunc(module, key, value))
		end
	end
end

return util


