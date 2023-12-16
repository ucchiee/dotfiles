#!/home/ucchiee/.asdf/shims/python
import argparse
import os
import subprocess


def main(args: argparse.Namespace) -> None:
    bin = os.path.abspath(args.binary)
    os.system(f"extract-bc {bin}")
    clam_cmd = [
        "clam.py",
        f"{bin}.bc",
        "-O0",
        "--crab-inter",
        "--crab-inter-entry-main",
        "--devirt-functions=types",
        # "--devirt-functions=sea-dsa",
        # "--crab-widening-delay 10",
        "--crab-dom=int",
        "--crab-track=sing-mem",
        "-m=64",
        "--crab-lower-unsigned-icmp",
        "-ojson",
        f"{bin}json",
        "-oll",
        f"{bin}.clam.ll",
    ]

    subprocess.run(clam_cmd, shell=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("binary", type=str, help="path to binary")
    args = parser.parse_args()
    main(args)
