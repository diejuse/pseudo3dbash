#!/bin/bash

# pseudo3dbash
# https://github.com/diejuse/pseudo3dbash
# A prototype of a pseudo 3d-engine made in Bash.
# MIT License https://github.com/diejuse/pseudo3dbash/blob/main/LICENSE

function rep { local i; for i in $(seq 1 1 $2);do printf "%s" "$1";done }
function caja {
    local y x txt="\e[0m\e[107m\e[34m"
    #\e[37m"
    txt+="\e[$((OY));$((OX))H$(rep █ $((OLX)) )"
    for ((y=OY+1;y<OY+OLY;y++));do txt+="\e[$((y));$((OX))H█$(rep ' ' $((OLX-2)) )█";done   
    txt+="\e[$((OY+OLY));$((OX))H$(rep █ $((OLX)) )"
    printf "$txt"
}

function dibuja_mur0_0d {
    local txt y
    if [[ "$1" == "1" ]];then txt=( "      .'" "    .'  " "  .'    " ".'      " ":       " ":       " ":       " 
    ":       " ":       " ":       " ":       " ":       " ":       " ":       " ":       " ":       " ":       "
    ":       " ":       " "'.      " "  '.    " "    '.  " "      '.")
    elif [[ "$1" == "2" ]];then txt=( "      .'" "    .'~~" "  .'~~~~" ".'~~~~~~" ":~~~~~~~" ":~~~~~~~" ":~~~~~~~"
    ":~~~~~~~" ":~~~~~~~" ":~~~~~~~" ":~~~~~~~" ":~~~~~~~" ":~~~~~~~" ":~~~~~~~" ":~~~~~~~" ":~~~~~~~" ":~~~~~~~"                 ":~~~~~~~" ":~~~~~~~" "'.~~~~~~" "  '.~~~~" "    '.~~" "      '.");
    elif [[ "$1" == "3" ]];then txt=( "      .'" "    .'  " "  .'    " ".'    .'" ":   .'  " ":   :   " ":   :   "
    ":   :   " ":   :   " ":   :   " ":   :   " ":   :   " ":   :   " ":   :   " ":   :   " ":   :   " ":   :   "
    ":   :   " ":   :   " "'.  :   " "  '.:   " "    '.  " "      '.");
    fi
    for ((y=0;y<${#txt[*]};y++));do printf "\e[$((OY+y+1));$((OX+OLX-1-${#txt[y]}))H${txt[y]}"; done
}
function dibuja_mur0_0i {
    local txt y
    if [[ "$1" == "1" ]];then txt=( "'." "  '." "    '." "      '." "       :" "       :" "       :" "       :"
    "       :" "       :" "       :" "       :" "       :" "       :" "       :" "       :" "       :" "       :"
    "       :" "      .'" "    .'" "  .'" ".'");
    elif [[ "$1" == "2" ]];then txt=( "'." "~~'." "~~~~'." "~~~~~~'." "~~~~~~~:" "~~~~~~~:" "~~~~~~~:" "~~~~~~~:"
    "~~~~~~~:" "~~~~~~~:" "~~~~~~~:" "~~~~~~~:" "~~~~~~~:" "~~~~~~~:" "~~~~~~~:" "~~~~~~~:" "~~~~~~~:" "~~~~~~~:"
    "~~~~~~~:" "~~~~~~.'" "~~~~.'" "~~.'" ".'");
    elif [[ "$1" == "3" ]];then txt=( "'." "  '." "    '." "'.    '." "  '.   :" "   :   :" "   :   :" "   :   :"
    "   :   :" "   :   :" "   :   :" "   :   :" "   :   :" "   :   :" "   :   :" "   :   :" "   :   :" "   :   :"
    "   :   :" "   :  .'" "   :.'" "  .'" ".'");
    fi
    for ((y=0;y<${#txt[*]};y++));do printf "\e[$((OY+y+1));$((OX+1))H${txt[y]}"; done
}
function dibuja_mur0_1d {
    local txt y
    if [[ "$1" == "1" ]];then txt=( "      ." "    .':" "  .'  :" ".'    :" ":     :" ":     :" ":     :" ":     :"
    ":     :" ":     :" ":     :" ":     :" ":     :" "'.    :" "  '.  :" "    '.:" "      '")
    elif [[ "$1" == "2" ]];then txt=( "      ." "    .':" "  .'~~:" ".'~~~~:" ":~~~~~:" ":~~~~~:" ":~~~~~:"           ":~~~~~:" ":~~~~~:" ":~~~~~:" ":~~~~~:" ":~~~~~:" ":~~~~~:" "'.~~~~:" "  '.~~:" "    '.:" "      '")
    elif [[ "$1" == "3" ]];then txt=( "      ." "    .':" "  .'  :" ".'   .:" ":  .'::" ":.'  ::" "::   ::"               "::   ::" "::   ::" "::   ::" "::   ::" "::   ::" "::   ::" "':   ::" "  '. ::" "    '::" "      '")
    elif [[ "$1" == "4" ]];then txt=( "     .'" "   .'  " " .'  .'" " : .:.'" " :'.:  " "'   :.'" "    :  " "'   :.'"
    "    :  " "    :'." "    :  " "    :'." " :.':  " " : ':'." " '.  '." "   '.  " "     '.");fi
    for ((y=0;y<${#txt[*]};y++));do printf "\e[$((OY+y+4));$((OX+OLX-15))H${txt[y]}"; done
}
function dibuja_mur0_1i {
    local txt y
    if [[ "$1" == "1" ]];then txt=( "." ":'." ":  '." ":    '." ":     :" ":     :" ":     :" ":     :" ":     :"
    ":     :" ":     :" ":     :" ":     :" ":    .'" ":  .'" ":.'" "'")
    elif [[ "$1" == "2" ]];then txt=( "." ":'." ":~~'." ":~~~~'." ":~~~~~:" ":~~~~~:" ":~~~~~:" ":~~~~~:" ":~~~~~:"
    ":~~~~~:" ":~~~~~:" ":~~~~~:" ":~~~~~:" ":~~~~.'" ":~~.'" ":.'" "'")
    elif [[ "$1" == "3" ]];then txt=( "." ":'." ":  '." ":.   '." "::'.  :" "::  '.:" "::   ::" "::   ::" "::   ::"
    "::   ::" "::   ::" "::   ::" "::   ::" "::   :'" ":: .'" "::'" "'");
    elif [[ "$1" == "4" ]];then txt=( "'.     " "  '.   " "'.  '. " "'.:. : " "  : ': " "'.:    " "  :    " 
    "'.:    " "  :    " ".':    " "  :    " ".':    " "  : .: " ".'.' : " ".'  .' " "  .'   " ".'     ");fi
    for ((y=0;y<${#txt[*]};y++));do printf "\e[$((OY+y+4));$((OX+8))H${txt[y]}"; done
}
function dibuja_mur0_0c {
    local txt y x i lx yy xx ch
    if [[ "$1" == "1" ]];then txt=( ".........................................."
    ":                                        :" ":                                        :"
    ":                                        :" ":                                        :"
    ":                                        :" ":                                        :"
    ":                                        :" ":                                        :"
    ":                                        :" ":                                        :"
    ":                                        :" ":                                        :"
    ":                                        :" ":                                        :"
    ":                                        :" "''''''''''''''''''''''''''''''''''''''''''")
    elif [[ "$1" == "2" ]];then txt=( ".........................................."
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" "''''''''''''''''''''''''''''''''''''''''''")
    elif [[ "$1" == "3" ]];then txt=( ".........................................."
    ":                                        :" ":                                        :"
    ":       ..........................       :" ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :"
    ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :" ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :"
    ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :" ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :"
    ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :" ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :"
    ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :" ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :"
    ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :" ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :"
    ":       :ªªªªªªªªªªªªªªªªªªªªªªªª:       :" "'''''''''ªªªªªªªªªªªªªªªªªªªªªªªª'''''''''")
    elif [[ "$1" == "4" ]];then if [[ "$2" == "0" ]]; then txt=("")
    elif [[ "$2" == "-1" ]];then txt=( "'.ªªªª" "  '." "    '." ".    :" ".'.  :" " '.'.:" "  :'.'" ". :" " ':"
    ". :" " ':" "  :" " .:" "' :" "  :" ".':" "  '.'." " .'.':" "'.'  :" "'    :" "    .'" "  .' " ".'");
    elif [[ "$2" == "+1" ]];then txt=( "ªªªª.'" "ªª.'  " ".'    " ":    ." ":  .'." ":.':' " "'.':  " "ªªª:.'"
    "ªªª:  " "ªªª: ." "ªªª:' " "ªªª:  " "ªªª:. " "ªªª: '" "ªªª:  " "ªªª:'." "ªª.'  " ":'.'. " ":  '.'" ":    '"  
    "'.    "  "ªª'.  " "ªªªª'.");fi;
    fi
    
    if [[ "$1" == "4" ]];then
        if [[ "$2" == "0" ]]; then :; 
        elif [[ "$2" == "-1" ]]; then ((y=OY+1));((x=OX+1));i=0;lx=${#txt[0]}; 
        elif [[ "$2" == "+1" ]]; then ((y=OY+1));((x=OX+OLX-7));i=0;lx=${#txt[0]};fi
    else
        if [[ "$2" == "0" ]]; then ((y=OY+4));((x=OX+8));i=0;lx=${#txt[0]}; 
        elif [[ "$2" == "-1" ]]; then ((y=OY+4));((x=OX+1));lx=8;((i=${#txt[$y]}-lx)); 
        elif [[ "$2" == "+1" ]]; then ((y=OY+4));((x=OX+8+${#txt[0]}-1));i=0;lx=8;fi
    fi
    
    
    if [[ "$1" == "3" || "$1" == "4" ]]; then 
            for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((y+yy));$((x))H$(printf "${txt[$yy]:i:lx}" | sed "s/ª/\\\e[1C/g")";done;
    else for ((yy=0;yy<${#txt[*]};yy++));do ch=${txt[$yy]:i:lx};printf "\e[$((y+yy));$((x))H$ch";done;fi
}
function dibuja_mur0_1c {
    local txt y x i lx yy xx ch
    if [[ "$1" == "1" ]];then txt=( ".............................." ":                            :" ":                            :" ":                            :" ":                            :" ":                            :"
    ":                            :" ":                            :" ":                            :" ":                            :" "''''''''''''''''''''''''''''''");
    elif [[ "$1" == "2" ]];then txt=( ".............................." ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~~~~~~~~~:" "''''''''''''''''''''''''''''''");
    elif [[ "$1" == "3" ]];then txt=( ".............................." ":                            :"
    ":     ..................     :" ":     :ªªªªªªªªªªªªªªªª:     :" ":     :ªªªªªªªªªªªªªªªª:     :"
    ":     :ªªªªªªªªªªªªªªªª:     :" ":     :ªªªªªªªªªªªªªªªª:     :" ":     :ªªªªªªªªªªªªªªªª:     :"
    ":     :ªªªªªªªªªªªªªªªª:     :" ":     :ªªªªªªªªªªªªªªªª:     :" "'''''''ªªªªªªªªªªªªªªªª'''''''");
    elif [[ "$1" == "4" ]];then txt=( ".........................." ":                        :"
    ":                        :" "'.''''''''''''''''''''''.'" "ªª'...:'''''''''''':...'"
    "ªªªªªª:            :" "ªªªªªª:'''''''''''':" "ªªªªªª:............:" "ªªªªªª:            :"
    "ªªªªªª:'''''''''''':" "ªªªªªª:............:" "ªªªªªª:            :" "ªª.''':............:'''. "
    ".'......................'." ":                        :" ":                        :"
    "''''''''''''''''''''''''''");fi
    if [[ "$1" == "4" ]];then
        if [[ "$2" == "0" ]]; then ((x=OX+16));((y=OY+4));i=0;((lx=${#txt[0]}));fi
        if [[ "$2" == "+1" ]]; then ((lx=5));((x=OX+OLX-lx-1));((y=OY+4));i=0;fi
        if [[ "$2" == "-1" ]]; then ((x=OX+1));((y=OY+4));lx=5;((i=${#txt[0]}-lx));fi
    else 
        if [[ "$2" == "-1" ]]; then ((y=OY+7));((x=OX+1));((i=${#txt[0]}-14));lx=14
        elif [[ "$2" == "0" ]]; then ((y=OY+7));((x=OX+14));i=0;lx=${#txt[0]};
        elif [[ "$2" == "+1" ]]; then ((y=OY+7));((x=OX+14+${#txt[0]}-1));i=0;((lx=OLX-x+1));fi
    fi
    if [[ "$1" == "3" || "$1" == "4" ]]; then 
            for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((y+yy));$((x))H$(printf "${txt[$yy]:i:lx}" | sed "s/ª/\\\e[1C/g")";done;
    else for ((yy=0;yy<${#txt[*]};yy++));do ch=${txt[$yy]:i:lx};printf "\e[$((y+yy));$((x))H$ch";done;fi
}
function dibuja_mur0_2c {
    local txt y x i lx yy xx ch
    if [[ "$1" == "1" ]];then txt=( "......................" ":                    :" ":                    :"
    ":                    :" ":                    :" ":                    :" "''''''''''''''''''''''" )
    elif [[ "$1" == "2" ]];then txt=( "......................" ":~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~:"
    ":~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~~~~~:" "''''''''''''''''''''''" )
    elif [[ "$1" == "3" ]];then txt=( "......................" ":    ............    :" ":    :ªªªªªªªªªª:    :"
    ":    :ªªªªªªªªªª:    :" ":    :ªªªªªªªªªª:    :" ":    :ªªªªªªªªªª:    :" "''''''ªªªªªªªªªª''''''" )
    elif [[ "$1" == "4" ]];then txt=( ".................." ":                :" "'................'" "ªª'.:........:.'" "ªªªª:........:" "ªªªª:        :" "ªªªª:'''''''':" "ªª.':'''''''':'." ".''''''''''''''''."
    ":                :" "''''''''''''''''''");fi
    if [[ "$1" == "4" ]]; then 
        if [[ "$2" == "0" ]]; then ((y=OY+7));((x=OX+20));((i=0));lx=${#txt[0]};
        elif [[ "$2" == "-1" ]]; then ((y=OY+7));((x=OX+1));lx=$((${#txt[0]}-8));((i=${#txt[0]}-lx)); 
        elif [[ "$2" == "+1" ]]; then ((y=OY+7));((x=OX+29+${#txt[0]}));i=0;lx=$((${#txt[0]}-8));fi
    else    
        if [[ "$2" == "0" ]]; then ((y=OY+9));((x=OX+18));((i=0));lx=${#txt[0]};
        elif [[ "$2" == "-1" ]]; then ((y=OY+9));((x=OX+1));i=4;lx=$((${#txt[0]}-4)); 
        elif [[ "$2" == "+1" ]]; then ((y=OY+9));((x=OX+18+${#txt[0]}-1));i=0;lx=$((${#txt[0]}-4));fi
        #elif [[ "$2" == "-2" ]]; then ((y=OY+11));((x=OX+1));((i=${#txt[y]}-5));lx=5; 
        #elif [[ "$2" == "+2" ]]; then ((y=OY+11));((x=OX+22+${#txt[0]}*2-6));i=0;lx=5;fi
    fi
    if [[ "$1" == "3" || "$1" == "4" ]]; then 
            for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((y+yy));$((x))H$(printf "${txt[$yy]:i:lx}" | sed "s/ª/\\\e[1C/g")";done;
    else for ((yy=0;yy<${#txt[*]};yy++));do ch=${txt[$yy]:i:lx};printf "\e[$((y+yy));$((x))H$ch";done;fi
}
function dibuja_mur0_3c {
    local txt y x i lx yy xx ch
    if [[ "$1" == "1" ]];then txt=( ".................." ":                :" ":                :" ":                :" "''''''''''''''''''" )
    elif [[ "$1" == "2" ]];then txt=( ".................." ":~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~:" ":~~~~~~~~~~~~~~~~:" "''''''''''''''''''" )
    elif [[ "$1" == "3" ]];then txt=( ".................." ":    ........    :" ":    :ªªªªªª:    :"
    ":    :ªªªªªª:    :" "''''''ªªªªªª''''''" )
    elif [[ "$1" == "4" ]];then txt=( ":'''''''''':" "ª'::::::::'" "ªªª:....:" "ª.::::::::." ":..........:")
    fi 
    if [[ "$1" == "4" ]]; then 
        if [[ "$2" == "0" ]]; then ((y=OY+10));((x=OX+23));((i=0));lx=${#txt[0]};
        elif [[ "$2" == "-1" ]]; then ((y=OY+10));((x=OX+15-${#txt[0]}));i=0;lx=${#txt[0]}; 
        elif [[ "$2" == "+1" ]]; then ((y=OY+10));((x=OX+31+${#txt[0]}));i=0;lx=${#txt[0]};fi
    else
        if [[ "$2" == "0" ]]; then ((y=OY+10));((x=OX+20));((i=0));lx=${#txt[0]};
        elif [[ "$2" == "-1" ]]; then ((y=OY+10));((x=OX+20-${#txt[0]}+1));i=0;lx=${#txt[0]}; 
        elif [[ "$2" == "+1" ]]; then ((y=OY+10));((x=OX+20+${#txt[0]}-1));i=0;lx=${#txt[0]};
        elif [[ "$2" == "-2" ]]; then ((y=OY+10));((x=OX+1));((i=${#txt[y]}-3));lx=3; 
        elif [[ "$2" == "+2" ]]; then ((y=OY+10));((x=OX+20+${#txt[0]}*2-2));i=0;lx=3;fi
    fi
    if [[ "$1" == "3" || "$1" == "4" ]]; then 
            for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((y+yy));$((x))H$(printf "${txt[$yy]:i:lx}" | sed "s/ª/\\\e[1C/g")";done;
    else for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((y+yy));$((x))H$(printf "${txt[$yy]:i:lx}")";done;fi
}
function dibuja_mur0_4c {
    local txt=( "............" "ª'::::::::'" "ªªª:....:" " .::::::::." "''''''''''''") y x yy lx i 
    if [[ "$1" == "4" ]]; then 
        if [[ "$2" == "0" ]]; then ((y=OY+10));((x=OX+23));((i=0));lx=${#txt[0]};
        elif [[ "$2" == "-1" ]]; then ((y=OY+10));((x=OX+23-${#txt[0]}-5));i=0;lx=${#txt[0]}; 
        elif [[ "$2" == "+1" ]]; then ((y=OY+10));((x=OX+23+${#txt[0]}+5));i=0;lx=${#txt[0]};
        elif [[ "$2" == "-2" ]]; then ((y=OY+10));((x=OX+1));((i=${#txt[y]}-1));lx=1; 
        elif [[ "$2" == "+2" ]]; then ((y=OY+10));((x=OX+OLX-2));i=0;lx=1;fi
        for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((y+yy));$((x))H$(printf "${txt[$yy]:i:lx}" | sed "s/ª/\\\e[1C/g")";done;
    fi
}
function dibuja_mur0_2d {
    local txt y
    if [[ "$1" == "1" ]];then txt=( "    ." "  .':" ".'  :" ":   :" ":   :" ":   :" ":   :" ":   :" "'.  :" "  '.:"
    "    '")
    elif [[ "$1" == "2" ]];then txt=( "    ." "  .':" ".'~~:" ":~~~:" ":~~~:" ":~~~:" ":~~~:" ":~~~:" "'.~~:" "  '.:"
    "    '");
    elif [[ "$1" == "3" ]];then txt=( "    ." "  .' " ".' .:" ":.'::" ":: ::" ":: ::" ":: ::" ":: ::" "': ::"            "  '::" "    '"); 
    elif [[ "$1" == "4" ]];then txt=( "    ." "  .'." " :.:." "   :." "   :'" "   : " "   :." " . :'" " :':."            "  '.'" "    '")
    fi
    for ((y=0;y<${#txt[*]};y++));do 
        if [[ "$2" == "0" ]]; then printf "\e[$((OY+y+7));$((OX+39))H${txt[y]}";fi
        if [[ "$2" == "+1" ]]; then printf "\e[$((OY+y+7));$((OX+OLX-1-${#txt[y]}))H${txt[y]}";fi
    done
}
function dibuja_mur0_2i {
    local txt y
    if [[ "$1" == "1" ]];then txt=( "." ":'." ":  '." ":   :" ":   :" ":   :" ":   :" ":   :" ":  .'" ":.'" "'")
    elif [[ "$1" == "2" ]];then txt=( "." ":'." ":~~'." ":~~~:" ":~~~:" ":~~~:" ":~~~:" ":~~~:" ":~~.'" ":.'" "'");
    elif [[ "$1" == "3" ]];then txt=( "." ":'." ":. '." "::'.:" ":: ::" ":: ::" ":: ::" ":: ::" ":: :'" "::'" "'");
    elif [[ "$1" == "4" ]];then txt=( ".    " ".'.  " ".:.: " "':   " ".:   " "':   " ".:   " "':   " "':': " "'.'  "
    "'    ");fi
    for ((y=0;y<${#txt[*]};y++));do 
        if [[ "$2" == "0" ]]; then printf "\e[$((OY+y+7));$((OX+14))H${txt[y]}";fi
        if [[ "$2" == "-1" ]]; then printf "\e[$((OY+y+7));$((OX+1))H${txt[y]}";fi
    done
}
function dibuja_mur0_3i {
    local txt y
    if [[ "$1" == "1" ]];then txt=( "." ":'." ": :" ": :" ": :" ":.'" "'")
    elif [[ "$1" == "2" ]];then txt=( "." ":'." ":~:" ":~:" ":~:" ":.'" "'");
    elif [[ "$1" == "3" ]];then txt=( "." ":'." ":':" ": :" ": :" ": '" "'");
    elif [[ "$1" == "4" ]];then txt=( "." "::." ":: " ":: " ":: " "::'" "'");fi
    for ((y=0;y<${#txt[*]};y++));do 
        if [[ "$2" == "0" ]]; then printf "\e[$((OY+y+9));$((OX+18))H${txt[y]}";fi
        if [[ "$2" == "-1" ]];then printf "\e[$((OY+y+9));$((OX+1))H${txt[y]}";fi
    done
}
function dibuja_mur0_3d {
    local txt y
    if [[ "$1" == "1" ]];then txt=( "  ." ".':" ": :" ": :" ": :" "'.:" "  '")
    elif [[ "$1" == "2" ]];then txt=( "  ." ".':" ":~:" ":~:" ":~:" "'.:" "  '");
    elif [[ "$1" == "3" ]];then txt=( "  ." ".':" ":':" ": :" ": :" "'.:" "  '");
    elif [[ "$1" == "4" ]];then txt=( "." "::." ":: " ":: " ":: " "::'" "'");fi
    for ((y=0;y<${#txt[*]};y++));do 
        if [[ "$2" == "0" ]]; then printf "\e[$((OY+y+9));$((OX+OLX-21))H${txt[y]}";fi
        if [[ "$2" == "+1" ]];then printf "\e[$((OY+y+9));$((OX+OLX-4))H${txt[y]}";fi
    done
}
function dibuja_mur0_4i {
    local txt=( "." ":'." ": :" ":.'" "'") y
    for ((y=0;y<${#txt[*]};y++));do 
        if [[ "$2" == "0" ]]; then printf "\e[$((OY+y+10));$((OX+20))H${txt[y]}"; 
        elif [[ "$2" == "-1" ]]; then printf "\e[$((OY+y+10));$((OX+3))H${txt[y]}";fi
    done
}
function dibuja_mur0_4d {
    local txt=( "  ." ".'." ": :" "'.:" "  '") y
    for ((y=0;y<${#txt[*]};y++));do 
        if [[ "$2" == "0" ]]; then printf "\e[$((OY+y+10));$((OX+OLX-23))H${txt[y]}"; 
        elif [[ "$2" == "+1" ]]; then printf "\e[$((OY+y+10));$((OX+OLX-6))H${txt[y]}";fi
    done
}
function dibuja_suelo_0c {
    local txt yy xx=0
    if [[ "$1" == "1" ]];then txt=( "\`    \`      \`       \`      \`   \` \`   \`" "                                         \`" "\`    \`       \`           \`     \`    \`       \`" "                                          \`" "\`      \`       \`              \`             \`       \`")
    elif [[ "$1" == "2" ]];then txt=(   "+       +        +       +       +       +" "+                                            +" "+        +         +           +        +        +" "+                                                    +"
    "+         +          +               +          +        +");fi
}
function dibuja_suelo_0d {
    local txt yy xx=0
    if [[ "$1" == "1" ]];then txt=( "\`    \`   \`" "\`    \`   \`" "\`    \`" "\`    \`" "\`  ")
    elif [[ "$1" == "2" ]];then txt=( "+    +   +" "+    +   +" "+    +" "+    +" "+  ");fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-5+yy));$((OX+OLX-13+xx))H${txt[yy]}";((xx+=2));done
}
function dibuja_suelo_0i {
    local txt yy xx=0
    if [[ "$1" == "1" ]];then txt=( "  \`   \`    \`" "\`   \`    \`" "  \`    \`" "\`    \`" "   \`")
    elif [[ "$1" == "2" ]];then txt=(   "  +   +    +" "+   +    +" "  +    +" "+    +" "   +");fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-5+yy));$((OX+1+xx))H${txt[yy]}";((xx+=0));done
}
function dibuja_suelo_1d {
    local txt yy xx=0
    if [[ "$1" == "1" ]];then txt=( "\`    \`   \`   \`   \`" "\`    \`   \`   \`  " "\`    \`   \`   \`" "\`    \`   \`  ")
    elif [[ "$1" == "2" ]];then txt=( "+    +   +   +   +" "+    +   +   +" "+    +   +   +" "+    +   +");fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-8+yy));$((OX+OLX-19+xx))H${txt[yy]}";((xx+=2));done
}
function dibuja_suelo_1i {
    local txt yy xx=0
    if [[ "$1" == "1" ]];then txt=( "      \`   \`  \`  \`" "  \`   \`   \`   \`" "\`   \`   \`   \`" "\`     \`   \`")
    elif [[ "$1" == "2" ]];then txt=(   " +   +  +    +  " "  +   +    +   " "+   +    +   " "+      +   ");fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-8+yy));$((OX+1+xx))H${txt[yy]}";((xx+=0));done
}
function dibuja_suelo_1c {
    local txt yy xx=0
    if [[ "$1" == "1" ]];then txt=(   "\`      \`              \`      \`" "\`             \`    \`             \`"
    "\`        \`                  \`        \`" "\`               \`        \`               \`")
    elif [[ "$1" == "2" ]];then txt=(   "+    +    +    +    +     +  +" "+    +    +    +    +     +      +"
    "+    +    +    +    +     +   +      +" "+    +    +    +    +     +   +          +");fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-8+yy));$((OX+18-xx))H${txt[yy]}";((xx+=2));done
}
function dibuja_suelo_2c {
    local txt yy xx=0
    if [[ "$1" == "1" ]];then txt=(   "\`        \`" "     \`            \`" "  \`            \`")
    elif [[ "$1" == "2" ]];then txt=(   "+        +" "     +            +" "  +            +");fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-10+yy));$((OX+23-xx))H${txt[yy]}";((xx+=2));done
}
function dibuja_PJ_1c {
    local txt yy xx lx i=0
    if [[ "$1" == "fren" ]];then txt=( "   (O O)   " "    (W)" "╱╱|     |╲╲" "|||     |||" " w|     |w" "   MMMMM"
    "   H   H" "   H   H" "  nU   Un")
    elif [[ "$1" == "det" ]];then txt=( "   (   )   " "    ( )" "╱╱|     |╲╲" "|||     |||" " w|     |w" "   MMMMM"
    "   H   H" "   H   H" "  nU   Un")
    elif [[ "$1" == "latD" ]];then txt=( " ( º)" " ( )" "||| |" "||| |" "| ╲╲|" " MMM" " HH" " HH" " UUnn")
    elif [[ "$1" == "latI" ]];then txt=( "(º )" " ( )" "| |||" "| |||" "| ╱╱|" " MMM" "  HH" "  HH" "nnUU");fi
    if [[ "$2" == "0" ]];then xx=$((OX+OLX/2-${#txt[*]}/2));i=0;lx=${#txt[0]};
    elif [[ "$2" == "-1" ]];then xx=$((OX+1));lx=${#txt[*]}-3;((i=${#txt[0]}-lx))
    elif [[ "$2" == "+1" ]];then xx=$((OX+OLX-7));i=0;((lx=OX+OLX-xx-1));fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-8-${#txt[*]}+2+yy));${xx}H${txt[yy]:i:lx}";done
}
function dibuja_PJ_2c {
    local txt yy xx
    if [[ "$1" == "fren" ]];then txt=( "  (o o)  " "   (w)" "╱╱|   |╲╲" "w |   | w" "   MMM" "   H H" "  nU Un")
    elif [[ "$1" == "det" ]];then txt=( "  (   )  " "   ( )" "╱╱|   |╲╲" "w |   | w" "   MMM" "   H H" "  nU Un")
    elif [[ "$1" == "latD" ]];then txt=( " (º)" " ()" "||||" "|╲╲|" " MM" " H" " Un")
    elif [[ "$1" == "latI" ]];then txt=( "(º)" " ()" "||||" "|╱╱|" " MM" "  H" " nU");fi
    if [[ "$2" == "0" ]];then xx=$((OX+OLX/2-${#txt[*]}/2));
    elif [[ "$2" == "-1" ]];then xx=$((OX+3));
    elif [[ "$2" == "+1" ]];then xx=$((OX+OLX-12));fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-11-${#txt[*]}+3+yy));${xx}H${txt[yy]}";done
}
function dibuja_PJ_3c {
    local txt yy xx
    if [[ "$1" == "fren" ]];then txt=( " (\")" "╱|'|╲" "  M" " n n ")
    elif [[ "$1" == "det" ]];then txt=( " ( )" "╱|'|╲" "  M" " n n ")
    elif [[ "$1" == "latD" ]];then txt=( "(')" "|╲" "M" "Hn")
    elif [[ "$1" == "latI" ]];then txt=( "(')" "╱|" " M" "nH");fi
    if [[ "$2" == "0" ]];then xx=$((OX+OLX/2-${#txt[*]}/2));
    elif [[ "$2" == "-1" ]];then xx=$((OX+8));
    elif [[ "$2" == "+1" ]];then xx=$((OX+OLX-12));fi
    for ((yy=0;yy<${#txt[*]};yy++));do printf "\e[$((OY+OLY-13-${#txt[*]}+3+yy));${xx}H${txt[yy]}";done
}
function fov {
    CASILLASVISIBLES=()
    local y x lej=4 rango
    if ((DIR==0)); then for ((y=Y-lej;y<=Y;y++)){ # mirando al norte
        if ((y<=Y-3));then rango=2; elif ((y<=Y-2));then rango=1; else rango=1;fi
        for ((x=rango;x>=1;x--));do 
            if ((X+x>=0 && y>=0)); then CASILLASVISIBLES+=("$((y))_$((X+x))");fi
            if ((X-x>=0 && y>=0)); then CASILLASVISIBLES+=("$((y))_$((X-x))");fi
        done
        if ((y>=0)); then CASILLASVISIBLES+=("$((y))_$((X))");fi
    }
    elif ((DIR==1)); then for ((x=X+lej;x>=X;x--)){ # mirando al este
        if ((x>=X+3));then rango=2; elif ((x>=X+2));then rango=1; else rango=1;fi
        for ((y=rango;y>=1;y--));do 
            if ((Y+y>=0 && x>=0)); then CASILLASVISIBLES+=("$((Y+y))_$((x))");fi
            if ((Y-y>=0 && x>=0)); then CASILLASVISIBLES+=("$((Y-y))_$((x))");fi
        done
        if ((x>=0)); then CASILLASVISIBLES+=("$((Y))_$((x))");fi
    }
    elif ((DIR==2)); then for ((y=Y+lej;y>=Y;y--)){ # mirando al sur
        if ((y>=Y+3));then rango=2; elif ((y>=Y+2)); then rango=1; else rango=1;fi
        for ((x=rango;x>=1;x--));do 
            if ((X+x>=0 && y>=0)); then CASILLASVISIBLES+=("$((y))_$((X+x))");fi
            if ((X-x>=0 && y>=0)); then CASILLASVISIBLES+=("$((y))_$((X-x))");fi
        done
        if ((y>=0)); then CASILLASVISIBLES+=("$((y))_$((X))");fi
    }
    elif ((DIR==3)); then for ((x=X-lej;x<=X;x++)){ # mirando al oeste 
        if ((x<=X+3));then rango=2; elif ((x<=X+2));then rango=1; else rango=1;fi
        for ((y=rango;y>=1;y--));do 
            if ((Y+y>=0 && x>=0)); then CASILLASVISIBLES+=("$((Y+y))_$((x))");fi
            if ((Y-y>=0 && x>=0)); then CASILLASVISIBLES+=("$((Y-y))_$((x))");fi
        done
        if ((x>=0)); then CASILLASVISIBLES+=("$((Y))_$((x))");fi
    }
    fi
}
function dibuja {
    fov
    printf "\e[30m\e[1;1H"
    local ordenpinta ordenpintaT t i j n y x dir dirm cas vcas casyx vy vx vdir txt
    for ((i=0;i<${#CASILLASVISIBLES[*]};i++));do
        cas="MAPA${CASILLASVISIBLES[$i]}";vcas=${!cas};readarray -d _ -t casyx <<< ${CASILLASVISIBLES[$i]}
        t=${vcas:4:1}
        if ((DIR==0));then
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==0 ));then dibuja_suelo_0c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==0 ));then dibuja_suelo_1c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==0 ));then dibuja_suelo_2c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==-1 ));then dibuja_suelo_0d $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==-1 ));then dibuja_suelo_1d $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==1 ));then dibuja_suelo_0i $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==1 ));then dibuja_suelo_1i $t;fi
        elif ((DIR==2));then
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==0 ));then dibuja_suelo_0c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==0 ));then dibuja_suelo_1c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==0 ));then dibuja_suelo_2c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==1 ));then dibuja_suelo_0d $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==1 ));then dibuja_suelo_1d $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==-1 ));then dibuja_suelo_0i $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==-1 ));then dibuja_suelo_1i $t;fi
        elif ((DIR==1));then
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==0 ));then dibuja_suelo_0c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==-1 ));then dibuja_suelo_1c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==-2 ));then dibuja_suelo_2c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==0 ));then dibuja_suelo_0d $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==-1 ));then dibuja_suelo_1d $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==0 ));then dibuja_suelo_0i $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==-1 ));then dibuja_suelo_1i $t;fi
        elif ((DIR==3));then
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==0 ));then dibuja_suelo_0c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==1 ));then dibuja_suelo_1c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==2 ));then dibuja_suelo_2c $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==0 ));then dibuja_suelo_0d $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==1 ));then dibuja_suelo_1d $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==0 ));then dibuja_suelo_0i $t;fi
            if [[ "$t" != "0" ]] && [[ "$t" != "" ]] && (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==1 ));then dibuja_suelo_1i $t;fi
        fi
    done
    if ((DIR==0));then ordenpinta="401352"; elif ((DIR==1));then ordenpinta="1024953"; elif ((DIR==2));then ordenpinta="421350"; elif ((DIR==3));then ordenpinta="320451";fi
    for ((i=0;i<${#CASILLASVISIBLES[*]};i++));do
        cas="MAPA${CASILLASVISIBLES[$i]}";vcas=${!cas};readarray -d _ -t casyx <<< ${CASILLASVISIBLES[$i]}
        for ((n=0;n<${#ordenpinta};n++));do ordenpintaT=${ordenpinta:$n:1};t=${vcas:ordenpintaT:1}
           # MOMENTO DE PINTAR COSAS DEL CENTRO
           if [[ "$ordenpintaT" == "5" ]];then
               for ((j=1;j<=PJnum;j++));do
                    y="PJ${j}_y";x="PJ${j}_x";dir="PJ${j}_dir";y=${!y};x=${!x};dir=${!dir}
                    if ((y==${casyx[0]} && x==${casyx[1]}));then
                        if ((DIR==0 || DIR==2));then
                            if ((DIR==0));then vdir=1;else vdir=-1;fi
                            if ((DIR==0));then
                                if ((dir==2));then dirm="fren";elif ((dir==1));then dirm="latD";elif ((dir==3));then dirm="latI"; else dirm="det";fi
                            else 
                                if ((dir==0));then dirm="fren";elif ((dir==3));then dirm="latD";elif ((dir==1));then dirm="latI"; else dirm="det";fi
                            fi
                            if ((Y-y==1*vdir && X-x==0 ));then dibuja_PJ_1c $dirm 0;
                            elif ((Y-y==1*vdir && X-x==-1*vdir ));then dibuja_PJ_1c $dirm +1;
                            elif ((Y-y==1*vdir && X-x==1*vdir ));then dibuja_PJ_1c $dirm -1;
                            elif ((Y-y==2*vdir && X-x==0*vdir ));then dibuja_PJ_2c $dirm 0;
                            elif ((Y-y==2*vdir && X-x==1*vdir ));then dibuja_PJ_2c $dirm -1;
                            elif ((Y-y==2*vdir && X-x==-1*vdir ));then dibuja_PJ_2c $dirm +1;
                            elif ((Y-y==3*vdir && X-x==0*vdir ));then dibuja_PJ_3c $dirm 0;
                            elif ((Y-y==3*vdir && X-x==1*vdir ));then dibuja_PJ_3c $dirm -1;
                            elif ((Y-y==3*vdir && X-x==-1*vdir ));then dibuja_PJ_3c $dirm +1;fi
                        elif ((DIR==1 || DIR==3));then
                            if ((DIR==1));then vdir=1;else vdir=-1;fi
                            if ((DIR==1));then
                                if ((dir==3));then dirm="fren";elif ((dir==2));then dirm="latD";elif ((dir==0));then dirm="latI"; elif ((dir==1));then dirm="det";fi
                            else 
                                if ((dir==1));then dirm="fren";elif ((dir==0));then dirm="latD";elif ((dir==2));then dirm="latI"; elif ((dir==3));then dirm="det";fi
                            fi
                            if ((Y-y==0*vdir && X-x==-1*vdir ));then dibuja_PJ_1c $dirm 0;
                            elif ((Y-y==-1*vdir && X-x==-1*vdir ));then dibuja_PJ_1c $dirm +1;
                            elif ((Y-y==1*vdir && X-x==-1*vdir ));then dibuja_PJ_1c $dirm -1;
                            elif ((Y-y==0*vdir && X-x==-2*vdir ));then dibuja_PJ_2c $dirm 0;
                            elif ((Y-y==1*vdir && X-x==-2*vdir ));then dibuja_PJ_2c $dirm -1;
                            elif ((Y-y==-1*vdir && X-x==-2*vdir ));then dibuja_PJ_2c $dirm +1;
                            elif ((Y-y==0*vdir && X-x==-3*vdir ));then dibuja_PJ_3c $dirm 0;
                            elif ((Y-y==1*vdir && X-x==-3*vdir ));then dibuja_PJ_3c $dirm -1;
                            elif ((Y-y==-1*vdir && X-x==-3*vdir ));then dibuja_PJ_3c $dirm +1;fi
                        fi
                    fi
                done 
           fi
           ## MIRANDO AL NORTE
           if ((DIR==0));then
                # MUROS ESTE Y OESTE
                if [[ "$ordenpintaT" == "1" || "$ordenpintaT" == "3" ]] && [[ "$t" != "0" ]] && [[ "$t" != "" ]]; then 
                    if [[ "$ordenpintaT" == "3" ]]; then vx=0; else vx=1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_0i $t;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_1i $t;fi
                    if (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_2i $t 0;fi
                    if (( (Y-${casyx[0]})==3 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_3i $t 0;fi
                    if (( (Y-${casyx[0]})==3 && (X-${casyx[1]})==$((1+vx)) )); then dibuja_mur0_3i $t -1;fi
                    if (( (Y-${casyx[0]})==4 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_4i $t 0;fi
                    if (( (Y-${casyx[0]})==4 && (X-${casyx[1]})==$((1+vx)) ));then dibuja_mur0_4i $t -1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_0d $t;fi 
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_1d $t;fi 
                    if (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_2d $t 0;fi
                    if (( (Y-${casyx[0]})==3 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_3d $t 0;fi 
                    if (( (Y-${casyx[0]})==3 && (X-${casyx[1]})==$((-2+vx)) ));then dibuja_mur0_3d $t +1;fi
                    if (( (Y-${casyx[0]})==4 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_4d $t 0;fi
                    if (( (Y-${casyx[0]})==4 && (X-${casyx[1]})==$((-2+vx)) ));then dibuja_mur0_4d $t +1;fi
                fi
                # MUROS NORTE Y SUR
                if [[ "$ordenpintaT" == "0" || "$ordenpintaT" == "2" || "$ordenpintaT" == "5" ]] && [[ "$t" != "0" ]] && [[ "$t" != "" ]]; then 
                    if [[ "$ordenpintaT" == "0" ||  "$ordenpintaT" == "5" ]]; then vy=0; else vy=1;fi
                    if (( (Y-${casyx[0]})==$((0+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_0c $t 0;fi
                    if (( (Y-${casyx[0]})==$((0+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_0c $t -1;fi
                    if (( (Y-${casyx[0]})==$((0+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_0c $t +1;fi
                    if (( (Y-${casyx[0]})==$((1+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_1c $t 0;fi
                    if (( (Y-${casyx[0]})==$((1+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_1c $t +1;fi
                    if (( (Y-${casyx[0]})==$((1+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_1c $t -1;fi
                    if (( (Y-${casyx[0]})==$((2+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_2c $t 0;fi
                    if (( (Y-${casyx[0]})==$((2+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_2c $t -1;fi
                    if (( (Y-${casyx[0]})==$((2+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_2c $t +1;fi
                    if (( (Y-${casyx[0]})==$((2+vy)) && (X-${casyx[1]})==2 ));then dibuja_mur0_2c $t -2;fi
                    if (( (Y-${casyx[0]})==$((2+vy)) && (X-${casyx[1]})==-2 ));then dibuja_mur0_2c $t +2;fi
                    if (( (Y-${casyx[0]})==$((3+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_3c $t 0;fi
                    if (( (Y-${casyx[0]})==$((3+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_3c $t -1;fi
                    if (( (Y-${casyx[0]})==$((3+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_3c $t +1;fi
                    if (( (Y-${casyx[0]})==$((3+vy)) && (X-${casyx[1]})==2 ));then dibuja_mur0_3c $t -2;fi
                    if (( (Y-${casyx[0]})==$((3+vy)) && (X-${casyx[1]})==-2 ));then dibuja_mur0_3c $t +2;fi
                    if (( (Y-${casyx[0]})==$((4+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_4c $t 0;fi
                    if (( (Y-${casyx[0]})==$((4+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_4c $t -1;fi
                    if (( (Y-${casyx[0]})==$((4+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_4c $t +1;fi
                    if (( (Y-${casyx[0]})==$((4+vy)) && (X-${casyx[1]})==2 ));then dibuja_mur0_4c $t -2;fi
                    if (( (Y-${casyx[0]})==$((4+vy)) && (X-${casyx[1]})==-2 ));then dibuja_mur0_4c $t +2;fi
            fi
           ## MIRANDO AL SUR
           elif ((DIR==2));then
                # MUROS ESTE Y OESTE
                if [[ "$ordenpintaT" == "1" || "$ordenpintaT" == "3" ]] && [[ "$t" != "0" ]] && [[ "$t" != "" ]]; then 
                    if [[ "$ordenpintaT" == "3" ]]; then vx=0; else vx=1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_0d $t;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_1d $t;fi
                    if (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_2d $t 0;fi
                    if (( (Y-${casyx[0]})==-3 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_3d $t 0;fi
                    if (( (Y-${casyx[0]})==-3 && (X-${casyx[1]})==$((1+vx)) )); then dibuja_mur0_3d $t +1;fi
                    if (( (Y-${casyx[0]})==-4 && (X-${casyx[1]})==$((0+vx)) ));then dibuja_mur0_4d $t 0;fi
                    if (( (Y-${casyx[0]})==-4 && (X-${casyx[1]})==$((1+vx)) ));then dibuja_mur0_4d $t +1;fi
                    if (( (Y-${casyx[0]})==-3 && (X-${casyx[1]})==$((1+vx)) )); then dibuja_mur0_3d $t +1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_0i $t;fi 
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_1i $t;fi 
                    if (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_2i $t 0;fi
                    if (( (Y-${casyx[0]})==-3 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_3i $t 0;fi 
                    if (( (Y-${casyx[0]})==-3 && (X-${casyx[1]})==$((-2+vx)) ));then dibuja_mur0_3i $t -1;fi
                    if (( (Y-${casyx[0]})==-4 && (X-${casyx[1]})==$((-1+vx)) ));then dibuja_mur0_4i $t 0;fi
                    if (( (Y-${casyx[0]})==-4 && (X-${casyx[1]})==$((-2+vx)) ));then dibuja_mur0_4i $t -1;fi
                fi
                # MUROS NORTE Y SUR
                if [[ "$ordenpintaT" == "0" || "$ordenpintaT" == "2" || "$ordenpintaT" == "5" ]] && [[ "$t" != "0" ]] && [[ "$t" != "" ]]; then 
                    if [[ "$ordenpintaT" == "2" || "$ordenpintaT" == "5" ]]; then vy=0; else vy=-1;fi
                    if (( (Y-${casyx[0]})==$((0+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_0c $t 0;fi
                    if (( (Y-${casyx[0]})==$((0+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_0c $t -1;fi
                    if (( (Y-${casyx[0]})==$((0+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_0c $t +1;fi
                    if (( (Y-${casyx[0]})==$((-1+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_1c $t 0;fi
                    if (( (Y-${casyx[0]})==$((-1+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_1c $t +1;fi
                    if (( (Y-${casyx[0]})==$((-1+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_1c $t -1;fi
                    if (( (Y-${casyx[0]})==$((-2+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_2c $t 0;fi
                    if (( (Y-${casyx[0]})==$((-2+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_2c $t -1;fi
                    if (( (Y-${casyx[0]})==$((-2+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_2c $t +1;fi
                    if (( (Y-${casyx[0]})==$((-2+vy)) && (X-${casyx[1]})==-2 ));then dibuja_mur0_2c $t -2;fi
                    if (( (Y-${casyx[0]})==$((-2+vy)) && (X-${casyx[1]})==2 ));then dibuja_mur0_2c $t +2;fi
                    if (( (Y-${casyx[0]})==$((-3+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_3c $t 0;fi
                    if (( (Y-${casyx[0]})==$((-3+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_3c $t -1;fi
                    if (( (Y-${casyx[0]})==$((-3+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_3c $t +1;fi
                    if (( (Y-${casyx[0]})==$((-3+vy)) && (X-${casyx[1]})==-2 ));then dibuja_mur0_3c $t -2;fi
                    if (( (Y-${casyx[0]})==$((-3+vy)) && (X-${casyx[1]})==2 ));then dibuja_mur0_3c $t +2;fi
                    if (( (Y-${casyx[0]})==$((-4+vy)) && (X-${casyx[1]})==0 ));then dibuja_mur0_4c $t 0;fi
                    if (( (Y-${casyx[0]})==$((-4+vy)) && (X-${casyx[1]})==-1 ));then dibuja_mur0_4c $t -1;fi
                    if (( (Y-${casyx[0]})==$((-4+vy)) && (X-${casyx[1]})==1 ));then dibuja_mur0_4c $t +1;fi
                    if (( (Y-${casyx[0]})==$((-4+vy)) && (X-${casyx[1]})==-2 ));then dibuja_mur0_4c $t -2;fi
                    if (( (Y-${casyx[0]})==$((-4+vy)) && (X-${casyx[1]})==2 ));then dibuja_mur0_4c $t +2;fi
                fi
            ## MIRANDO AL ESTE
           elif ((DIR==1));then
                # MUROS NORTE Y SUR
                if [[ "$ordenpintaT" == "0" || "$ordenpintaT" == "2" ]] && [[ "$t" != "0" ]] && [[ "$t" != "" ]]; then 
                    if [[ "$ordenpintaT" == "0" ]]; then vy=0; else vy=1;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==0 ));then dibuja_mur0_0i $t;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==-1 ));then dibuja_mur0_1i $t;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==-2 ));then dibuja_mur0_2i $t 0;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==-3 ));then dibuja_mur0_3i $t 0;fi
                    if (( (Y-${casyx[0]})==1+vy && (X-${casyx[1]})==-3 )); then dibuja_mur0_3i $t -1;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==-4 ));then dibuja_mur0_4i $t 0;fi
                    if (( (Y-${casyx[0]})==1+vy && (X-${casyx[1]})==-4 )); then dibuja_mur0_4i $t -1;fi
                    if (( (Y-${casyx[0]})==-1+vy && (X-${casyx[1]})==0 ));then dibuja_mur0_0d $t;fi 
                    if (( (Y-${casyx[0]})==-1+vy && (X-${casyx[1]})==-1 ));then dibuja_mur0_1d $t;fi 
                    if (( (Y-${casyx[0]})==-1+vy && (X-${casyx[1]})==-2 ));then dibuja_mur0_2d $t 0;fi
                    if (( (Y-${casyx[0]})==-1+vy && (X-${casyx[1]})==-3 ));then dibuja_mur0_3d $t 0;fi 
                    if (( (Y-${casyx[0]})==-2+vy && (X-${casyx[1]})==-3 ));then dibuja_mur0_3d $t +1;fi
                fi
                # MUROS ESTE Y OESTE
                if [[ "$ordenpintaT" == "1" || "$ordenpintaT" == "3" || "$ordenpintaT" == "5" ]] && [[ "$t" != "0" ]] && [[ "$t" != "" ]]; then 
                    if [[ "$ordenpintaT" == "1" || "$ordenpintaT" == "5" ]]; then vx=0; else vx=-1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==0+vx ));then dibuja_mur0_0c $t 0;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==0+vx ));then dibuja_mur0_0c $t -1;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==0+vx ));then dibuja_mur0_0c $t +1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==-1+vx ));then dibuja_mur0_1c $t 0;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==-1+vx ));then dibuja_mur0_1c $t +1;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==-1+vx));then dibuja_mur0_1c $t -1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==-2+vx ));then dibuja_mur0_2c $t 0;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==-2+vx ));then dibuja_mur0_2c $t -1;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==-2+vx ));then dibuja_mur0_2c $t +1;fi
                    if (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==-2+vx ));then dibuja_mur0_2c $t -2;fi
                    if (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==-2+vx ));then dibuja_mur0_2c $t +2;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==-3+vx ));then dibuja_mur0_3c $t 0;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==-3+vx ));then dibuja_mur0_3c $t -1;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==-3+vx ));then dibuja_mur0_3c $t +1;fi
                    if (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==-3+vx ));then dibuja_mur0_3c $t -2;fi
                    if (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==-3+vx ));then dibuja_mur0_3c $t +2;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==-4+vx ));then dibuja_mur0_4c $t 0;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==-4+vx ));then dibuja_mur0_4c $t -1;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==-4+vx ));then dibuja_mur0_4c $t +1;fi
                    if (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==-4+vx ));then dibuja_mur0_4c $t -2;fi
                    if (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==-4+vx ));then dibuja_mur0_4c $t +2;fi
                fi
            ## MIRANDO AL OESTE
            elif ((DIR==3));then
                # MUROS NORTE Y SUR
                if [[ "$ordenpintaT" == "0" || "$ordenpintaT" == "2" ]] && [[ "${vcas:ordenpintaT:1}" != "0" ]] && [[ "${vcas:ordenpintaT:1}" != "" ]]; then 
                    if [[ "$ordenpintaT" == "2" ]]; then vy=0; else vy=-1;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==0 ));then dibuja_mur0_0i $t;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==1 ));then dibuja_mur0_1i $t;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==2 ));then dibuja_mur0_2i $t 0;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==3 ));then dibuja_mur0_3i $t 0;fi
                    if (( (Y-${casyx[0]})==-1+vy && (X-${casyx[1]})==3 )); then dibuja_mur0_3i $t -1;fi
                    if (( (Y-${casyx[0]})==0+vy && (X-${casyx[1]})==4 ));then dibuja_mur0_4i $t 0;fi
                    if (( (Y-${casyx[0]})==-1+vy && (X-${casyx[1]})==4 )); then dibuja_mur0_4i $t -1;fi
                    if (( (Y-${casyx[0]})==1+vy && (X-${casyx[1]})==0 ));then dibuja_mur0_0d $t;fi 
                    if (( (Y-${casyx[0]})==1+vy && (X-${casyx[1]})==1 ));then dibuja_mur0_1d $t;fi 
                    if (( (Y-${casyx[0]})==1+vy && (X-${casyx[1]})==2 ));then dibuja_mur0_2d $t 0;fi
                    if (( (Y-${casyx[0]})==1+vy && (X-${casyx[1]})==3 ));then dibuja_mur0_3d $t 0;fi 
                    if (( (Y-${casyx[0]})==2+vy && (X-${casyx[1]})==3 ));then dibuja_mur0_3d $t +1;fi
                    if (( (Y-${casyx[0]})==1+vy && (X-${casyx[1]})==4 ));then dibuja_mur0_4d $t 0;fi 
                    if (( (Y-${casyx[0]})==2+vy && (X-${casyx[1]})==4 ));then dibuja_mur0_4d $t +1;fi
                fi
                # MUROS ESTE Y OESTE
                if [[ "$ordenpintaT" == "1" || "$ordenpintaT" == "3" || "$ordenpintaT" == "5" ]] && [[ "$t" != "0" ]] && [[ "$t" != "" ]]; then 
                    if [[ "$ordenpintaT" == "3" || "$ordenpintaT" == "5" ]]; then vx=0; else vx=1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==0+vx ));then dibuja_mur0_0c $t 0;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==0+vx ));then dibuja_mur0_0c $t -1;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==0+vx ));then dibuja_mur0_0c $t +1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==1+vx ));then dibuja_mur0_1c $t 0;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==1+vx ));then dibuja_mur0_1c $t +1;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==1+vx));then dibuja_mur0_1c $t -1;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==2+vx ));then dibuja_mur0_2c $t 0;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==2+vx ));then dibuja_mur0_2c $t -1;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==2+vx ));then dibuja_mur0_2c $t +1;fi
                    if (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==2+vx ));then dibuja_mur0_2c $t -2;fi
                    if (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==2+vx ));then dibuja_mur0_2c $t +2;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==3+vx ));then dibuja_mur0_3c $t 0;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==3+vx ));then dibuja_mur0_3c $t -1;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==3+vx ));then dibuja_mur0_3c $t +1;fi
                    if (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==3+vx ));then dibuja_mur0_3c $t -2;fi
                    if (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==3+vx ));then dibuja_mur0_3c $t +2;fi
                    if (( (Y-${casyx[0]})==0 && (X-${casyx[1]})==4+vx ));then dibuja_mur0_4c $t 0;fi
                    if (( (Y-${casyx[0]})==-1 && (X-${casyx[1]})==4+vx ));then dibuja_mur0_4c $t -1;fi
                    if (( (Y-${casyx[0]})==1 && (X-${casyx[1]})==4+vx ));then dibuja_mur0_4c $t +1;fi
                    if (( (Y-${casyx[0]})==-2 && (X-${casyx[1]})==4+vx ));then dibuja_mur0_4c $t -2;fi
                    if (( (Y-${casyx[0]})==2 && (X-${casyx[1]})==4+vx ));then dibuja_mur0_4c $t +2;fi
                fi
            fi
        done
    done    
}
function fin { clear;exit; }
function queHay {
    local hay=0 cas vcas ret
    if ((${1}<0 || ${1}>LY-1 || ${2}<0 || ${2}>LX-1));then echo "no";return; fi
    cas="MAPA${1}_${2}";vcas=${!cas};
    if [[ "${vcas:5:1}" != "0" && "${vcas:5:1}" != ""  ]]; then echo "no";return;fi
    ret="si"
    if [[ "${vcas:$3:1}" != "0" ]]; then ret="no";fi
    if [[ "${vcas:$3:1}" == "3" ]]; then ret="si";fi
    echo $ret;
} 
function gestionPNJ {
    local random_opcion random_dir dir dir1 newY newX vy vx procedeatacar=0 j y x
    for ((j=1;j<=PJnum;j++));do	
        y="PJ${j}_y";x="PJ${j}_x";dir="PJ${j}_dir";y=${!y};x=${!x};dir=${!dir}
        #if (pnj[i].stop==true) continue;
        random_opcion=$((RANDOM%2))
        if ((random_opcion==0));then #girarse
            random_dir=$((RANDOM%2))
            if ((random_dir==0));then ((dir--)); else ((dir++));fi
            if ((dir==-1));then dir=3;elif ((dir==4));then dir=0;fi
            eval "PJ"${j}"_dir="$dir;
        else  # avanzar
            if ((dir==0));then dir1=2;vy=-1;vx=0;elif ((dir==1));then dir1=3;vy=0;vx=1;elif ((dir==2));then dir1=0;vy=1;vx=0;elif ((dir==3));then dir1=1;vy=0;vx=-1;fi
            ((newX=x+vx));((newY=y+vy))
            if [[ "$(queHay $y $x $dir)" != "no"  && "$(queHay $newY $newX $dir1)" != "no" ]];  then 
                eval "PJ"${j}"_y="$newY;eval "PJ"${j}"_x="$newX;
            fi
        fi         
        
    done
}
function motor {
    local redibuja=0 mueve=0
    function readkey {
        local k="" vy=0 vx=0 newY newX codigo codigo1
        read -n1 k
        if [[ $k = d ]]; then ((DIR++));if((DIR>3));then DIR=0;fi; redibuja=1
        elif [[ $k = a ]]; then ((DIR--));if((DIR<0));then DIR=3;fi; redibuja=1
        elif [[ $k = z ]]; then redibuja=1;
        elif [[ $k = p ]]; then fin;
        elif [[ $k = w ]]; then 
            if ((DIR==0));then vy=-1;vx=0;elif ((DIR==1));then vy=0;vx=1;elif ((DIR==2));then vy=1;vx=0;elif ((DIR==3));then vy=0;vx=-1;fi;mueve=1
        elif [[ $k = s ]]; then 
            if ((DIR==0));then vy=1;vx=0;elif ((DIR==1));then vy=0;vx=-1;elif ((DIR==2));then vy=-1;vx=0;elif ((DIR==3));then vy=0;vx=1;fi;mueve=1
        elif [[ $k = q ]]; then 
            if ((DIR==0));then vy=0;vx=-1;elif ((DIR==1));then vy=-1;vx=0;elif ((DIR==2));then vy=0;vx=1;elif ((DIR==3));then vy=1;vx=0;fi;mueve=1
        elif [[ $k = e ]]; then 
            if ((DIR==0));then vy=0;vx=1;elif ((DIR==1));then vy=1;vx=0;elif ((DIR==2));then vy=0;vx=-1;elif ((DIR==3));then vy=-1;vx=0;fi;mueve=1
        fi
        if ((mueve==1));then 
            ((newY=Y+vy));((newX=X+vx));
            if ((newY>Y));then codigo="2";codigo1="0";
            elif ((newY<Y));then codigo="0";codigo1="2";
            elif ((newX>X));then codigo="1";codigo1="3";
            elif ((newX<X));then codigo="3";codigo1="1";fi	
            if [[ "$(queHay $Y $X $codigo)" != "no"  && "$(queHay $newY $newX $codigo1)" != "no" ]];  then Y=$newY;X=$newX;else mueve=0;fi
        fi
    }
    
    readkey;
    if ((mueve==1 || redibuja==1));then caja;gestionPNJ;dibuja;writedir;fi
    motor
}
function writedir { local dirT;if((DIR==0));then dirT="north";elif((DIR==1));then dirT="east ";elif((DIR==2));then dirT="south";elif((DIR==3));then dirT="west ";fi;printf "\e[28;52H\e[40;32m$dirT"; }
function fin { clear;printf "\e[1;1H\e[1;44;33mDiejuse appreciates you played his game. See you soon!\n\n\e[40;97m";stty echo;printf "\e[?25h";exit; }
function init {
    clear
    stty -echo -icanon time 0 min 0;printf "\e[40m";clear;printf "\e[0m";printf "\e[?25l"
    OY=2;OX=2;OLX=58;OLY=25;LX=7;DIR=3;Y=2;X=1;
    MAP=(   "11011" "10001" "12011" "20001" "20001" "10001" "11001"
            "10011" "00001" "03000" "00001" "00001" "00001" "01001"
            "11211" "00001" "02000" "00001" "11111" "00001" "01001"
            "00021" "00001" "03004" "00001" "00001" "00001" "01001"
            "00221" "02201" "30000" "00111" "00101" "33021" "01101"
            "00001" "01101" "30001" "00011" "00001" "00001" "00001"
            "00001" "00001" "00001" "00001" "00001" "00001" "00001"
            "00001" "00001" "00001" "00001" "00001" "00001" "00001"
            "00001" "00001" "00001" "00001" "00001" "00001" "00001" )
    ((LY=${#MAP[*]}/LX))
    for ((y=0;y<=${#MAP[*]};y+=LX));do for ((x=0;x<LX;x++));do eval "MAPA"$((y/LX))"_"$((x))"="${MAP[$((y+x))]}; 
    done;done
    PJnum=2;PJ1_y=1;PJ1_x=2;PJ1_dir=1;PJ2_y=3;PJ2_x=2;PJ2_dir=0;
    printf "\e[1;2H\e[40;32mpseudo3dBASH v0.1 (pseudo 3d ascii engine) \e[40;36mby Diejuse\e[28;2H\e[40;33mKeys: move->Q W E A S D     skip->Z     exit->P";
    caja;dibuja;writedir
}
init;motor;printf "\e[0m\e[1;1H\e[40;32m";printf "\e[?25h"
