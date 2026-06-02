/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1:%compiler %cmp_opt  %f -o %output 2>&1 | compare %f

import std.sync.*

main(): Int64 {
    let test = AtomicInt8(1)
    test.store(0)

    let thread: Future<Unit> = spawn {
        test.store(-129)
    }

    test.store(128)

    return 0
}
// ASSERT: scan sema_exceed_num_value_range
