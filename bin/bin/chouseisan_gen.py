import argparse
from datetime import datetime, timedelta


def main(args: argparse.Namespace) -> None:
    delta_day = timedelta(days=1)
    delta_min = timedelta(minutes=args.how_long)
    now = datetime.now() + delta_day * args.start_day
    start_hour, start_min = map(int, args.start_time.split(":"))
    base = datetime(
        year=now.year,
        month=now.month,
        day=now.day,
        hour=start_hour,
        minute=start_min,
    )
    the_day_dict = {
        "Mon": "(月) ",
        "Tue": "(火) ",
        "Wed": "(水) ",
        "Thu": "(木) ",
        "Fri": "(金) ",
        "Sat": "(土) ",
        "Sun": "(日) ",
    }
    for day_offset in range(args.num_day):
        for min_offset in range(args.how_many):
            slot = base + delta_day * day_offset + delta_min * min_offset
            print(
                slot.strftime("%m/%d")
                + the_day_dict[slot.strftime("%a")]
                + slot.strftime("%H:%M〜")
            )


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--start_day", type=int, default=0, help="today=0,tomorrow=1...")
    parser.add_argument("--num_day", type=int, default=1)
    parser.add_argument("--start_time", type=str, default="10:00", help="e.g.: 10:00")
    parser.add_argument("--how_long", type=int, default=60, help="In minutes.")
    parser.add_argument("--how_many", type=int, default=3)
    main(parser.parse_args())
