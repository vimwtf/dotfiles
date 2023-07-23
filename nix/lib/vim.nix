{ pkgs, lib, ... }: {
  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      background = "dark";
      expandtab = true;
      number = true;
      shiftwidth = 2;
      tabstop = 2;
    };
    plugins = with pkgs.vimPlugins; [
      vim-trailing-whitespace
      nerdcommenter
      vim-go
      vim-sensible
    ];
    extraConfig = ''
			" Tmux integration to switch panes with Ctrl+{hkjl}
			if exists('$TMUX')
				function! TmuxOrSplitSwitch(wincmd, tmuxdir)
					let previous_winnr = winnr()
					silent! execute "wincmd " . a:wincmd
					if previous_winnr == winnr()
						call system("tmux select-pane -" . a:tmuxdir)
						redraw!
					endif
				endfunction

				let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', "", "")
				let &t_ti = "\<Esc>2;vim\<Esc>\\" . &t_ti
				let &t_te = "\<Esc>2;". previous_title . "\<Esc>\\" . &t_te

				nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
				nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
				nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
				nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
			else
				map <C-h> <C-w>h
				map <C-j> <C-w>j
				map <C-k> <C-w>k
				map <C-l> <C-w>l
			endif

			" coding preference
			filetype off
			filetype plugin indent on

			syntax on
			set backspace=indent,eol,start
			set noautoindent
			set noswapfile
			set ruler
			set showmatch
			set smarttab
			set sts=2
			let g:NERDSpaceDelims=1

			let mapleader=","
			if has("autocmd")
				autocmd FileType go set ts=2 sw=2 sts=2 noet nolist autowrite
			endif
		'';
	};
}
