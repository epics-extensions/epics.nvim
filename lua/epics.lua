M = {
	options = {
		ensure_ts_installed = true,
	},
}

function register_treesitter_grammars()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

	parser_config.epics_db = {
		install_info = {
			url = "https://github.com/minijackson/tree-sitter-epics",
			location = "tree-sitter-epics_db/epics-db",
			files = { "src/parser.c" },
		},
	}

	parser_config.epics_msi = {
		install_info = {
			url = "https://github.com/minijackson/tree-sitter-epics",
			location = "tree-sitter-epics_msi/epics-msi",
			files = { "src/parser.c" },
		},
	}

	if M.options.ensure_ts_installed then
		local ts_install = require "nvim-treesitter.install"
		ts_install.ensure_installed { "epics_db", "epics_msi" }
	end
end

function register_ftdetect()
	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = { "*.db", "*.template", "*.vdb" },
		desc = "set filetype=epics_db",
		callback = function(opts)
			vim.bo.filetype = "epics_db"
		end,
	})

	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = { "*.sub", "*.subs", "*.substitutions" },
		desc = "set filetype=epics_msi",
		callback = function(opts)
			vim.bo.filetype = "epics_msi"
		end,
	})
end

function M.setup(opts)
	vim.validate { opts = { opts, "table" } }

	for given_key, _ in pairs(opts) do
		if not M.options[given_key] then
			error("Unsupported epics.nvim option: " .. given_key)
		end
	end

	M.options = vim.tbl_extend("force", M.options, opts)

	register_treesitter_grammars()
	register_ftdetect()
end

return M
