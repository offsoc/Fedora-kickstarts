# fedora-live-games.ks
#
# Maintainers:
# - Darryl T. Agostinelli <dagostinelli@gmail.com>
#   https://fedoraproject.org/wiki/User:Dagostinelli
#
# - Richard Anaya <richard.anaya@gmail.com>
#   https://fedoraproject.org/wiki/User:Richardanaya
#
# Former Maintainers:
# - Bruno Wolff III <bruno@wolff.to>
#   https://fedoraproject.org/wiki/User:Bruno
#
# - Rahul Sundaram <sundaram@fedoraproject.org>
#   https://fedoraproject.org/wiki/User:Sundaram
#

%include fedora-live-xfce.ks

part / --size 15360

%packages

# Wine pulls in i386 libraries under x86_86 making that spin too big.
# Also the point is to show off Fedora games, not running windows games.

-wine

# Remove libreoffice, we're here to have fun!
-libreoffice*

# Extra screensavers isn't much help for the games spin
-xscreensaver-extras

# Allow joysticks and game pads to work
joystick-support

# games

# traditional (big)

#alienarena #Cut for size
armacycles-ad
asc
asc-music
astromenace
boswars
bzflag
crossfire-client
extremetuxracer
freeciv
freecol
freedoom
freedroidrpg
frozen-bubble
# glob2 - currently broken
lincity-ng
megaglest
nethack-vultures
netpanzer
neverball
nogravity
#pinball # Would pull in fluid-soundfont-lite-patches
scorched3d
# supertux # Crashing
supertuxkart
ultimatestunts
warzone2100
wesnoth
# worminator # Would pull in fluid-soundfont-lite-patches
warmux
xmoto

# traditional (small)

abe
# alex4 # Would pull in fluid-soundfont-lite-patches
# ballz # Would pull in fluid-soundfont-lite-patches
blobwars
bombardier
cdogs-sdl
clanbomber
colossus
foobillard
glaxium
gnubg
gnugo
haxima
#hedgewars -- broken
kcheckers
knights
lbrickbuster2
# liquidwar # Would pull in fluid-soundfont-lite-patches
lordsawar
# machineball # Would pull in fluid-soundfont-lite-patches
nethack
openlierox
pachi
pioneers
quarry
# Ri-li cut for size
rogue
# scorchwentbonkers # Would pull in fluid-soundfont-lite-patches
solarwolf
sopwith
stormbaancoureur
ularn
xblast

# arcade classics(ish) (big)

auriferous
alienblaster
# duel3 # Would pull in fluid-soundfont-lite-patches
powermanga
# raidem # Would pull in fluid-soundfont-lite-patches
# raidem-music # Would pull in fluid-soundfont-lite-patches
trackballs
trackballs-music

# arcade classics(ish) (small)

ballbuster
CriticalMass
dd2
KoboDeluxe
# lacewing # Would pull in fluid-soundfont-lite-patches
Maelstrom
methane
njam
shippy
tecnoballz
wordwarvi
xgalaxy
# zasx # Would pull in fluid-soundfont-lite-patches

# falling blocks games (small)

amoebax
crack-attack
# crystal-stacker # Would pull in fluid-soundfont-lite-patches
gemdropx
gweled

# puzzles (big)
enigma
# fillets-ng # broken in f34
pingus

# puzzles (small)

# gbrainy Removed for space - only game that pulls in mono
mirrormagic
pipenightdreams
pipepanic
pychess
rocksndiamonds
vodovod

# card games

PySolFC

# educational/simulation

#celestia - not currently building
planets
tuxpaint
tuxpaint-stamps
tuxtype2

# kde based games
taxipilot

# compilations (we are avoiding compilations, rare exceptions)
bsd-games

# utilities

games-menus

# Nothing should be downloading data to play.
-autodownloader

%end
