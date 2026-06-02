# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

# 253 characters in filename
testfilename = "1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890.cj"

with open(testfilename, "w+") as f:
    f.write("main() {return 0}")

with open("test.bat", "w+") as f:
    f.write("cjc.exe {}".format(testfilename))