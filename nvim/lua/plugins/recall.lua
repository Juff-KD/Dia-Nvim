return {
  "fnune/recall.nvim",
  version = "*",
  config = function()
    local recall = require("recall")

    recall.setup({
      sign = "",
      sign_highlight = "@comment.note",

      telescope = {
        autoload = true,
        mappings = {
          unmark_selected_entry = {
            normal = "dd",
            insert = "<M-d>",
          },
        },
      },

      wshada = vim.fn.has("nvim-0.10") == 0,
    })

    vim.keymap.set("n", "<leader>gr", recall.toggle, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>grr", recall.goto_next, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>grp", recall.goto_prev, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>grc", recall.clear, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fr", ":Telescope recall<CR>", { noremap = true, silent = true })
  end
}
