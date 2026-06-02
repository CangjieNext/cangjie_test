/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan IllegalSynchronizationStateException: Read-Lock is not locked by current thread

import std.sync.{ReentrantReadWriteMutex, ReadWriteMutexMode}

main(): Int64 {
    let x: Int64 = 0
    let rwm = ReentrantReadWriteMutex(mode: Fair)

    let res1 = spawn {
        rwm.readMutex.unlock()
    }.get()
    return 0
}
