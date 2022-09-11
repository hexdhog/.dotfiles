local status, trouble = pcall(require, "trouble")
if not status then
	print("ERROR: module 'trouble' not found")
	return
end

trouble.setup()
