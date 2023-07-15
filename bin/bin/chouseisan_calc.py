import argparse

import pandas as pd


def main(args: argparse.Namespace) -> None:
    # Read csv
    df = pd.read_csv(args.input, index_col="日程", dtype=str)

    # Replace
    df = df.replace("◯", 1)
    df = df.replace("△", 0.5)
    df = df.replace("×", 0)

    # Init
    res_dict: dict[str, int] = dict()
    for day in df.index:
        res_dict[day] = 0
    important_list: set[str] = {"うちだ", "山口", "織田", "能村"}

    for idx, row in df.iterrows():
        for person, val in row.items():
            if person in important_list:
                res_dict[idx] += val * 2
            else:
                res_dict[idx] += val
    __import__('pprint').pprint(res_dict)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=str, required=True, help="調整さんから出力したcsvのパス")
    main(parser.parse_args())
