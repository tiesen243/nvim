local setup, git = pcall(require, "gitsigns")
if not setup then
	return
end

git.setup()
