#!/usr/bin/env bash
# HyDE wallbash hook — triggers discord-wall on every wallbash run
[ -x "$HOME/.local/bin/discord-wall" ] && "$HOME/.local/bin/discord-wall"
