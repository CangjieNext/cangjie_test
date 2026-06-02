/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt --module-name="ohos" %f -o %output

package base

open class MainThreadContext <: ThreadContext {
    public open func end(): Unit {}
    public open func hasEnded(): Bool {
        return false
    }
}

class MainThreadContextChild <: MainThreadContext {
    public func end(): Unit {}
    public func hasEnded(): Bool {
        return false
    }
}

class A {}

main(): Int64 {
    var tc = MainThreadContextChild()
    let fut = spawn (tc) {}
    return 0
}
// ASSERT: scan sema_inherit_thread_context_not_open
// ASSERT: scan sema_spawn_arg_invalid
