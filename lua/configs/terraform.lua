zebi.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
zebi.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
zebi.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
zebi.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
zebi.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
zebi.cmd([[let g:terraform_fmt_on_save=1]])
zebi.cmd([[let g:terraform_align=1]])

