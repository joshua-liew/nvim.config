-- refer to https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file
local builtin = require('telescope.builtin')

-- Custom replace_all
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function replace_all(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)

  if not picker then
    return
  end

  local search = picker:_get_prompt()

  if search == "" then
    vim.notify("Search term is empty", vim.log.levels.WARN)
    return
  end

  -- Send all Telescope results to quickfix.
  -- This also closes Telescope.
  actions.send_to_qflist(prompt_bufnr)

  vim.schedule(function()
    vim.ui.input({
      prompt = "Replace '" .. search .. "' with: ",
    }, function(replacement)
      if replacement == nil then
        return
      end

      local pattern = vim.fn.escape(search, [[\/]])
      local replace = vim.fn.escape(replacement, [[\/&]])

      -- Remember where we started.
      local original_win = vim.api.nvim_get_current_win()
      local original_buf = vim.api.nvim_get_current_buf()
      local original_view = vim.fn.winsaveview()

      -- Replace once per file and save.
      vim.cmd(
        "keepjumps cfdo %s/\\V"
          .. pattern
          .. "/"
          .. replace
          .. "/g | update"
      )

      -- Restore the original buffer/window/view.
      if vim.api.nvim_win_is_valid(original_win)
          and vim.api.nvim_buf_is_valid(original_buf) then
        vim.api.nvim_set_current_win(original_win)
        vim.api.nvim_win_set_buf(original_win, original_buf)
        vim.fn.winrestview(original_view)
      end

      vim.cmd("cclose")

      -- Open Telescope again, this time searching for the replacement.
      if replacement ~= "" then
        vim.schedule(function()
          builtin.grep_string({
            search = replacement,
          })
        end)
      end
    end)
  end)
end

telescope.setup({
  pickers = {
    live_grep = {
      mappings = {
        i = {
          ["<C-r>"] = replace_all,
        },
        n = {
          ["<C-r>"] = replace_all,
        },
      },
    },
  },
})

