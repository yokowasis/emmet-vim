local M = {}

M.get_node_at_cursor = function()
	-- Use modern vim.treesitter API instead of deprecated nvim-treesitter.ts_utils
	-- vim.treesitter.get_node() is available in Neovim 0.9+
	local ok, node = pcall(vim.treesitter.get_node)
	if not ok or not node then
		return nil
	end

	while node do
		local node_type = node:type()

		if node_type == "element" then
			return "html"
		elseif node_type == "stylesheet" then
			return "css"
		end

		node = node:parent()
	end

	return ""
end

return M
