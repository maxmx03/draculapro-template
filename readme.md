## Draculapro

`username/draculapro`

### Getting started

To get started with Draculapro, you'll need to add the color values manually to the
lua/draculapro/palette.lua file.

### Quick setup

```lua
  {
    'maxmx03/dracula.nvim',
    config = function()
      local dracula = require 'dracula'
      local draculapro = require 'draculapro'

      draculapro.setup({
        theme = 'pro'
      })

      dracula.setup {
        dracula_pro = true,
        colors = draculapro.colors
      }

      vim.cmd.colorscheme 'dracula'
    end,
    dependencies = {
      'username/draculapro',
    },
  },
```

### Themes

- Pro
- Blade
- Buffy
- Lincon
- Morbius
- Van Helsing