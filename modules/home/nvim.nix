{ config, pkgs, ... }:

{
	programs.nixvim = {
		enable = true;

		opts = {
			number = true;
			relativenumber = true;
			tabstop = 4;
			shiftwidth = 4;
			termguicolors = true;
			foldmethod = "marker";
		};

		keymaps = [
			{ mode = "i"; key = "jj"; action = "<Esc>"; options.desc = "Exit insert mode"; }
		];

		colorschemes.catppuccin = {
			enable = true;
			settings.flavour = "mocha";
		};

		plugins.nvim-autopairs.enable = true;
		
		plugins.treesitter = {
			enable = true;
			settings.highlight.enable = true;
		};

		plugins.lsp = {
			enable = true;
			servers = {
				clangd.enable = true;
				lua_ls.enable = true;
				pyright.enable = true;
				omnisharp.enable = true;
				zls.enable = true;
			};
		};

		plugins.luasnip.enable = true;
		plugins.cmp = {
			enable = true;
			autoEnableSources = true;
			settings = {
				snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
				sources = [
					{ name = "nvim_lsp"; }
					{ name = "luasnip"; }
				];
				mapping = {
					"<C-Space>" = "cmp.mapping.complete()";
					"<C-e>" = "cmp.mapping.abort()";
					"<CR>" = "cmp.mapping.confirm({ select = true })";
					"<Tab>" = ''
						cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif require('luasnip').expand_or_jumpable() then
								require('luasnip').expand_or_jump()
							else
								fallback()
							end
						end, { "i", "s" })
					'';
					"<S-Tab>" = ''
						cmp.mapping(function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif require('luasnip').jumpable(-1) then
								require('luasnip').jump(-1)
							else
								fallback()
							end
						end, { "i", "s" })
					'';
				};
			};
		};
	};
}
