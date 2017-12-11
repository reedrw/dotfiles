#!/bin/bash

cd "$HOME/.config/i3lock/"

import -silent -window root lock.png;
convert lock.png -scale 100% -blur 0x15 -scale 100% lock.png;
#convert lock.png -scale 10% -scale 1000% lock.png;
composite -gravity center pad.png lock.png lock.png;

i3lock -i lock.png
