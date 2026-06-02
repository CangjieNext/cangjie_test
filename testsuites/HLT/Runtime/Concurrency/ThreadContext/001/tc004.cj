/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan call hasEnded!
// ASSERT: scan An exception has occurred
// ASSERT: scan SpawnException
// ASSERT: scan main

package ohos.base // must be ohos.base for test.

import std.sync.*
import std.time.*

var flag = false

class MainThreadContext <: ThreadContext {
    public func end(): Unit {}
    public func hasEnded(): Bool {
        if (flag) {
            throw Exception()
        }
        flag = true
        println("call hasEnded!")
        return true
    }
    func getSchedulerHandle(): CPointer<Unit> {
        if (hasEnded()) {
            throw SpawnException()
        }
        CPointer<Unit>()
    }
}

main(): Int64 {
    var tc = MainThreadContext()
    try {
        spawn (tc) {}
    } catch (e: Exception) {
        if (!flag) {
            throw Exception()
        }
        sleep(Duration.second);
        e.printStackTrace()
    }
    return 0
}
