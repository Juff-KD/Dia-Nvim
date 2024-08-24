return {
  'MagicDuck/grug-far.nvim',
  config = function()
    vim.g.maplocalleader = '.'
    require('grug-far').setup({
      --   ... options, see Configuration section below ...
      --   ... there are no required options atm...
    })
  end,
  -- keymaps = {
  --   replace = { n = '<localleader>r' },
  --   qflist = { n = '<localleader>q' },
  --   syncLocations = { n = '<localleader>s' },
  --   syncLine = { n = '<localleader>l' },
  --   close = { n = '<localleader>c' },
  --   historyOpen = { n = '<localleader>t' },
  --   historyAdd = { n = '<localleader>a' },
  --   refresh = { n = '<localleader>f' },
  --   gotoLocation = { n = '<enter>' },
  --   pickHistoryEntry = { n = '<enter>' },
  -- },
}
