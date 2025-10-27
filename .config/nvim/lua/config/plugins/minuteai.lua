return {
  'milanglacier/minuet-ai.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('minuet').setup {
      provider = 'gemini',
      provider_options = {
        -- Configuration for Gemini
        gemini = {
          optional = {
            generationConfig = {
              maxOutputTokens = 256,
              -- When using `gemini-2.5-flash`, it is recommended to entirely
              -- disable thinking for faster completion retrieval.
              thinkingConfig = {
                thinkingBudget = 0,
              },
            },
            safetySettings = {
              {
                -- HARM_CATEGORY_HATE_SPEECH,
                -- HARM_CATEGORY_HARASSMENT
                -- HARM_CATEGORY_SEXUALLY_EXPLICIT
                category = 'HARM_CATEGORY_DANGEROUS_CONTENT',
                -- BLOCK_NONE
                threshold = 'BLOCK_ONLY_HIGH',
              },
            },
          },
          model = 'gemini-2.0-flash',
          stream = true,
          api_key = 'GEMINI_API_KEY',
          end_point = 'https://generativelanguage.googleapis.com/v1beta/models',
          optional = {},
        },
      },
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          -- accept whole completion
          accept = '<A-A>',
          -- accept one line
          accept_line = '<A-a>',
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = '<A-z>',
          -- Cycle to prev completion item, or manually invoke completion
          prev = '<A-[>',
          -- Cycle to next completion item, or manually invoke completion
          next = '<A-]>',
          dismiss = '<A-e>',
        },
      },
      default_config = {
        cmp = {
          enable_auto_complete = true,
        },
        blink = {
          enable_auto_complete = true,
        },
      },
    }
  end,
}
