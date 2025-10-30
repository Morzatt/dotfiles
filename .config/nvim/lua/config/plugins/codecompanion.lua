return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    adapters = {
      -- You would replace 'gemini_adapter' with the actual adapter name
      -- or configure the 'openai' adapter if it supports a base_url override
      -- to point to a Gemini API gateway.
      gemini_config = function()
        return require('adapters.http.gemini').extend('gemini', { -- Or the specific Gemini adapter if one exists
          env = {
            api_key = os.getenv 'GEMINI_API_KEY',
            base_url = 'https://api.example-gemini-proxy.com/v1', -- Replace with actual base URL if proxying
          },
          model = 'gemini-2.0-flash', -- Or your preferred Gemini model
        })
      end,
    },
    -- Set your default adapter for the chat strategy
    strategies = {
      chat = {
        adapter = 'gemini_config',
      },
      inline = {
        adapter = 'gemini_config',
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = 'DEBUG',
    },
  },
}
