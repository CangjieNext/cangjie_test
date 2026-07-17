// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件2-2: 原子操作屏障 → 触发 CJBarrierLowering.cpp cj_atomic_store/swap/compare_swap 分支
//   常量 ordering 分支 vs 非常量 ordering 分支
//   触发: std.sync 的 AtomicInt64/AtomicBool 的 store/swap/compareExchange
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage -Woff unused %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import std.sync.*
import std.collection.*

func atomicOps(n: Int64): Int64 {
    let counter = AtomicInt64(0)
    let flag = AtomicBool(false)
    var s = 0
    for (i in 0..n) {
        counter.store(i)                       // cj_atomic_store
        let old = counter.swap(i + 1)          // cj_atomic_swap
        s += old
        let ok = counter.compareAndSwap(i + 2, i + 1)  // cj_atomic_compare_swap
        if (ok) { s += 1 }
        flag.store(i % 2 == 0)
    }
    return s + counter.load()
}

func barrierInLoop(n: Int64): Int64 {
    let a = AtomicInt64(0)
    let b = AtomicInt64(0)
    var s = 0
    for (i in 0..n) {
        a.store(i)
        b.store(i * 2)
        s += a.load() + b.load()              // 连续原子操作 → 屏障合并优化
    }
    return s
}

main(): Int64 {
    var s = 0
    s += atomicOps(100)
    s += barrierInLoop(100)
    if (s > 0) { return 0 }
    return 1
}
