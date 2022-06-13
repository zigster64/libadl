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

function util.DescribeFunc(name, fn)
	return string.format('%s(%s)', name, table.concat(util.GetArgs(fn), ', '))
end

return util


