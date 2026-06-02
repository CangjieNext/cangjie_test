# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys

# Requires at least 2 arguments.
# [0] = "generate_result.py"
# [1] = "colorize" for colorizing output text or anything else
# [2] = option name
# [3] = (optional) option alias
if len(sys.argv) < 3:
    exit(1)

colorize = True if sys.argv[1] == "colorize" else False
optionName = sys.argv[2]
optionAlias = sys.argv[3] if len(sys.argv) > 3 else None

with open("{}.txt".format(optionName), "w") as f:
    f.write("/* SCAN\n")
    warning = "[33mwarning[0m" if colorize else "warning"
    if optionAlias != None:
        optionName = "'{}' or '{}'".format(optionName, optionAlias)
    else:
        optionName = "'{}'".format(optionName)
    f.write("{}: {} is specified multiple times. The last one is chosen.\n".format(warning, optionName))
    f.write("*/\n")

exit(0)