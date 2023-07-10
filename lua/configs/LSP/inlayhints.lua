local status, inlay_hints = pcall(require, "inlay_hints")
if not status then
	return
end

inlay_hints.setup()
