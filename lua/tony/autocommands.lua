 vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _man_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  augroup _git
    autocmd!
    " autocmd FileType gitcommit setlocal wrap
  augroup end

  augroup _markdown
    autocmd!
    " autocmd FileType markdown setlocal wrap
  augroup end

  augroup _vimwiki
    autocmd!
    autocmd Filetype wiki TSBufDisable indent
    " autocmd Filetype wiki set wrap
    autocmd Filetype wiki set linebreak
  augroup end

  augroup _tex
    autocmd!
    " autocmd Filetype tex set wrap
    autocmd Filetype tex set linebreak
  augroup end

  augroup _csv
    autocmd!
    autocmd Filetype csv set textwidth=0
  augroup end

  augroup _txt
    autocmd!
    autocmd Filetype text set nonumber
  augroup end
]]
