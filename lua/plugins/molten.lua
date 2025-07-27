return {
  "benlubas/molten-nvim",
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  init = function()
    -- this is an example, not a default. Please see the readme for more configuration options
    vim.g.molten_output_win_max_height = 12
    vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
  end,
  config = function()
    local init = function()
      local quarto_cfg = require("quarto.config").config
      quarto_cfg.codeRunner.default_method = "molten"
      vim.cmd([[MoltenInit]])
    end
    local deinit = function()
      local quarto_cfg = require("quarto.config").config
      quarto_cfg.codeRunner.default_method("slime")
      vim.cmd([[MoltenDeinit]])
    end
    vim.keymap.set("n", "<leader>mi", init, { silent = true, desc = "Initialize molten" })
    vim.keymap.set("n", "<leader>md", deinit, { silent = true, desc = "Stop molten" })
    vim.keymap.set("n", "<leader>mrl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Molten Evaluate Line" })
    vim.keymap.set("n", "<leader>mrr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Molten RE Evaluate Cell" })
    vim.keymap.set(
      "v",
      "<leader>mrv",
      ":<C-u>MoltenEvaluateVisual<CR>gv",
      { silent = true, desc = "evaluate visual selection" }
    )
    vim.keymap.set("n", "<leader>mp", ":MoltenImagePopup<CR>", { silent = true, desc = "molten image popup" })
    vim.keymap.set("n", "<leader>mb", ":MoltenOpenInBrowser<CR>", { silent = true, desc = "molten open in browser" })
    vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
    vim.keymap.set("n", "<leader>ms", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "show/enter output" })
    vim.keymap.set("n", "<leader>ip", function()
      local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
      if venv ~= nil then
        -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
        venv = string.match(venv, "/.+/(.+)")
        vim.cmd(("MoltenInit %s"):format(venv))
      else
        vim.cmd("MoltenInit python3")
      end
    end, { desc = "Initialize Molten for python3", silent = true })
  end,
}
