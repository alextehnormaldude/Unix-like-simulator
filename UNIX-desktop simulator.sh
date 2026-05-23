#!/bin/bash

# Initialize variables
writeone=""
writetwo=""
writethree=""
textone=""
texttwo=""
textthree=""

# Color definitions
BLUE_BG_LIGHT_BLUE_TXT="\e[44;94m"
BLACK_BG_GREEN_TXT="\e[40;32m"
RESET_COLOR="\e[0m"

clear
echo -e "${BLUE_BG_LIGHT_BLUE_TXT}"
clear
echo "A Unix kernel-like simulator (not rlly)"
read -rsp "Press enter to continue..." -n1
echo -e "${RESET_COLOR}"

bootscreentwo() {
    clear
    echo "Welcome to a UNIX-like simulator! (not rlly)"
    echo "1)Admin Login"
    echo "2)Guest login"
    read -p "Selection: " logintype
    
    if [ "$logintype" = "1" ]; then
        bootscreen
    elif [ "$logintype" = "2" ]; then
        ltddesktop
    else
        bootscreentwo
    fi
}

bootscreen() {
    clear
    read -s -p "Password: " password
    echo ""
    if [ "$password" = "unix" ]; then
        desktop
    else
        bootscreentwo
    fi
}

desktop() {
    clear
    echo -e "${BLACK_BG_GREEN_TXT}"
    clear
    echo "Welcome"
    echo ""
    echo "Date: $(date +%Y-%m-%d) Time: $(date +%H:%M:%S)"
    echo "Apps:"
    echo "1)Write"
    echo "2)Docs"
    echo "3)Calculator"
    read -p "Selection: " menuselect
    
    if [ "$menuselect" = "1" ]; then
        write_app
    elif [ "$menuselect" = "2" ]; then
        browse
    elif [ "$menuselect" = "3" ]; then
        calculator
    else
        desktop
    fi
}

write_app() {
    clear
    echo "Welcome to Write, an application which let's you write text files"
    read -p "What will be the name of your text: " writeone
    clear
    echo "Ok, your file has been created"
    read -rsp "Press enter to continue..." -n1
    clear
    read -p "Enter text: " textone
    read -rsp "Press enter to continue..." -n1
    echo "Ok, now your done, you will be redirected to the desktop"
    read -rsp "Press enter to continue..." -n1
    desktop
}

calculator() {
    clear
    read -p "Enter equation: " equ
    # bc handles math in shell scripts
    result=$(echo "$equ" | bc 2>/dev/null)
    clear
    echo "Result: $result"
    read -rsp "Press enter to continue..." -n1
    desktop
}

browse() {
    clear
    echo "1)$writeone"
    echo "2)$writetwo"
    echo "3)$writethree"
    read -p "Selection: " browse_sel
    
    if [ "$browse_sel" = "1" ]; then
        textone_view
    elif [ "$browse_sel" = "2" ]; then
        texttwo_view
    elif [ "$browse_sel" = "3" ]; then
        textthree_view
    else
        desktop
    fi
}

textone_view() {
    clear
    echo "$writeone"
    echo "$textone"
    read -rsp "Press enter to continue..." -n1
    desktop
}

texttwo_view() {
    clear
    echo "$writetwo"
    echo "$texttwo"
    read -rsp "Press enter to continue..." -n1
    desktop
}

textthree_view() {
    clear
    echo "$writethree"
    echo "$textthree"
    read -rsp "Press enter to continue..." -n1
    desktop
}

ltddesktop() {
    clear
    echo "Hello there, you are logged in as a guest"
    echo ""
    echo "You can use the standard tools such as: The calculator and the clock"
    echo ""
    echo "Have fun"
    read -rsp "Press enter to continue..." -n1
    clear
    echo "1)Calculator!"
    echo "2)Clock"
    read -p "Selection: " ltdmenu
    
    if [ "$ltdmenu" = "1" ]; then
        ltdcalculator
    elif [ "$ltdmenu" = "2" ]; then
        clock_app
    else
        ltddesktop
    fi
}

clock_app() {
    clear
    echo "$(date +%Y-%m-%d) $(date +%H:%M:%S)"
    read -rsp "Press enter to continue..." -n1
    ltddesktop
}

ltdcalculator() {
    clear
    read -p "Enter equation: " equ
    result=$(echo "$equ" | bc 2>/dev/null)
    clear
    echo "Result: $result"
    read -rsp "Press enter to continue..." -n1
    ltddesktop
}

# Start the application
bootscreentwo
