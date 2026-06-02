/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt --module-name="ohos" %f -o %output

package base // must be base for test.

import std.sync.*

class MainThreadContext <: ThreadContext {
    public func end(): Unit {}
    public func hasEnded(): Bool {
        return false
    }
}

class A {
    static var a = MainThreadContext()
}

main(): Int64 {
    try {
        spawn (return 0) {=>}
    } catch (e: Exception) {
        e.printStackTrace()
    }
    return 1
}
// ASSERT: scan sema_mismatched_types
