return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window.mappings = {
        -- quit on open
        ["l"] = function(state)
          local node = state.tree:get_node()
          if require("neo-tree.utils").is_expandable(node) then
            state.commands["toggle_node"](state)
          else
            state.commands["open"](state)
            state.commands["close_window"](state)
            vim.cmd("normal! M")
          end
        end,
        ["h"] = "close_node",
        ["H"] = "close_all_nodes",
      }
      opts.filesystem.filtered_items = {
        hide_dotfiles = false,
        hide_gitignore = true,
        hide_hidden = false,
        hide_by_name = {
          "node_modules",
          ".git",
          ".cache",
          ".vscode",
          ".idea",
          ".DS_Store",
          "__pycache__",
          ".pytest_cache",
          ".mypy_cache",
          ".venv",
          ".tox",
          "package-lock.json",
          "yarn.lock",
          "pnpm-lock.yaml",
        },
      }
    end,
  },
}
