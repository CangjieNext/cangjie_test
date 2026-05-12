/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.posix.*

main() {
    var fd = `open`("regression_testcase_0006_0001.cj", O_RDWR)
    var str1 = unsafe { LibC.mallocCString("    ") }
    var buf = str1.getChars()
    var readNum = unsafe { read(fd, buf, 4) }
    unsafe { LibC.free(str1) }
    if (readNum == 4) {
        return 0
    } else {
        return 1
    }
}
