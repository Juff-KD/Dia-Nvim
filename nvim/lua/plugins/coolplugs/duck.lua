return {
  'tamton-aquib/duck.nvim',
  event = "VeryLazy",
  config = function()
    vim.keymap.set('n', '<leader>dk', function() require("duck").hatch("🦖", 4) end, { noremap = true })
    vim.keymap.set('n', '<leader>dkk', function() require("duck").cook() end, {})
    vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})

    --sample..
    --vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦆", 10) end, {}) -- A pretty fast duck
    --vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈", 0.75) end, {}) -- Quite a mellow cat
    -- 🦆 ඞ 🦀 🐈 🐎 🦖 🐤
  end
}
