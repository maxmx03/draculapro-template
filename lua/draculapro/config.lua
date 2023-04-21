local M = {}

function M:new()
  local config = {
    theme = 'pro',
    colors = {},
    user_config = {},
  }

  setmetatable(config, self)
  self.__index = self

  return config
end

function M:set_config(config)
  if not vim.tbl_isempty(self.user_config) or not config then
    return
  end

  self.user_config = config
end

function M:set_theme()
  if vim.tbl_isempty(self.user_config) then
    return
  end

  self.theme = self.user_config.theme
end

return M
