return {
  'KaitlynEthylia/TreePin',
  dependencies = 'nvim-treesitter/nvim-treesitter',
  init = function()
    require('treepin').setup({
      hide_onscreen = true,  -- Hide's the pin buffer when the text of the pin is visible.
      max_height = 30,       -- Prevents the pin buffer from displaying when the pin is larger than x lines.
      position = 'relative', -- May be 'relative', 'top', or 'bottom'. Determines the position of the pin buffer within the window.
      icon = '>',            -- The icon to display in the sign column at the top of the pin. Set to nil to prevent the sign column being used.
      zindex = 50,           -- The Z-index of the pin buffer.
      separator = nil,       -- A single character that may be used as a separator between the editing buffer and the pin buffer.
    })
  end,
}
