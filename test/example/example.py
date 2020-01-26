import argparse
import sys


def run(input1, input2):
    """
    Adds input 1 and input 2 then prints them
    """
    output = input1 + input2

    return output


def main():
    """
    Console script
    """
    parser = argparse.ArgumentParser()
    parser.add_argument("--input1", help="Some input", default="one", action="store")
    parser.add_argument("--input2", help="Some input", default="two", action="store")
    args = parser.parse_args()

    output = run(args.input1, args.input2)
    print(output)
    print("Success!")

    return 0


if __name__ == "__main__":
    sys.exit(main())
