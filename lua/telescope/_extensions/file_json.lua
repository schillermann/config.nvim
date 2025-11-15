local M = {}

-- param: relative path from the config directory, e.g., "commands.json"
function M.load(relative_path)
  if not relative_path then
    vim.notify("No file path provided to load JSON file", vim.log.levels.ERROR)
    return {}
  end

  -- build the full path
  local path = vim.fn.stdpath("config") .. "/" .. relative_path

  local f, err = io.open(path, "r")
  if not f then
    vim.notify("Could not open JSON file " .. path .. ": " .. err, vim.log.levels.ERROR)
    return {}
  end

  local json = f:read("*a")
  f:close()

  local ok, table = pcall(vim.json.decode, json)
  if not ok then
    vim.notify("Error decoding JSON from " .. path .. ": " .. table, vim.log.levels.ERROR)
    return {}
  end

  if type(table) ~= "table" then
    vim.notify("JSON is not valid: " .. path, vim.log.levels.ERROR)
    return {}
  end

  return table
end

return M
