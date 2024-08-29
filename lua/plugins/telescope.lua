return {
  {
    "nvim-telescope/telescope.nvim",

    keys = {
      { "<leader>,", false },
      { "<leader>ff", false },
      { "<leader>gs", false },
    },
  },
  {
    "ibhagwan/fzf-lua",

    keys = {
      { "<leader>,", false },
      { "<leader>ff", false },
      { "<leader>gs", false },
    },
    opts = {
      file_ignore_patterns = { "%.lua$", "%.vim$", "%lock.json$" },
    },
  },
}
