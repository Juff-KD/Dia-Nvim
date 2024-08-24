return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function() vim.fn["mkdp#util#install"]() end,
  -- config = function()
  --   require('mkdp').setup({
  --     mkdp_auto_start = 0,
  --     mkdp_auto_close = 1,
  --     mkdp_refresh_slow = 1,
  --     mkdp_command_for_global = 0,
  --     mkdp_open_to_the_world = 0,
  --     mkdp_open_ip = '',
  --     mkdp_browser = '',
  --     mkdp_echo_preview_url = 0,
  --     mkdp_browserfunc = '',
  --     mkdp_preview_options = {},
  --     mkdp_markdown_css = '',
  --     mkdp_highlight_css = '',
  --     mkdp_port = '',
  --     mkdp_page_title = '「${name}」',
  --     mkdp_filetypes = { "markdown" },
  --     mkdp_theme = 'dark',
  --     mkdp_combine_preview = 0,
  --     mkdp_combine_preview_auto_refresh = 1,
  --   })
  -- end,
}
