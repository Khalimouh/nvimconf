require("noice").setup {
    cmdline = {
        view = "cmdline_popup",
    },
    views = {
        cmdline_popup = {
            position = {
                row = vim.o.lines - 5,
                col = "50%",
            },
            size = {
                width = 60,
                height = "auto",
            },
            border = {
                style = "rounded",
            },
            win_options = {
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
        },
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false,
        },
        hover = {
            enabled = false,
            silent = true,
        },
        signature = {
            enabled = true,
            trigger = false,
            auto_open = false,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
}
