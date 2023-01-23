#!/Users/uu/.asdf/shims/python
import json
import os
import subprocess
import sys

# > cp = subprocess.run("yabai -m query --spaces --display".split(" "), capture_output=True)
# > cp.stdout
# [{
# "id":3,
# "uuid":"F29AC063-0F0F-4C59-ACAC-A55A437DF6CB",
# "index":1,
# "label":"",
# "type":"bsp",
# "display":1,
# "windows":[41, 84, 87],
# "first-window":41,
# "last-window":41,
# "has-focus":true,
# "is-visible":true,
# "is-native-fullscreen":false
# }]


def main() -> None:
    cp = subprocess.run("yabai -m query --spaces --display".split(" "), capture_output=True)
    data = json.loads(cp.stdout)

    # Detect empty space, or create new one
    target_idx: int = -1
    for each_dict in data:
        if each_dict["windows"]:
            continue
        if each_dict["is-native-fullscreen"]:
            continue
        target_idx = each_dict["index"]
        break

    else:
        os.system("yabai -m space --create")
        target_idx = len(data) + 1

    # Move the window
    while True:
        cp = subprocess.run(f"yabai -m window --space {target_idx}".split(" "), stderr=subprocess.DEVNULL)
        if cp.returncode != 0:
            target_idx -= 1
            continue
        break

    # Move focus
    if len(sys.argv) > 1:
        subprocess.run(f"yabai -m space --focus {target_idx}".split(" "))


if __name__ == "__main__":
    main()
