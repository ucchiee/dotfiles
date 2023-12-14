import argparse
import os


def main(args):
    bin = os.path.abspath(args.binary)
    os.system(f"extract-bc {bin}")
    os.system(
        f"clam.py {bin}.bc -O0 --crab-inter --crab-widening-delay 10 --crab-dom=int --crab-track=sing-mem -m=64 --crab-lower-unsigned-icmp -ojson {bin}.json -oll {bin}.clam.ll"
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("binary", type=str, help="path to binary")
    args = parser.parse_args()
    main(args)
