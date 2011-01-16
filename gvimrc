" -----------------------------------------------------------------------------  
" |                            VIM Settings                                   |
" |                              GUI stuff                                    |
" -----------------------------------------------------------------------------  

" Defaults ********************************************************************

" Default size of window
set columns=179 
set lines=50

set anti " Antialias font

"set transparency=0

" Tab headings 
set gtl=%t gtt=%F
set guioptions-=m  " get rid of menu
" set guioptions-=r  " get rid of scroll bars
set guioptions-=L

" OS Specific *****************************************************************

" MacVim ---------------------------------------------------------------------
if has("gui_macvim")

  set fuoptions=maxvert,maxhorz " fullscreen options (MacVim only), resized window when changed to fullscreen
  set guifont=Monaco:h12
  set guioptions-=T  " remove toolbar
"  set stal=2 " turn on tabs by default
  set columns=150 
"  set columns=125
  set lines=49 
  
" GVim Linux -----------------------------------------------------------------
elseif has("gui_gtk2")

  set guioptions-=T  " remove toolbar
  set columns=150
  set lines=49

" X11 ------------------------------------------------------------------------
elseif has("x11")



" GVim Windows ---------------------------------------------------------------
elseif has("gui_win32")

  set guifont=Consolas:h10
  set guioptions-=T
  set columns=160
  set lines=47
"  set stal=2

end


