local M = {}

-- param: relative path from the config directory, e.g., "commands.json"
function M.load(relative_path)
  if not relative_path then
    vim.notify("No file path provided to load_commands", vim.log.levels.WARN)
    return {}
  end

  -- build the full path
  local path = vim.fn.stdpath("config") .. "/" .. relative_path

  local f, err = io.open(path, "r")
  if not f then
    vim.notify("Could not open " .. path .. ": " .. err, vim.log.levels.WARN)
    return {}
  end

  local content = f:read("*a")
  f:close()

  local ok, results = pcall(vim.json.decode, content)
  if not ok then
    vim.notify("Error decoding JSON from " .. path .. ": " .. results, vim.log.levels.ERROR)
    return {}
  end

  return results
end

return M
