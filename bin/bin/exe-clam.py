#!/home/ucchiee/.asdf/shims/python
import argparse
import os
import subprocess
import sys


def main(args: argparse.Namespace) -> None:
    result_list: list[tuple[str, list[bytes], list[bytes]]] = []
    for bin in args.binary:
        bin = os.path.abspath(bin)
        bc = f"{bin}.bc"
        ll = f"{bin}.ll"
        pass_path = os.path.abspath(args._pass)
        json_path = f"{bin}json"
        clamll = f"{bin}.clam.ll"

        if not args.disable_clam:
            os.system(f"extract-bc {bin}")
            os.system(f"llvm-dis {bc}")

            # mem2reg
            # opt -S -mem2reg {bin} -o {bin}
            mem2reg_cmd = [
                "opt",
                "-S",
                "-mem2reg",
                ll,
                "-o",
                ll,
            ]
            subprocess.run(mem2reg_cmd)

            clam_cmd = [
                "clam.py",
                ll,
                "-O0",
                "--crab-inter",
                # "--crab-inter-entry-main",
                "--devirt-functions=types",
                # "--devirt-functions=sea-dsa",
                # "--crab-widening-delay=10",
                "--crab-dom=int",
                "--crab-track=mem",  # better precision (more expensive)
                # "--crab-track=sing-mem",
                "-m=64",
                "--crab-disable-warnings",
                "--crab-lower-unsigned-icmp",
                "-ojson",
                json_path,
                "-oll",
                clamll,
            ]
            subprocess.run(clam_cmd)

        pass_cmd = [
            "opt",
            "-enable-new-pm=0",
            "-load",
            pass_path,
            "-legacy-hello-world",
            f"-clam-json={json_path}",
            clamll,
            "-S",
            "-o",
            f"{bin}_temp.ll",
        ]

        print(f"=={bin}==", file=sys.stderr)
        cp = subprocess.run(pass_cmd, capture_output=args.capture_output)
        if args.capture_output:
            print((cp.stdout))
            print((cp.stderr))

            result_list.append(
                (os.path.basename(bin), cp.stdout.splitlines(), cp.stderr.splitlines())
            )

    if args.capture_output:
        __import__("pprint").pprint(result_list)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("_pass", type=str, help="path to pass")
    parser.add_argument(
        "-b", "--binary", type=str, nargs="+", help="path to binary, can be multiple"
    )
    parser.add_argument("--disable_clam", action="store_true")
    parser.add_argument("--capture_output", action="store_true")
    args = parser.parse_args()
    main(args)
