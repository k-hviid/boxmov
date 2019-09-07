
// Project: boxmov 
// Created: 2019-09-07

#include "includes/init.agc"
gosub _init
#include "includes/menu.agc"
gosub _menu
#include "includes/play.agc"
gosub _play
#include "includes/hero.agc"
gosub _hero
#include "includes/foes.agc"
gosub _foes




do
    

    Print( ScreenFPS() )
    Sync()
loop
