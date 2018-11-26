# i3wm-Cheatsheet
> i3wm Cheatsheet

Dynamic i3 cheatsheet.

## How

Your i3wm config file must be in the format:

> [bindcode|bindsym] **bindkey** **command** **#commentary**

## Run

This could change, but for now, you could use it as:
```bash
~/path/to/project/$ ruby ./i3wm_cheat_sheet.rb | vim -R -
```

The output will be a vim instance in read-only mode with this:
```
BIND                           COMMAND                        COMMENTARY
$mod+Return                    exec ~/.config/i3/shell        # start a new terminal
$mod+Shift+Q                   kill                           # kill focused window
$mod+d                         exec dmenu_run -p alex$        
$mod+h                         focus left                     
$mod+j                         focus down                     
```

## Meta

Alex Rocha - [about.me](http://about.me/alex.rochas)
