local M = {}

local function hex_to_rgb(hex)
  -- Remove the "#" character if present
  hex = hex:gsub('#', '')

  -- Split the hex code into separate red, green, and blue components
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)

  -- Return the color values as three separate integers
  return { r, g, b }
end

local function rgb_to_hex(red, green, blue)
  return string.format('#%02X%02X%02X', red, green, blue)
end

function M.blend(hex_fg, hex_bg, alpha)
  local rgb_bg = hex_to_rgb(hex_bg)
  local rgb_fg = hex_to_rgb(hex_fg)
  local min = math.min
  local max = math.max
  local floor = math.floor

  local function blend_channel(channel)
    local blended_channel = alpha * rgb_fg[channel] + ((1 - alpha) * rgb_bg[channel])

    return floor(min(max(0, blended_channel), 255) + 0.5)
  end

  return rgb_to_hex(blend_channel(1), blend_channel(2), blend_channel(3))
end

return M
