-- Personal keymaps and text transformations

-- Transform visually selected lines into a quoted list:
--   JAN123        ['JAN123',
--   JAN456   =>    'JAN456',
--   JAN789         'JAN789',]
vim.keymap.set('v', '<leader>ql', function()
  -- Get selection range
  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  local result = {}
  for i, line in ipairs(lines) do
    local trimmed = vim.trim(line)
    if trimmed ~= '' then
      if i == 1 then
        table.insert(result, "['" .. trimmed .. "',")
      elseif i == #lines then
        table.insert(result, " '" .. trimmed .. "',]")
      else
        table.insert(result, " '" .. trimmed .. "',")
      end
    end
  end

  vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, result)
end, { desc = '[Q]uote [L]ist: wrap lines in a quoted list' })
