local M = {}

function M.show_new_window(windowText)
  -- Create a new buffer
  local buf = vim.api.nvim_create_buf(false, true)

  -- Set some text in the buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {"Response should appear here"})

  -- Get the dimensions of the current window
  local width = vim.api.nvim_get_option("columns")
  local height = vim.api.nvim_get_option("lines")

  -- Calculate the size of the new window
  local win_width = math.ceil(width * 0.8)
  local win_height = math.ceil(height * 0.8)

  -- Calculate the starting position for the new window
  local row = math.ceil((height - win_height) / 2)
  local col = math.ceil((width - win_width) / 2)

  -- Set up the options for the new window
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "rounded"
  }

  -- Open the new window
  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Optional: Set window-local options
  vim.api.nvim_win_set_option(win, "winhl", "Normal:MyHighlight")
end

function M.executeBash(command1, command2, argument)
  local full_command = command1 .. " " .. command2 .. " " .. table.concat(argument, " ") .. " --silent"
  local result = vim.fn.system(full_command)
  return result
end

-- Example usage
function M.myCodyChat(request)
    local output = M.executeBash("cody", "chat", request)
    M.show_new_window(output)
end

-- main setup function
function M.setup()
  vim.api.nvim_create_user_command(
    'MyCodyChat',
    function(args)
        M.myCodyChat(args)
    end,
    {nargs = '+', complete = 'file'})
end

return M
