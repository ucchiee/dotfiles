#!/home/ucchiee/.asdf/shims/python
import argparse
import os
import subprocess


def main(args: argparse.Namespace) -> None:
    grep_awk = " | grep exec_time | awk '{sum+=$2} END {print sum/NR}'"

    for specimen in args.specimen:
        print(specimen)

        cmd = f"cat {specimen}.slh.result" + grep_awk
        p = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=True,
        )
        out, _ = p.communicate()
        before = float(out.decode().strip())

        cmd = f"cat {specimen}.slh.instr.result" + grep_awk
        p = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=True,
        )
        out, _ = p.communicate()
        after = float(out.decode().strip())
        # cat 473.astar.slh.result | grep exec_time | awk '{sum+=$2} END {print sum/NR}'

        print(f"before  : {before}")
        print(f"after   : {after}")
        print(f"sppedup : {(before - after) / before * 100} %")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", "--specimen", type=str, nargs="+", help="Name of specimen")
    args = parser.parse_args()
    main(args)
