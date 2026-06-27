require("project_nvim").setup {
    detection_methods = { "pattern" },
    patterns = { ".git" },
    silent_chdir = true,
}

require("telescope").load_extension "projects"
