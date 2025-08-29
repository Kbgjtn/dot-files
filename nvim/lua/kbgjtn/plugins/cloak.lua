return {
   --[[ "laytan/cloak.nvim",
   event = { "BufReadPre", "BufNewFile", "VeryLazy" },
   config = function()
      require("cloak").setup({
         cloak_character = "*",
         highlight_group = "Comment",
         try_all_patterns = true,
         patterns = {
            {
               file_pattern = ".*env",
               cloak_pattern = "=.+",
               replace = nil,
            },
         },
      })
   end, ]]
}
