return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>e", "<leader>fE", desc="Explorer NeoTree (cwd)", remap=true },
    { "<leader>E", "<leader>fe", desc="Explorer NeoTree (root)", remap=true }
  },
  opts = {
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    }
  }
}
