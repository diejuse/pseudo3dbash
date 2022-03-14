#!/bin/bash
# ISObash 0.1 (2022). MIT License Copyright (c) 2022 Diego Jurado Seguí (diejuse). 
# https://github.com/diejuse/ISObash/blob/main/LICENSE
function init {
    clear;stty -echo -icanon time 0 min 0;printf "\e[40m";clear;printf "\e[0m";printf "\e[?25l";OX=0;OY=2
    PJy=2;PJx=2;PJmy=10;PJmx=10
    MAP9_10c="40;97";MAP9_10n="FACTORY"
    MAP9_10m=("┌▀▀▀▀▀┐" "▎00004▕" "▎00000▕" "▎00200▕" "▎00000╞" "▎00000▕" "└▁▁╥▁▁")
    MAP10_10c="47;90";MAP10_10n="ILLUMINATED STREET"
    MAP10_10m=("┌▀▀╨▀▀▀┐" "▏T0000T▕" "▏000000▕" "┤000000▕" "▏000000├" "▏T0000T▕" " ▁▁▁┬▁▁")
    MAP11_10c="47;90";MAP11_10n="BEACH"
    MAP11_10m=(" ▔▔▔┴▔▔▔▔ " "▏~~¨¨¨¨¨¨▕" "▏~~¨¨¨¨¨¨├" "▏~~¨¨¨¨¨¨▕" "▏~~~~~~~~▕" "▏~~~~~~~~▕" " ▁▁▁▁▁▁▁▁")
    MAP11_11c="47;90";MAP11_11n="EAST BEACH"
    MAP11_11m=(" ▔▔▔▔▔▔ " "▏¨¨¨¨~~▕" "┤¨¨¨¨~~▕" "▏¨¨¨¨~~▕" "▏~~~~~~▕" "▏~~~~~~▕" " ▁▁▁▁▁▁")
    MAP10_11c="47;90";MAP10_11n="EAST STREET"
    MAP10_11m=("        " "        " " ▔▔▔▔▔▔ " "▏TTT00T▕" "┤00000T▕" "▏00000T▕" " ▁▁▁▁▁▁")
    MAP10_9c="44;97";MAP10_9n="DARK ALLEY"
    MAP10_9m=("       " "┌▀▀▀▀▀┐" "▎43211▕" "▎31111├" "▎21111▕" "└▁▁▁▁▁ ")
    MAP9_11c="40;97";MAP9_11n="FACTORY WAREHOUSE"
    MAP9_11m=("┌▀▀▀▀▀▀▀┐" "▎3334320▕" "▎0002000▕" "▎0002000▕" "╡0002000▕" "▎0002200▕" "└▁▁▁▁▁▁▁")

}
function dibujaScene {
    local ma="MAP${PJmy}_${PJmx}c" man="MAP${PJmy}_${PJmx}n" temp map
    temp="MAP${PJmy}_${PJmx}m[@]";map=("${!temp}");LY=${#map[*]}
    printf "\e[${!ma}m";clear;printf "\e[31m\e[2;35HISObash 0.1 (2022)\e[94m\e[3;39Hby Diejuse\e[33m\e[25;3HKeys: move -> w a s d\e[26;9Hexit -> p\e[40;97m\e[2;5H ${!man} \e[${!ma}m";
    dibujaScene0
}
function dibujaScene0 {
    local temp map mac mapi0 mapi ch0="" ch i j
    temp="MAP${PJmy}_${PJmx}m";map=${!temp};temp="MAP${PJmy}_${PJmx}c";mac=${!temp}
    STREAM=""
    for((i=0;i<${#map};i++)){
        if((i>0));then temp="MAP${PJmy}_${PJmx}m[$((i-1))]";mapi0=${!temp};fi
        temp="MAP${PJmy}_${PJmx}m[$i]";mapi=${!temp}
        for ((j=0;j<${#mapi};j++)){
            if((i>0));then ch0=${mapi0:j:1};fi
            ch=${mapi:j:1};dibujaCas $((i+OY)) $((j+OX)) $ch $mac $ch0
            if((i==PJy && j==PJx));then dibujaPJ;fi
        }
    }
    printf "$STREAM"
}
function dibujaCas {
    local i=$1 j=$2 ch=$3 mac=$4 ch0=$5
    if [[ "$ch" == "¨" ]]; then
    STREAM+="\e[33m\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+4))H¨¨¨\e[$((i*1+10+1+j));$((j*4+(LY-i)*4+3))H¨ ¨¨\e[${mac}m"
    fi
    if [[ "$ch" == "~" ]]; then
    STREAM+="\e[34m\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+5))H~~.~\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+5))H~.·~\e[${mac}m"
    fi
    if [[ "$ch" == "1" ]]; then
    STREAM+="\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+5))H\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+2))H.·' '·.\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+2))H'·._.·'"
    fi
    if [[ "$ch" == "2" ]]; then
    STREAM+="\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+5))H\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+2))H.·' '·.\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H|'·._.·'|\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+2))H'·.|.·'"
    fi
    if [[ "$ch" == "3" ]]; then
    STREAM+="\e[$((i*1+10-4+j));$((j*4+(LY-i)*4+5))H\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+2))H.·' '·.\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+1))H|'·._.·'|\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H|   |   |\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+2))H'·.|.·'"
    fi
    if [[ "$ch" == "4" ]]; then
    STREAM+="\e[$((i*1+10-5+j));$((j*4+(LY-i)*4+5))H\e[$((i*1+10-4+j));$((j*4+(LY-i)*4+2))H.·' '·.\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+1))H|'·._.·'|\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+1))H|   |   |\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H|   |   |\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+2))H'·.|.·'"
    fi
    if [[ "$ch" == "T" ]]; then
    STREAM+="\e[32m\e[$((i*1+10-6+j));$((j*4+(LY-i)*4+3))H<<><>\e[$((i*1+10-5+j));$((j*4+(LY-i)*4+2))H<<<<>>>\e[$((i*1+10-4+j));$((j*4+(LY-i)*4+3))H<<><>\e[33m\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+4))H[|]\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+4))H[|]\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+4))H[|]\e[${mac}m"
    fi
    if [[ "$ch" == "┴" ]]; then
    STREAM+="\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H_.·'\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+2))H   _.·'"
    fi
    if [[ "$ch" == "╨" ]]; then
    STREAM+="\e[$((i*1+10-7+j));$((j*4+(LY-i)*4+2))H'·._\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+1))H|'·.\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+1))H|   |\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H|   |\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+2))H'·.|"
    fi
    if [[ "$ch" == "╥" ]]; then
    STREAM+="\e[$((i*1+10-4+j));$((j*4+(LY-i)*4+5))H|'·.\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+5))H|   |\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+5))H|   |\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+6))H'·.|"
    fi
    if [[ "$ch" == "┬" ]]; then
    STREAM+="\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+5))H_\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+2))H.·'    _\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+6))H.·'"
    fi
    if [[ "$ch" == "S" ]]; then
    STREAM+="\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+0))H|'·.\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+0))H|   |\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+0))H|   |\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+1))H'·.|"
    fi
    if [[ "$ch" == "E" ]]; then
    STREAM+="\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+5))H.·'|\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+4))H|   |\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+4))H|   |\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+4))H|.·'"
    fi
    if [[ "$ch" == "├" ]]; then
    STREAM+="\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H_    '·.\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+1))H '·."
    fi
    if [[ "$ch" == "╞" ]]; then
    STREAM+="\e[$((i*1+10-4+j));$((j*4+(LY-i)*4+2))H.·'|\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+1))H|   |\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+1))H|   |\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H|.·'"
    fi
    if [[ "$ch" == "┤" ]]; then
    STREAM+="\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+3))H_    '·.\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+3))H '·."
    fi
    if [[ "$ch" == "╡" ]]; then
    STREAM+="\e[$((i*1+10-7+j));$((j*4+(LY-i)*4+5))H_.·'\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+6))H.·'|\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+5))H|   |\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+5))H|   |\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+5))H|.·'"
    fi
    if [[ "$ch" == "▀" ]]; then
    STREAM+="\e[$((i*1+10-7+j));$((j*4+(LY-i)*4+2))H'·._\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+2))H'·._"
    fi
    if [[ "$ch" == "▔" ]]; then
    STREAM+="\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+2))H'·._"
    fi
    if [[ "$ch" == "▎" ]]; then
    STREAM+="\e[$((i*1+10-7+j));$((j*4+(LY-i)*4+5))H_.·'\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+5))H_.·'"
    fi
    if [[ "$ch" == "▏" ]]; then
    STREAM+="\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+5))H_.·'"
    fi
    if [[ "$ch" == "▁" && "$ch0" != "2" && "$ch0" != "3" && "$ch0" != "4" ]]; then
    STREAM+="\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+6))H'·._"
    fi
    if [[ "$ch" == "x" ]]; then
    STREAM+="\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+5))H'·._\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+5))H.·'"
    fi
    if [[ "$ch" == "┌" ]]; then
    STREAM+="\e[$((i*1+10-7+j));$((j*4+(LY-i)*4+5))H_\e[$((i*1+10-6+j));$((j*4+(LY-i)*4+5))H|\e[$((i*1+10-5+j));$((j*4+(LY-i)*4+5))H|\e[$((i*1+10-4+j));$((j*4+(LY-i)*4+5))H|\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+5))H|\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+5))H|\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+5))H|\e[$((i*1+10-0+j));$((j*4+(LY-i)*4+5))H|"
    fi
    if [[ "$ch" == "┐" ]]; then
    STREAM+="\e[$((i*1+10-7+j));$((j*4+(LY-i)*4+1))H|\e[$((i*1+10-6+j));$((j*4+(LY-i)*4+1))H|\e[$((i*1+10-5+j));$((j*4+(LY-i)*4+1))H|\e[$((i*1+10-4+j));$((j*4+(LY-i)*4+1))H|\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+1))H|\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+1))H|\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H|"
    fi
    if [[ "$ch" == "└" ]]; then
    STREAM+="\e[$((i*1+10-7+j));$((j*4+(LY-i)*4+9))H|\e[$((i*1+10-6+j));$((j*4+(LY-i)*4+9))H|\e[$((i*1+10-5+j));$((j*4+(LY-i)*4+9))H|\e[$((i*1+10-4+j));$((j*4+(LY-i)*4+9))H|\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+9))H|\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+9))H|\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+9))H|"
    fi
    if [[ "$ch" == "╝" ]]; then
    STREAM+="\e[$((i*1+10-1+j));$((j*4+(LY-i)*4-3))H'·._.·'"
    fi
    if [[ "$ch" == "▕" ]]; then
    STREAM+="\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+1))H_.·'"
    fi
}
function dibujaPJ {
    local i=$((PJy+OY)) j=$((PJx+OX)) temp="MAP${PJmy}_${PJmx}m" 
    local map=${!temp} 
    local mac="MAP${PJmy}_${PJmx}c"
    STREAM+="\e[94m\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+5))Ho\e[$((i*1+10-2+j));$((j*4+(LY-i)*4+4))H╱░╲\e[$((i*1+10-1+j));$((j*4+(LY-i)*4+4))H╱ ╲\e[${!mac}m"
}
function dibujaLimpiaPJ {
    local i=$1 j=$2 temp="MAP${PJmy}_${PJmx}m" 
    local map=${!temp} 
    printf "\e[$((i*1+10-3+j));$((j*4+(LY-i)*4+5))H \e[$((i*1+10-2+j));$((j*4+(LY-i)*4+4))H   \e[$((i*1+10-1+j));$((j*4+(LY-i)*4+4))H   "            
}
function queHay { 
    local y=$1 x=$2 i;local temp="MAP${PJmy}_${PJmx}m[${y}]";local temp0=${!temp} 
    local hay=${temp0:x:1};echo $hay
}
function puedoPasar { 
    local y=$1 x=$2 i ret=-1 check;local temp="MAP${PJmy}_${PJmx}m[$y]";local temp0=${!temp};local hay=${temp0:x:1}
    check=$(indexOf "( ▕ ▎ ▏ ▀ ▔ ▁ 2 3 4 T ~ )" $hay)
    if ((check==-1));then ret="1";fi
    echo $ret
}
function indexOf {
    local i lista=($1) check=$2 ret=-1
    for ((i=0;i<${#lista[*]};i++)) { if [[ "${lista[i]}" == "$2" ]];then ((ret=i-1));fi }
    echo $ret
}
function teclaPulsada {
    local temp k="" vy=0 vx=0 newY newX map newm puedo que salida
    map="MAP${PJmy}_${PJmx}m"    
    read -n1 k
    if [[ $k = w ]]; then vy=-1;elif [[ $k = s ]]; then vy=1;elif [[ $k = a ]]; then vx=-1;elif [[ $k = d ]]; then vx=1;elif [[ $k = p ]]; then fin;fi
    local y1 x1
    ((y1=PJy+vy));((x1=PJx+vx));puedo=$(puedoPasar $y1 $x1);que=$(queHay $y1 $x1)
    if [[ ((vy+vx!=0)) && "$puedo" != "-1" ]];then
        newm=0;dibujaLimpiaPJ $((PJy+OY)) $((PJx+OX));((PJy+=vy));((PJx+=vx))
        if [[ "$(indexOf "( ╨ ┴ )" $que)" != "-1" ]];then ((PJmy--));temp="MAP${PJmy}_${PJmx}m[@]";map=("${!temp}");PJy=$((${#map[*]}-2));newm=1;fi
        if [[ "$(indexOf "( ╥ ┬ )" $que)" != "-1" ]];then ((PJmy++));PJy=1;newm=1;fi
        if [[ "$(indexOf "( ╞ ├ )" $que)" != "-1" ]];then ((PJmx++));PJx=1;newm=1;fi
        if [[ "$(indexOf "( ╡ ┤ )" $que)" != "-1" ]];then ((PJmx--));temp="MAP${PJmy}_${PJmx}m[$PJy]";map="${!temp}";PJx=$((${#map}-2));newm=1;fi
        if ((newm==1)); then dibujaScene;else dibujaScene0;fi        
    fi
    teclaPulsada
}
function fin { printf "\e[40;37m\e[?25h";clear;printf "\e[1;1H\e[1;44;33mDiejuse appreciates you tried his demo game. See you soon!\n\n\e[40;37m";stty echo;exit; }   
init;dibujaScene;teclaPulsada
