local spectre_status, spectre = pcall(require, "spectre")
if not spectre_status then
	return
end

spectre.setup()
