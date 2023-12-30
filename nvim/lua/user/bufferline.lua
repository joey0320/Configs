local bufferline = require('bufferline')
bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    style_preset = default, -- or bufferline.style_preset.minimal,
    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    indicator = {
      style = 'underline',
    },
    buffer_close_icon = '¶',
    modified_icon = '●',
    close_icon = '|',
    left_trunc_marker  = '<<',
    right_trunc_marker = '>>',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = false, -- whether or not tab names should be truncated
    tab_size = 12,
    offsets = {
      {
        text_align = "right",
        separator = true
      }
    },
  }
}
