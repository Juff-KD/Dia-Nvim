return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup({
      cmd_name = "IncRename",     -- the name of the command
      hl_group = "Substitute",    -- the highlight group used for highlighting the identifier's new name
      preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
      show_message = true,        -- whether to display a `Renamed m instances in n files` message after a rename operation
      input_buffer_type = nil,    -- the type of the external input buffer to use (the only supported value is currently "dressing")
      post_hook = nil,
    })
  end,
  vim.keymap.set("n", "<leader>rn", ":IncRename<cr>", {silent =true, noremap =true})
}
