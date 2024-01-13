#!/home/ucchiee/.asdf/shims/python
import argparse
import os
import subprocess


def main(args: argparse.Namespace) -> None:
    for bin in args.binary:
        """bin = os.path.abspath(bin)"""
        as_path = f"{bin}.s"

        # 元のバイナリのバックアップを取る
        bin_org = f"{bin}.org"
        if os.path.exists(bin) and not os.path.exists(bin_org):
            print(f"Backup {bin} -> {bin_org}")
            os.system(f"mv {bin} {bin_org}")

        # compile (.ll -> .s)
        ll = f"{bin}.instr.ll" if args.use_instr else f"{bin}.clam.ll"
        if not os.path.exists(ll):
            print(f"ll file not found: {ll}")
        compile_cmd = [
            "llc",
            "-o",
            as_path,
            ll,
        ]
        if args.slh:
            compile_cmd.insert(1, "--x86-speculative-load-hardening")
        print(" ".join(compile_cmd))
        cp = subprocess.run(compile_cmd)
        if cp.returncode != 0:
            print(".ll -> .s : Failed...")
            continue

        # compile (.s -> binary)
        compile_cmd = [
            "clang++",
            "-O0",
            "-o",
            bin,
            as_path,
        ]
        print(" ".join(compile_cmd))
        cp = subprocess.run(compile_cmd)
        if cp.returncode != 0:
            print(".s -> binary : Failed...")
            continue
        else:
            print("Compilatin Done!")


def restore(args: argparse.Namespace) -> None:
    for bin in args.binary:
        bin_org = f"{bin}.org"
        os.system(f"mv {bin_org} {bin}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-b", "--binary", type=str, nargs="+", help="path to binary, can be multiple"
    )
    parser.add_argument(
        "--use_instr", action="store_true", help="use *.instr.ll, default *.clam.ll.bak"
    )
    parser.add_argument("--slh", action="store_true", help="enable SLH")
    parser.add_argument("--restore", action="store_true", help="restore original binary")
    args = parser.parse_args()

    if args.restore:
        restore(args)
    else:
        main(args)
