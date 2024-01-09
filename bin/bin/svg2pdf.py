#!/Users/uu/.asdf/shims/python
import argparse
import os


def main(args: argparse.Namespace) -> None:
    file = args.file
    _, ext = os.path.splitext(file)
    if ext == ".svg":
        pdf = os.path.splitext(file)[0] + ".pdf"
        os.system(f"inkscape -D -z --file={file} --export-pdf={pdf}")
        print(f"{file} -> {pdf}")
    elif ext == ".dot":
        pdf = file + ".pdf"
        os.system(f"dot -Tpdf -O {file}")
        print(f"{file} -> {pdf}")
    else:
        assert False


if __name__ == "__main__":
    parsrer = argparse.ArgumentParser()
    parsrer.add_argument("file", type=str, help="path to svg/dot")
    main(parsrer.parse_args())
