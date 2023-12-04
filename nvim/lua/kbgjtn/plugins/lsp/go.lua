local status, golang = pcall(require, "go")
if not status then
	return
end

golang.setup()
