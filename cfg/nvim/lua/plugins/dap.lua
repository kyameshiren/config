return {
        { "mfussenegger/nvim-dap",
        dependencies = {
                "rcarriga/nvim-dap-ui",
                "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
                local dap = require "dap"
                local ui = require "dapui"

                require("dapui").setup()
                require("nvim-dap-virtual-text").setup()
                require("dap-python").setup("python3")
        end,
        },

        { "mfussenegger/nvim-dap-python", 
        dependencies = {
                "mfussenegger/nvim-dap",
        },
        config = function()
                require("dap-python").setup("python3")
        end,
        },
}
