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

	-- ── Terraform settings ────────────────────────────────────────────────────

	vim.api.nvim_create_autocmd('FileType', {
	  pattern = { 'terraform', 'hcl' },
	  callback = function()
	    vim.b.terraform_fmt_on_save = 1  -- auto-format on save (used by none-ls)
	    vim.b.terraform_align = 1        -- align = signs in terraform blocks
	  end,
	})
