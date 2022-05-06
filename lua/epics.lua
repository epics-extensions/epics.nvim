M = {
	options = {
		ensure_ts_installed = true,
	},
}

local function register_treesitter_grammars()
	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

	parser_config.epics_cmd = {
		install_info = {
			url = "https://github.com/minijackson/tree-sitter-epics",
			location = "tree-sitter-epics_cmd/epics-cmd",
			files = { "src/parser.c" },
		},
	}

	parser_config.epics_db = {
		install_info = {
			url = "https://github.com/minijackson/tree-sitter-epics",
			location = "tree-sitter-epics_db/epics-db",
			files = { "src/parser.c" },
		},
	}

	parser_config.epics_msi_substitution = {
		install_info = {
			url = "https://github.com/minijackson/tree-sitter-epics",
			location = "tree-sitter-epics_msi_substitution/epics-msi-substitution",
			files = { "src/parser.c" },
		},
	}

	parser_config.epics_msi_template = {
		install_info = {
			url = "https://github.com/minijackson/tree-sitter-epics",
			location = "tree-sitter-epics_msi_template/epics-msi-template",
			files = { "src/parser.c" },
		},
	}

	parser_config.snl = {
		install_info = {
			url = "https://github.com/minijackson/tree-sitter-epics",
			location = "tree-sitter-snl/snl",
			files = { "src/parser.c" },
		},
	}

	parser_config.streamdevice_proto = {
		install_info = {
			url = "https://github.com/minijackson/tree-sitter-epics",
			location = "tree-sitter-streamdevice_proto/streamdevice-proto",
			files = { "src/parser.c" },
		},
	}

	if M.options.ensure_ts_installed then
		local ts_install = require "nvim-treesitter.install"
		ts_install.ensure_installed {
			"epics_cmd",
			"epics_db",
			"epics_msi_substitution",
			"epics_msi_template",
			"streamdevice_proto",
			"snl",
		}
	end
end

local function register_ftdetect()
	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = { "*.cmd" },
		desc = "set filetype=epics_cmd",
		callback = function()
			vim.bo.filetype = "epics_cmd"
		end,
	})

	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = { "*.db", "*.template", "*.vdb" },
		desc = "set filetype=epics_db",
		callback = function()
			vim.bo.filetype = "epics_db"
		end,
	})

	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = { "*.sub", "*.subs", "*.substitutions" },
		desc = "set filetype=epics_msi_substitution",
		callback = function()
			vim.bo.filetype = "epics_msi_substitution"
		end,
	})

	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = { "*.st", "*.stt" },
		desc = "set filetype=snl",
		callback = function()
			vim.bo.filetype = "snl"
		end,
	})

	vim.api.nvim_create_autocmd("BufReadPost", {
		pattern = { "*.proto" },
		desc = "set filetype=streamdevice_proto",
		callback = function()
			-- Check if some lines are "#" comments
			-- Because protobuf files are also named *.proto
			for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
				if line:match "%s*#" then
					vim.bo.filetype = "streamdevice_proto"
					return
				end
			end
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
