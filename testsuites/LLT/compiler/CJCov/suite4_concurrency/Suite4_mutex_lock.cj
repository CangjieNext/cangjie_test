// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件4-1: Mutex.lock/unlock → 触发 CJSimpleOpt.cpp createMutexLockStub (行433-503)
//   触发链: std.sync.Mutex.lock → CJRuntimeLowering → CJ_MCC_MutexLock → CJSimpleOpt.optCJMutexLock
//   条件: F->hasCangjieGC() && 调用 CJ_MCC_MutexLock && !CJTsanSupport
// --dy-std 必需(std.sync 在 stdx)
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage -Woff deprecated %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import std.sync.*

func lockUnlock(m: Mutex): Int64 {
    m.lock()
    m.unlock()
    return 1
}

main(): Int64 {
    let m = Mutex()
    var sum = 0
    // 多次 lock/unlock → stub 内 cmpxchg fast-path / slow-path 两条分支都走
    for (_ in 0..100) {
        sum += lockUnlock(m)
    }
    if (sum == 100) {
        return 0
    }
    return 1
}
