require('hardline').setup {
  bufferline = true,  -- enable bufferline
  bufferline_settings = {
    exclude_terminal = false,  -- don't show terminal buffers in bufferline
    show_index = false,        -- show buffer indexes (not the actual buffer numbers) in bufferline
  },
  -- theme = 'tony',   -- change theme
  sections = {         -- define sections
    --{class = 'mode', item = require('hardline.parts.mode').get_item},
    {class = 'high', item = require('hardline.parts.git').get_item, hide = 90},
    {class = 'med', item = require('hardline.parts.filename').get_item},
    '%<',
    {class = 'med', item = '%='},
    {class = 'error', item = require('hardline.parts.lsp').get_error},
    {class = 'warning', item = require('hardline.parts.lsp').get_warning},
    {class = 'low', item = require('hardline.parts.whitespace').get_item, hide = 90},
    {class = 'high', item = require('hardline.parts.filetype').get_item, hide = 90},
    {class = 'med', item = require('hardline.parts.wordcount').get_item, hide = 90},
    {class = 'low', item = require('hardline.parts.line').get_item},

  },
}
