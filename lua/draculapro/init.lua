local palette = require 'draculapro.palette'
local Config = require 'draculapro.config'
local utils = require 'draculapro.utils'
local M = Config:new()

function M.get_blended_colors(base, bg)
  local alpha
  local b = utils.blend
  local blended_colors = {}

  for color_name, color_value in pairs(base) do
    if color_name ~= 'fg' then
      if color_name == 'pink' then
        alpha = 0.30
      else
        alpha = 0.15
      end

      local blended_color = b(color_value, bg, alpha)
      local blended_name = 'blended_' .. color_name

      blended_colors[blended_name] = blended_color
    end
  end

  return blended_colors
end

function M.setup(config)
  M:set_config(config)
  M:set_theme()
  local base = palette['base']
  local pro = palette[M.theme]
  local blended_colors = M.get_blended_colors(base, pro.bg)

  M.colors = vim.tbl_extend('keep', base, pro)
  M.colors = vim.tbl_extend('keep', M.colors, blended_colors)
end

return M
