# Filename: nvim-config.nix (FULLY UPDATED & COMPLETE)
#
# This module integrates settings from all uploaded Lua files.
# It is designed for use with the NixVim project.

{ config, pkgs, lib, ... }:

let
  # Lua function for Treesitter file size check (from Treesitter.lua)
  treesitterDisableFunction = /* lua */ ''
    function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
        return false
    end
  '';
in
{
  # 0. Global Vim Options & Variables
  options = {
    fillchars.eob = " ";
    termguicolors = true;
    clipboard = "unnamedplus";
  };

  programs.nixvim.globals = {
    mapleader = " ";
    OmniSharp_server_use_mono = 1;
    OmniSharp_selector_ui = "fzf";
    OmniSharp_server_use_net6 = 1;
    # comfortable-motion.vim settings
    comfortable_motion_scroll_down_key = "j";
    comfortable_motion_scroll_up_key = "k";
    comfortable_motion_no_default_key_mappings = 1;
    comfortable_motion_impulse_multiplier = 25;
  };

  # 1. Custom Files (`au.lua` library)
  home.file.".config/nvim/lua/au.lua" = {
    # Full content of au.lua omitted for brevity, but it is included
    # in the code output and remains unchanged.
    text = /* lua */ ''
      -- The full content of au.lua
      local cmd = vim.api.nvim_command
      local function autocmd(this, event, spec)
          local is_table = type(spec) == 'table'
          local pattern = is_table and spec[1] or '*'
          local action = is_table and spec[2] or spec
          if type(action) == 'function' then
              action = this.set(action)
          end
          local e = type(event) == 'table' and table.concat(event, ',') or event
          cmd('autocmd ' .. e .. ' ' .. pattern .. ' ' .. action)
      end
      local S = {
          __au = {},
      }
      local X = setmetatable({}, {
          __index = S,
          __newindex = autocmd,
          __call = autocmd,
      })
      function S.exec(id)
          S.__au[id]()
      end
      function S.set(fn)
          local id = string.format('%p', fn)
          S.__au[id] = fn
          return string.format('lua require("au").exec("%s")', id)
      end
      function S.group(grp, cmds)
          cmd('augroup ' .. grp)
          cmd('autocmd!')
          if type(cmds) == 'function' then
              cmds(X)
          else
              for _, au in ipairs(cmds) do
                  autocmd(S, au[1], { au[2], au[3] })
              end
          end
          cmd('augroup END')
      end
      return X
    '';
  };

  # 2. Keymaps (All global and buffer keymaps combined)
  keymaps = [
    # Global Keymaps
    { mode = "n", key = "<Leader>n", action = ":NvimTreeToggle<CR>", options = { noremap = true } }
    { mode = "n", key = "<Leader>t", action = ":terminal<CR>", options = { noremap = true } }
    { mode = "i", key = "',.", action = "<ESC>", options = { noremap = true } }
    { mode = "n", key = "<Leader>qq", action = ":quitall!<cr>", options = { noremap = true, silent = true } }
    { mode = "n", key = "<Leader>s", action = ":w!", options = { noremap = true, silent = true } }
    # Window Resizing
    { mode = "n", key = "<Leader><Left>", action = ":vertical resize -4<cr>", options = { noremap = true } }
    { mode = "n", key = "<Leader><Right>", action = ":vertical resize +6<cr>", options = { noremap = true } }
    { mode = "n", key = "<Leader><Down>", action = ":resize -4<cr>", options = { noremap = true } }
    { mode = "n", key = "<Leader><Up>", action = ":resize +6<cr>", options = { noremap = true } }
    # Window Navigation
    { mode = "n", key = "<C-J>", action = "<C-W><C-J>", options = { noremap = true } }
    { mode = "n", key = "<C-K>", action = "<C-W><C-K>", options = { noremap = true } }
    { mode = "n", key = "<C-L>", action = "<C-W><C-L>", options = { noremap = true } }
    { mode = "n", key = "<C-H>", action = "<C-W><C-H>", options = { noremap = true } }
    # Plugin Keymaps
    { mode = "n", key = "<Leader>w", action = ":colorscheme pywal<cr>", options = { noremap = true, silent = true } }
    { mode = "n", key = "<C-.>", action = ":CodeActionMenu<cr>", options = { noremap = true } }
    # Fugitive Keymaps
    { mode = "n", key = "<Leader>gs", action = "<CMD>G<CR>", options = { noremap = true } }
    { mode = "n", key = "<Leader>gq", action = "<CMD>G<CR><CMD>q<CR>", options = { noremap = true } }
    { mode = "n", key = "<Leader>gw", action = "<CMD>Gwrite<CR>", options = { noremap = true } }
    { mode = "n", key = "<Leader>gr", action = "<CMD>Gread<CR>", options = { noremap = true } }
    { mode = "n", key = "<Leader>gh", action = "<CMD>diffget //2<CR>", options = { noremap = true } }
    { mode = "n", key = "<Leader>gl", action = "<CMD>diffget //3<CR>", options = { noremap = true } }
    { mode = "n", key = "<Leader>gp", action = "<CMD>Git push<CR>", options = { noremap = true } }
    # Align.nvim Keymaps (using raw lua)
    { mode = "v", key = "aa", action = "lua require'align'.align_to_char()", options = { noremap = true, silent = true } }
    { mode = "v", key = "aq", action = "lua require'align'.align_to_char(2)", options = { noremap = true, silent = true } }
    { mode = "v", key = "ac", action = "lua require'align'.align_to_char(1, true)", options = { noremap = true, silent = true } }
    { mode = "v", key = "aw", action = "lua require'align'.align_to_string()", options = { noremap = true, silent = true } }
    { mode = "v", key = "as", action = "lua require'align'.align_to_string(false, true)", options = { noremap = true, silent = true } }
    { mode = "v", key = "ar", action = "lua require'align'.align_to_string(true)", options = { noremap = true, silent = true } }
    { mode = "v", key = "ae", action = "lua require'align'.align_to_string(true, true)", options = { noremap = true, silent = true } }
  ];

  # 3. Plugin Configuration
  programs.nixvim = {
    enable = true;

    # LSP Configuration (including nvim-lsp and lsp-installer functionality)
    plugins.lsp = {
      enable = true;
      servers = {
        pyright.enable = true; clangd.enable = true; lua-ls.enable = true; gopls.enable = true;
        eslint.enable = true; cssls.enable = true; csharp-ls.enable = true; omnisharp.enable = true;
      };
      serverSettings = {
        gopls = { filetypes = [ "go" "gomod" ]; };
        eslint = {
          cmd = [ "vscode-eslint-language-server" "--stdio" ];
          filetypes = [ "javascript" "javascriptreact" "javascript.jsx" "typescript" "typescriptreact" "typescript.tsx" "vue" "svelte" "astro" ];
          settings = { format = true; run = "onType"; workingDirectory.mode = "location"; };
          on_attach = ''
            function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end
          '';
        };
        cssls = { cmd = [ "vscode-css-language-server" "--stdio" ]; filetypes = [ "css" "scss" "less" ]; };
        csharp-ls = { cmd = [ "/home/gilli/.dotnet/tools/csharp-ls" ]; };
        omnisharp = {
          enable_editorconfig_support = true;
          enable_ms_build_load_projects_on_demand = false;
          enable_roslyn_analyzers = false;
          organize_imports_on_format = false;
          enable_import_completion = false;
          sdk_include_prereleases = true;
          analyze_open_documents_only = false;
        };
      };
      keymaps = {
        normal = {
          "K" = "vim.lsp.buf.hover()";
          "gd" = "vim.lsp.buf.definition()";
          "gD" = "vim.lsp.buf.declaration()";
          "gi" = "vim.lsp.buf.implementation()";
          "go" = "vim.lsp.buf.type_definition()";
          "gr" = "vim.lsp.buf.references()";
          "<C-k>" = "vim.lsp.buf.signature_help()";
          "<F2>" = "vim.lsp.buf.rename()";
          "<F4>" = "vim.lsp.buf.code_action()";
        };
        visual = {
          "<F4>" = "vim.lsp.buf.range_code_action()";
        };
      };
    };

    # nvim-dap (Debugger) (from nvim-dap.lua)
    plugins.dap = {
      enable = true;
      # Define the C/C++ adapter
      adapters.cpp = {
        type = "executable";
        command = "lldb-vscode";
        env.LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES";
        name = "lldb";
      };
      # Define the C/C++ configurations
      configurations.cpp = [
        {
          name = "Launch";
          type = "cpp";
          request = "launch";
          program = "function() return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file') end";
          cwd = ''${workspaceFolder}'';
          args = [ ];
        }
      ];
      configurations.c = config.programs.nixvim.plugins.dap.configurations.cpp;
    };

    # nvim-dap-ui (Debugger UI)
    plugins.dap-ui = {
      enable = true;
      settings = {
        icons = { expanded = "▾"; collapsed = "▸"; current_frame = "▸"; };
        mappings = { expand = [ "<CR>" "<2-LeftMouse>" ]; open = "o"; remove = "d"; edit = "e"; repl = "r"; toggle = "t"; };
        expand_lines = "vim.fn.has('nvim-0.7') == 1";
        layouts = [
          { elements = [ { id = "scopes"; size = 0.25; } "breakpoints" "stacks" "watches" ]; size = 40; position = "left"; }
          { elements = [ "repl" "console" ]; size = 0.25; position = "bottom"; }
        ];
        controls = { enabled = true; element = "repl"; icons = { pause = ""; play = ""; step_into = ""; step_over = ""; step_out = ""; step_back = ""; run_last = "↻"; terminate = "□"; }; };
        floating = { border = "single"; mappings = { close = [ "q" "<Esc>" ]; }; };
        windows.indent = 1; render.max_value_lines = 100;
      };
    };

    # nvim-treesitter & nvim-ts-rainbow2
    plugins.treesitter = {
      enable = true;
      settings = {
        ensure_installed = [ "c" "lua" "rust" "python" "cpp" ];
        sync_install = false; auto_install = true;
        ignore_install = [ "javascript" ];
        highlight = {
          enable = true;
          disable = treesitterDisableFunction;
          additional_vim_regex_highlighting = false;
        };
      };
      autotag.enable = true;
      rainbow = { enable = true; extended_mode = true; };
    };

    # nvim-tree
    plugins.nvim-tree = {
      enable = true;
      settings = {
        disable_netrw = true; hijack_netrw = true; hijack_cursor = true;
        hijack_unnamed_buffer_when_opening = false; update_cwd = true;
        update_focused_file = { enable = true; update_cwd = false; };
        view = { adaptive_size = true; side = "left"; width = 25; };
        git.enable = true;
        actions.open_file.resize_window = true;
        renderer = {
          highlight_git = true; highlight_opened_files = "none";
          icons.show = { file = true; folder = true; folder_arrow = true; git = true; };
        };
      };
    };

    # lualine.nvim (from lualine.lua)
    plugins.lualine = {
      enable = true;
      options = {
        icons_enabled = true;
        theme = "pywal-nvim"; # Matches your pywal plugin
        component_separators = { left = ""; right = ""; };
        section_separators = { left = ""; right = ""; };
        disabled_filetypes = { statusline = [ ]; winbar = [ ]; };
        ignore_focus = { };
        always_divide_middle = true;
        globalstatus = false;
        refresh = { statusline = 1000; tabline = 1000; winbar = 1000; };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = [ "encoding" "fileformat" "filetype" ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
      inactive_sections = {
        lualine_a = [ ]; lualine_b = [ ];
        lualine_c = [ "filename" ];
        lualine_x = [ "location" ];
        lualine_y = [ ]; lualine_z = [ ];
      };
      tabline = { }; winbar = { }; inactive_winbar = { }; extensions = [ ];
    };

    # gitsigns.nvim
    plugins.gitsigns = {
      enable = true;
      signs = {
        add = { text = "✚"; }; change = { text = "✹"; }; delete = { text = "_"; };
        topdelete = { text = "‾"; }; changedelete = { text = "~"; };
      };
      signcolumn = true; numhl = false; linehl = false; word_diff = false;
      watch_gitdir = { interval = 1000; follow_files = true; };
      attach_to_untracked = true; current_line_blame = false;
      current_line_blame_opts = {
        virt_text = true; virt_text_pos = "eol"; delay = 1000; ignore_whitespace = false;
      };
      current_line_blame_formatter = "<author>, <localtime> - <summary>";
    };

    # null-ls.nvim (from null-ls.lua)
    plugins.none-ls = {
      enable = true;
      # You can add sources like this:
      # sources = {
      #   "null-ls.builtins.formatting.autopep8",
      # };
    };

    # Other plugins (with simple configs)
    plugins.guihua-lua.config = '' require('guihua.maps').setup({ maps = { close_view = '<C-x>', } }) '';
    plugins.pywal-nvim.config = '' require('pywal').setup() '';
    plugins.pretty-fold-nvim.config = '' require('pretty-fold').setup() '';
    plugins.nvim-colorizer-lua.config = '' require('colorizer').setup() '';
    plugins.nvim-autopairs.config = '' require('nvim-autopairs').setup() '';
    plugins.nvim-comment.config = '' require('nvim_comment').setup() '';
    plugins.go-nvim.config = '' require('go').setup() '';
    plugins.nvim-notify.config = '' vim.notify = require "notify" '';

    # Other simple plugins enabled via packer-plugins.lua
    plugins.nvim-nio.enable = true; plugins.lspkind.enable = true; plugins.align-nvim.enable = true;
    plugins.telescope.enable = true; plugins.vim-dadbod.enable = true; plugins.vim-dadbod-ui.enable = true;
    plugins.live-server-nvim.enable = true; plugins.web-devicons.enable = true; plugins.startup-nvim.enable = true;
    plugins.vim-fugitive.enable = true; plugins.vim-vsnip.enable = true; plugins.nvim-code-action-menu.enable = true;
    plugins.vim-hexokinase.enable = true; plugins.comfortable-motion-vim.enable = true; plugins.bracey-vim.enable = true;
  };

  # 4. Extra Autocmds
  programs.nixvim.extraAutocmds = [
    # NvimTree: Prevent NvimTreeToggle on first opening a file
    {
      events = [ "BufNewFile" "BufReadPost" ];
      callback = /* lua */ ''
        function(args)
          if vim.fn.expand "%:p" ~= "" then
            vim.api.nvim_del_autocmd(args.id)
            vim.cmd "noautocmd NvimTreeToggle"
            vim.schedule(function()
              vim.cmd "wincmd p"
            end)
          end
        end
      '';
    }
    # Go: Auto-format on save
    {
      event = "BufWritePre";
      pattern = "*.go";
      group = "GoFormat";
      callback = /* lua */ "function() require('go.format').goimport() end";
    }
    # DAP: Open/Close dapui on events
    {
      event = "VimEnter";
      callback = /* lua */ ''
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      '';
    }
  ];

  # 5. Extra System Packages (Dependencies)
  programs.nixvim.extraPackages = with pkgs; [
    fzf # For OmniSharp/Telescope
    # lldb-vscode should be installed if you are using the C/C++ DAP config
    lldb-vscode
  ];
}
