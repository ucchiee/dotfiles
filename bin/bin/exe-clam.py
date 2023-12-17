#!/home/ucchiee/.asdf/shims/python
import argparse
import os
import subprocess


def main(args: argparse.Namespace) -> None:
    result_list: list[tuple[str, list[bytes], list[bytes]]] = []
    for bin in args.binary:
        bin = os.path.abspath(bin)
        pass_path = os.path.abspath(args._pass)
        json_path = f"{bin}json"
        clamll_path = f"{bin}.clam.ll"

        os.system(f"extract-bc {bin}")

        clam_cmd = [
            "clam.py",
            f"{bin}.bc",
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
            "--crab-lower-unsigned-icmp",
            "-ojson",
            json_path,
            "-oll",
            clamll_path,
        ]
        subprocess.run(clam_cmd)

        pass_cmd = [
            "opt",
            "-enable-new-pm=0",
            "-load",
            pass_path,
            "-legacy-hello-world",
            f"-clam-json={json_path}",
            clamll_path,
            "-S",
            "-o",
            f"{bin}_temp.ll",
        ]

        cp = subprocess.run(pass_cmd, capture_output=True)
        print((cp.stdout))
        print((cp.stderr))

        result_list.append(
            (os.path.basename(bin), cp.stdout.splitlines(), cp.stderr.splitlines())
        )

    __import__("pprint").pprint(result_list)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("_pass", type=str, help="path to pass")
    parser.add_argument(
        "-b", "--binary", type=str, nargs="+", help="path to binary, can be multiple"
    )
    args = parser.parse_args()
    main(args)
