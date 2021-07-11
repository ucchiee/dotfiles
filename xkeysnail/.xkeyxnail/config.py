import re
from xkeysnail.transform import *

define_keymap(
    lambda wm_class: wm_class not in ("Gnome-terminal", "Alacritty"),
    {
        # cousor
        K("LC-A"): with_mark(K("home")),
        K("LC-E"): with_mark(K("end")),
        K("LC-P"): K("UP"),
        K("LC-N"): K("DOWN"),
        K("LC-F"): K("RIGHT"),
        K("LC-B"): K("LEFT"),
        K("LC-H"): K("BACKSPACE"),
        K("LC-D"): [K("delete"), set_mark(False)],
        K("LC-K"): [K("Shift-end"), K("C-x"), set_mark(False)],
        # restore original bind
        K("Shift-LC-A"): K("LC-A"),
        K("Shift-LC-E"): K("LC-E"),
        K("Shift-LC-P"): K("LC-P"),
        K("Shift-LC-N"): K("LC-N"),
        K("Shift-LC-F"): K("LC-F"),
        K("Shift-LC-B"): K("LC-B"),
        K("Shift-LC-H"): K("LC-H"),
        K("Shift-LC-D"): K("LC-D"),
        K("Shift-LC-K"): K("LC-K"),
        # Backslash
        # K("YEN"): K("BACKSLASH"),
    },
    "NotInTerminal",
)

define_keymap(
    re.compile("Gnome-terminal"),
    {
        # K("SEMICOLON"): K("LShift-SEMICOLON-LShift"),
        # K("LShift-SEMICOLON"): K("SEMICOLON"),
        # K("YEN"): K("BACKSLASH"),
    },
    "terminal",
)
