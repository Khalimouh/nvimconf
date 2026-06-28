vim.filetype.add({
	  extension = {
	    hcl      = 'hcl',
	    tf       = 'terraform',
	    tfvars   = 'terraform',
	    tfstate  = 'json',
	  },
	  filename = {
	    ['.terraformrc'] = 'hcl',
	    ['terraform.rc'] = 'hcl',
	  },
	  pattern = {
	    ['.*%.tfstate%.backup'] = 'json',
	  },
	})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
        if #vim.lsp.get_clients({ name = "terraformls", bufnr = 0 }) > 0 then
            vim.lsp.codelens.refresh({ bufnr = 0 })
        end
    end,
})
