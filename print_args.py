import sys
import shlex
import argparse


def modify_args():
    sys.argv = shlex.split(' '.join(sys.argv))


def tool():
    parser = argparse.ArgumentParser(description="A simple argparse example.")

    parser.add_argument('-a', type=str, help="a argument")
    parser.add_argument('-b', type=str, help="b argument")
    parser.add_argument('-s', '--store', action='store_true', help="s argument")
    parser.add_argument('nargs', action='store', nargs='*', default=' ', help='n args')

    args = parser.parse_args()
    print(f'parsed args: {args}')


if __name__ == "__main__":
    print('--------------------')
    print('Without modify args:')
    print(f'sys.argv: {sys.argv}'); tool()
    modify_args()
    print('--------------------')
    print('With modify args:')
    print(f'sys.argv: {sys.argv}'); tool()