require("project_nvim").setup {
    detection_methods = { "pattern" },
    patterns = { ".git" },
    silent_chdir = true,
}

require("telescope").load_extension "projects"

-- Base paths to scan for git repos on startup.
-- Add any root directory that contains your projects (flat or org/repo structure).
local base_paths = {
    vim.fn.expand "~/projects",
}

local function scan_git_repos(path, depth)
    if depth == 0 then return end
    local handle = vim.uv.fs_scandir(path)
    if not handle then return end
    while true do
        local name, ftype = vim.uv.fs_scandir_next(handle)
        if not name then break end
        if ftype == "directory" and name:sub(1, 1) ~= "." then
            local full = path .. "/" .. name
            if vim.uv.fs_stat(full .. "/.git") then
                table.insert(require("project_nvim.utils.history").session_projects, full)
            else
                scan_git_repos(full, depth - 1)
            end
        end
    end
end

-- Defer so project.nvim finishes reading its history file asynchronously first.
-- Deduplication against the history is handled by project.nvim's sanitize_projects().
vim.defer_fn(function()
    for _, base in ipairs(base_paths) do
        scan_git_repos(base, 3)
    end
end, 200)
