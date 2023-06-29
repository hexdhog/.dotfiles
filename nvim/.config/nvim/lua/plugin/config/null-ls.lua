local status, null_ls = pcall(require, "null-ls")
if not status then
	print("ERROR: module \"null-ls\" not found")
	return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
	diagnostics_format = "[#{c}] #{m} (#{s})",
	sources = {
		diagnostics.flake8.with({
			extra_args = {
				"--exclude=.git,__pycache__,docs/source/conf.py,old,build,dist",
				"--extend-ignore=E501,E701,E702,E704,E301,E302,E305,E306", -- pycodestyle codes
				"--indent-size=2",
			}
		}),
		diagnostics.mypy,
		formatting.yapf.with({
			extra_args = {
				"--style='{based_on_style: pep8, indent_width: 2}'"
			}
		})
	}
})
