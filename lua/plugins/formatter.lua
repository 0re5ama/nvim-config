return {
    'mhartington/formatter.nvim',
    config = function()
        -- Utilities for creating configurations
        local util = require "formatter.util"

        function format_prettier()
            return {
                exe = "prettier",
                args = { "--single-quote" },
                stdin = true,
            }
        end

        -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
        require("formatter").setup {
            -- Enable or disable logging
            logging = true,
            -- Set the log level
            log_level = vim.log.levels.WARN,
            -- All formatter configurations are opt-in
            filetype = {
                css = {
                    require("formatter.filetypes.css").prettierd,
                },
                json = {
                    require("formatter.filetypes.json").jq,
                },
                javascript = {
                    require("formatter.filetypes.javascript").prettierd,
                },
                markdown = {
                    require("formatter.filetypes.markdown").prettierd,
                },
                typescript = {
                    require("formatter.filetypes.javascript").prettierd,
                },
                typescriptreact = {
                    require("formatter.filetypes.javascript").prettierd,
                },
                javascriptreact = {
                    require("formatter.filetypes.javascript").prettierd,
                },
                -- Formatter configurations for filetype "lua" go here
                -- and will be executed in order
                lua = {
                    -- "formatter.filetypes.lua" defines default configurations for the
                    -- "lua" filetype
                    require("formatter.filetypes.lua").stylua,

                    -- You can also define your own configuration
                    function()
                        -- Supports conditional formatting
                        if util.get_current_buffer_file_name() == "special.lua" then
                            return nil
                        end

                        -- Full specification of configurations is down below and in Vim help
                        -- files
                        return {
                            exe = "stylua",
                            args = {
                                "--search-parent-directories",
                                "--stdin-filepath",
                                util.escape_path(util.get_current_buffer_file_path()),
                                "--",
                                "-",
                            },
                            stdin = true,
                        }
                    end
                },

                -- Use the special "*" filetype for defining formatter configurations on
                -- any filetype
                ["*"] = {
                    -- "formatter.filetypes.any" defines default configurations for any
                    -- filetype
                    require("formatter.filetypes.any").remove_trailing_whitespace
                }
            }
        }
        vim.keymap.set('n', '<leader>F', ':Format<cr>', opts)
    end,
}
