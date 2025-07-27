-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "markdown" },
--   callback = function()
--     vim.opt_local.wrap = false
--     vim.opt_local.spell = false
--   end,
-- })
--
-- create notebook_template
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.ipynb",
  callback = function()
    local template = vim.fn.expand("~/.config/nvim/templates/notebook_template.qmd")
    if vim.fn.filereadable(template) == 1 then
      vim.cmd("0r " .. template)
      -- Optional: Save as jupytext .ipynb right away
      vim.cmd("write")
    end
  end,
})

vim.api.nvim_create_user_command("NewNotebook", function()
  local filename = vim.fn.input("Notebook name: ", "notebook.qmd")
  if filename ~= "" then
    local path = vim.fn.expand("~/.config/nvim/templates/notebook_template.qmd")
    if vim.fn.filereadable(path) == 1 then
      -- Copy template content
      vim.fn.writefile(vim.fn.readfile(path), filename)
    end
    vim.cmd("edit " .. filename)
  end
end, {})

vim.api.nvim_create_user_command("JupytextExport", function()
  local file = vim.fn.expand("%:p")
  vim.fn.jobstart({ "jupytext", "--to", "ipynb", file }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      for _, line in ipairs(data) do
        print(line)
      end
    end,
  })
end, {})
