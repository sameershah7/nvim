return {
  'saghen/blink.cmp',
  version = '1.*',
  opts = {
    -- Keymap 'preset' for VS Code style (Tab to select/confirm)
    keymap = { preset = 'super-tab' },

    appearance = {
      use_nvim_cmp_as_default = true, -- Sets icons to look like nvim-cmp
      nerd_font_variant = 'mono'
    },

    -- Sources to pull suggestions from
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
}

