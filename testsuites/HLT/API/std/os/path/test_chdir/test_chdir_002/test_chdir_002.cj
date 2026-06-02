/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass

import std.posix.*

foreign func printf(fmt: CString, ...): Int32

main() {
    var newpath: String = "abaabaaba"
    var result: Int32 = chdir(newpath)

    if (result == -1) {
        print("pass")
    }

    return 0
}
