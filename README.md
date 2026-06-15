# HyDE Vencord Theme
<img width="1540" height="1384" alt="260615_18h35m54s_screenshot" src="https://github.com/user-attachments/assets/ac917167-f389-44af-b698-d3d5e624c79d" />

<img width="1540" height="1384" alt="260615_18h42m34s_screenshot" src="https://github.com/user-attachments/assets/420f0539-b742-4500-b112-8cc0decd93cd" />
GIFs also work

Dynamically switches your Discord wallpaper to automatically match your current HyDE wallpaper.

Built for Vesktop + Vencord on HyDE. Should also work on stock Discord with Vencord installed, but Vesktop is what I tested.

## What it does

HyDE already syncs Discord's color theme to your wallpaper through wallbash. This adds the actual wallpaper image, showing up behind your chats. The wallbash hook fires on every wallpaper or theme change and bakes the current wallpaper into a Vencord theme file as base64. Vencord hot reloads the theme, you see the new wallpaper live.

You can toggle it on and off in Vesktop settings like any other theme.

## Requirements

* HyDE
* Vesktop with Vencord, or Discord with Vencord
* base64 (every distro has this already)

## Install

Two files, two destinations.

Drop the wallpaper baker into your local bin:

```bash
cp discord-wall ~/.local/bin/
chmod +x ~/.local/bin/discord-wall
```

Drop the wallbash hook into HyDE's scripts dir:

```bash
cp discord-wall.sh ~/.config/hyde/wallbash/scripts/
chmod +x ~/.config/hyde/wallbash/scripts/discord-wall.sh
```

Run it once manually so the theme file exists:

```bash
discord-wall
```

Now open Vesktop, go to Settings > Vencord > Themes, and flip on "HyDE Wallpaper".

Swap a wallpaper through HyDE and Discord swaps with it. That's it.

## How it works

`discord-wall` reads `~/.cache/hyde/wall.set`, encodes the image as base64, and writes a Vencord theme CSS file at `~/.config/vesktop/themes/hyde-wallpaper.theme.css` with the wallpaper embedded inline. CSS gets injected on top of HyDE's existing wallbash color sync, so you get matching colors AND the wallpaper.

The hook script lives in `wallbash/scripts/` so it fires every time HyDE updates colors, which happens on every theme switch and wallpaper change. No polling, no daemon, no extra deps.

## Uninstall

```bash
rm ~/.local/bin/discord-wall
rm ~/.config/hyde/wallbash/scripts/discord-wall.sh
rm ~/.config/vesktop/themes/hyde-wallpaper.theme.css
```

Then toggle the theme off in Vesktop settings.

## Tweaking

The CSS at the bottom of `discord-wall` controls how the wallpaper sits behind Discord. Panel opacity, message bubble tint, all that. Edit the script, change the rgba values, rerun it. The two knobs worth touching:

* `rgba(var(--backgroundprimary), 0.30)` on the sidebars, raise it if your wallpaper makes the channel list hard to read
* `rgba(var(--backgroundprimary), 0.55)` on the message bubble, raise it if text is washed out

## Notes

Vesktop's Flatpak path is supported. The script writes to the native install path by default. If you run Flatpak Vesktop, change the `THEME` line in `discord-wall` to:

```
THEME="$HOME/.var/app/dev.vencord.Vesktop/config/vesktop/themes/hyde-wallpaper.theme.css"
```

If your wallpaper is something weird like jxl or avif, the script falls back to image/jpeg as the MIME and Discord probably won't render it. Stick to png, jpg, webp, gif and you're fine.

## Credits

HyDE Project did the heavy lifting on wallbash. This is just a small piece riding on top of what they built.

## License

MIT. Do whatever.
