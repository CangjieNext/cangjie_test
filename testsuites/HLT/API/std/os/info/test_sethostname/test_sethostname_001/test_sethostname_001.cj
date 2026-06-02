/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not Windows) EXEC-PIPE: %compiler %cmp_opt %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not Windows) ASSERT: scan pass

import std.posix.*

foreign func printf(fmt: CString, ...): Int32

main() {
    var name: String = "host123"
    var result: Int32 = sethostname(name)
    if (result == 0 || result == -1) {
        print("pass\n")
    }
    return 0
}
