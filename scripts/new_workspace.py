#!/usr/bin/env python3
#
# Modified by Shaun J. Clayton (github.com/sjclayton)
# Original script credit: https://github.com/justbuchanan/i3scripts
#

import i3ipc
import argparse
import logging

from util import *

# Find next available workspace.
def find_next_ws_num(i3):
    ws_current = filter(lambda ws: ws['output'],
                           i3.get_workspaces())
    nums = [(ws['num']) for ws in ws_current]
    logging.info('currently used workspaces: %s' % nums)

    gaps = []
    try:
        for i in range (1, 11):
            if not i in nums:
                gaps.append(i)
        minnum = min(gaps)
    except ValueError:
        return
    logging.info('next available workspace: %s' % str(minnum))
    if minnum <= 10:
        return minnum
    else:
        return


def new_workspace(move_focused=False):
    i3 = i3ipc.Connection()
    new_ws_num = find_next_ws_num(i3)
    if move_focused:
        # Move focused window to the next available workspace.
        i3.command('move window to workspace number {0}; workspace {0}'.format(
            new_ws_num))
    else:
        try:
            i3.command('workspace %d' % new_ws_num)
        except TypeError:
            return


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="""
        Jump to the next available workspace."""
                                     )
    parser.add_argument(
        '--move_focused',
        '-m',
        action='store_true',
        help="Also bring the currently focused window to this new workspace.")
    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)
    new_workspace(args.move_focused)
