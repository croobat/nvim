vim.cmd [[
    augroup _general_settings
        autocmd!
        autocmd VimResized * tabdo wincmd =
        autocmd BufEnter * set formatoptions-=o
    augroup end

    augroup _man_settings
        autocmd!
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
        autocmd FileType qf set nobuflisted
    augroup end

    augroup _markdown
        autocmd!
        " autocmd FileType markdown setlocal wrap
    augroup end

    augroup _vimwiki
        autocmd!
        autocmd Filetype vimwiki set linebreak
        autocmd Filetype vimwiki set textwidth=0
    augroup end

    augroup _tex
        autocmd!
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

    augroup _sql
        autocmd!
        autocmd Filetype sql set textwidth=0
    augroup end
]]
