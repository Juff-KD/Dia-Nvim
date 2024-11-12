return {
	"mistweaverco/kulala.nvim",
	opts = {
		vim.filetype.add({
			extension = {
				["http"] = "http",
			},
		}),
		curl_path = "curl",
		-- Display mode, possible values: "split", "float"
		display_mode = "split",
		split_direction = "vertical",
		-- default_view, body or headers or headers_body
		default_view = "body",
		-- dev, test, prod, can be anything
		-- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
		default_env = "dev",
		-- enable/disable debug mode
		debug = false,
		contenttypes = {

			["application/xml"] = {
				ft = "xml",
				formatter = { "xmllint", "--format", "-" },
				pathresolver = { "xmllint", "--xpath", "{{path}}", "-" },
			},
			["text/html"] = {
				ft = "html",
				formatter = { "xmllint", "--format", "--html", "-" },
				pathresolver = {},
			},
			["application/json"] = {
				ft = "json",
				formatter = { "jq", "." },
				-- pathresolver = require("kulala.parser.jsonpath").parse,
			},
		},
		show_icons = "on_request",
		icons = {
			inlay = {
				loading = "⏳",
				done = "✅",
				error = "❌",
			},
			lualine = "🐼",
		},
		-- additional cURL options
		-- see: https://curl.se/docs/manpage.html
		additional_curl_options = {},
		-- enable winbar
		winbar = false,
		-- Current available pane contains { "body", "headers", "headers_body", "script_output", "stats" },
		default_winbar_panes = { "body", "headers", "headers_body" },
		-- enable reading vscode rest client environment variables
		vscode_rest_client_environmentvars = false,
		-- they will be still written to disk, but not printed immediately
		disable_script_print_output = false,
		-- set scope for environment and request variables
		-- possible values: b = buffer, g = global
		environment_scope = "b",

		-- certificates
		certificates = {},
	},
}
