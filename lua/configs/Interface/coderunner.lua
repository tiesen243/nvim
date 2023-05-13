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
		height = 0.69,
		border = "rounded",
	},
	filetype = {
		python = {
			"cd $dir &&",
			"py $file",
		},
		cpp = {
			"cd $dir &&",
			"g++ $fileName -o $fileNameWithoutExt &&",
			"$dir/$fileNameWithoutExt",
		},
		js = {
			"cd $dir &&",
			"node $file",
		},
	},
})
