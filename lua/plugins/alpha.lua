return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
	  ███╗   ██╗ █████╗ ███████╗██╗███████╗
	  ████╗  ██║██╔══██╗██╔════╝██║╚══███╔╝
	  ██╔██╗ ██║███████║█████╗  ██║  ███╔╝ 
	  ██║╚██╗██║██╔══██║██╔══╝  ██║ ███╔╝  
	  ██║ ╚████║██║  ██║██║     ██║███████╗
	  ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
	                [@ahammadnafi_z]
    ]]
    dashboard.section.header.val = vim.split(logo, "\n")
    return dashboard.opts
  end,
}
