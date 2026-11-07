# Dynamic Discord Theme

This changes your discord wallpaper from boring to whatever wallpaper you have selected, GIFs are supported.

Built for Vesktop, Vencord, whatever cord, and Noctalia's App Theming.

Toggle it on and off in Vesktop settings like any other theme.

<img width="1704" height="1386" alt="image" src="https://github.com/user-attachments/assets/4e597f7f-956c-40da-beaf-12c63c8dcb97" />

## The moon

The Discord button up top is a moon. Click it to swap between your last server and your last DM. It flips when you click. It keeps your place, so even after restarts it switches between whatever your last DM was and last server.

## Requirements

* Noctalia
* Vesktop with Vencord
* Python 3.11+
* The Python `brotli` package (`python-brotli` on most distros, or `pip install brotli`)

## Install

```bash
mkdir -p ~/.config/noctalia/templates ~/.local/bin ~/.local/state/discord-classes
cp discord-wall.css ~/.config/noctalia/templates/
cp wall-server vesktop-home-toggle discord-classes ~/.local/bin/
cp discord-classes.json ~/.local/state/discord-classes/modules.json
chmod +x ~/.local/bin/wall-server ~/.local/bin/vesktop-home-toggle ~/.local/bin/discord-classes
```

Add the entry from `templates.toml` to your Noctalia config.

Run `wall-server`, `vesktop-home-toggle` and `discord-classes --wait` at login, however your setup does that. Run the first two once now too.

Change your wallpaper once so the theme file exists, restart Vesktop, then go to Settings > Vencord > Themes and flip on `Discord-Wall`.

Swap your wallpaper and Discord swaps with it. That's it.

## When Discord updates

Discord renames its CSS classes sometimes, and that makes the theme go plain. `discord-classes` fixes that. It reads the new names from the Vesktop cache about 2 minutes after login and updates the theme. If it changes anything you get a notification, then press `Ctrl+R` in Vesktop.

To run it by hand, open Vesktop first, then run `discord-classes`.

## Tweaking

Everything's in `~/.config/noctalia/templates/discord-wall.css`. The ones worth touching:

* `30%` on the sidebars, raise it if your wallpaper makes them hard to read
* `55%` on the message bubbles, raise it if text looks washed out

## Uninstall

Take the entry out of your Noctalia config, take the scripts out of your startup, then:

```bash
rm ~/.local/bin/wall-server ~/.local/bin/vesktop-home-toggle ~/.local/bin/discord-classes
rm -r ~/.local/state/discord-classes
rm ~/.config/noctalia/templates/discord-wall.css
rm ~/.config/vesktop/themes/Discord-Wall.theme.css
```

## License

MIT. and blablablabla made with monotony
