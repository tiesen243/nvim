local coderunner_status, coderunner = pcall(require, "code_runner")
if not coderunner_status then
	return
end

coderunner.setup({
	mode = "float",
	focus = true,
	startinsert = true,
	float = {
		width = 0.9,
		height = 0.6,
		border = "single",
	},
	filetype = {
		python = {
			"cd $dir &&",
			"python -u $file",
		},
		cpp = {
			"cd $dir &&",
			"g++ $fileName -o $fileNameWithoutExt &&",
			"$dir/$fileNameWithoutExt",
		},
	},
})
