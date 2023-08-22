return {
    'puremourning/vimspector',
    keys = {
        { '<f5>' },
        { '<f8>' },
        { '<f9>' },
    },
    config = function()
        vim.cmd([[
            let g:vimspector_enable_mappings = 'VISUAL STUDIO'
            let g:vimspector_sidebar_width = 75
            let g:vimspector_bottombar_height = 15

            " nmap <F5> <cmd>call vimspector#Launch()<cr>
            nmap <F5> <Plug>VimspectorContinue<cr>
            nmap <F9> <cmd>call vimspector#ToggleBreakpoint()<cr>

            nmap <F8> <Plug>VimspectorRunToCursor
            nmap <leader>i <Plug>VimspectorBalloonEval
            nmap <down> <cmd>call vimspector#StepOver()<cr>
            nmap <left> <cmd>call vimspector#StepOut()<cr>
            nmap <right> <cmd>call vimspector#StepInto()<cr>
            nmap <up> k<cmd>call vimspector#GoToCurrentLine()<cr>

            nmap <leader>w <cmd>call vimspector#AddWatch()<cr>
            " nmap <leader>e <cmd>call vimspector#Evaluate()<cr>

            nmap <leader>b k<cmd>call vimspector#JumpToNextBreakpoint()<cr>
            " nmap <leader>B k<cmd>call vimspector#JumpToPreviousBreakpoint()<cr>

            nmap <leader><F11> <Plug>VimspectorUpFrame
            nmap <leader><F12> <Plug>VimspectorDownFrame
            nmap <leader>B     <Plug>VimspectorBreakpoints
            nmap <leader>D     <Plug>VimspectorDisassemble
        ]])

        vim.keymap.set('n', '<leader>z', ':call vimspector#Reset()<cr>')
        --
        -- nmap('<leader><f5>', ':call vimspector#Continue()<cr>')
        -- map('n', "Dw", ":call vimspector#AddWatch()<cr>")
        vim.keymap.set('n', '<leader>e', ':call vimspector#Evaluate()<cr>')
    end,
}
