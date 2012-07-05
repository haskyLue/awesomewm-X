#!/bin/bash

THEMEDIR=$HOME"/.config/awesome/themes/niceandclean"

killall conky
killall idesk
if grep -q "wp" <<<$@; then
    awsetbg "$THEMEDIR"/background.jpg
fi
if grep -q "conky" <<<$@; then
    conky -c "$THEMEDIR"/conky/nice-and-clean/conkyhr &
    conky -c "$THEMEDIR"/conky/nice-and-clean/conkymin &
    conky -c "$THEMEDIR"/conky/nice-and-clean/conkydate &
    conky -c "$THEMEDIR"/conky/nice-and-clean/conkystats &
fi
if grep -q "idesk" <<<$@; then
    idesk &
fi
#if grep -q "wp" <<<$@; then
    #awsetbg "$THEMEDIR"/background-large.jpg
#fi
#if grep -q "conky" <<<$@; then
    #conky -c "$THEMEDIR"/conky/nice-and-clean-large/conkyhr &
    #conky -c "$THEMEDIR"/conky/nice-and-clean-large/conkymin &
    #conky -c "$THEMEDIR"/conky/nice-and-clean-large/conkydate &
    #conky -c "$THEMEDIR"/conky/nice-and-clean-large/conkystats &
#if grep -q "wp" <<<$@; then
    #awsetbg "$THEMEDIR"/background.jpg
#fi
#if grep -q "conky" <<<$@; then
    #conky -c "$THEMEDIR"/conky/nice-and-clean/conkyhr &
    #conky -c "$THEMEDIR"/conky/nice-and-clean/conkymin &
    #conky -c "$THEMEDIR"/conky/nice-and-clean/conkydate &
    #conky -c "$THEMEDIR"/conky/nice-and-clean/conkystats &
#fi

#fi
#if grep -q "conky" <<<$@; then
    #conky -c "$THEMEDIR"/conky/nice-and-clean-1920/conkyhr &
    #conky -c "$THEMEDIR"/conky/nice-and-clean-1920/conkymin &
    #conky -c "$THEMEDIR"/conky/nice-and-clean-1920/conkydate &
    #conky -c "$THEMEDIR"/conky/nice-and-clean-1920/conkystats &
#fi
exit 0