local palette = require("draculapro.palette")
local Config = require("draculapro.config")
local M = Config:new()

function M.setup(config)
	M:set_config(config)
	M:set_theme()
	local base = palette["base"]
	local pro = palette[M.theme]

	M.colors = vim.tbl_extend("keep", base, pro)
end

return M
