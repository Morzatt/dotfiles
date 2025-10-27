return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    adapters = {
      acp = {
        gemini_cli = function()
          return require('codecompanion.adapters').extend('gemini_cli', {
            env = {
              api_key = 'cmd:op read op://personal/Gemini/credential --no-newline',
            },
          })
        end,
      },
    },
    strategies = {
      chat = {
        adapter = 'anthropic',
        model = 'claude-sonnet-4-20250514',
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = 'DEBUG',
    },
  },
}
