// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件8-2: 原子操作 → CJIntrinsics.cpp getAtomicOrder (cj_atomic_load/store/swap)
//   覆盖目标:
//     - llvm/lib/IR/CJIntrinsics.cpp:145-156 (getAtomicOrder switch)
//         L150 cj_atomic_load  AtomicLoad::Order
//         L152 cj_atomic_store AtomicStore::Order
//         L154 cj_atomic_swap  AtomicSwap::Order
//   触发链: AtomicInt64.load/store/swap -> @cj_atomic_load/store/swap intrinsic
// --dy-std + stdx (std.sync.AtomicInt64 在 stdx), -Woff deprecated 关掉 @Deprecated 报警
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage -Woff deprecated %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import std.sync.AtomicInt64

func atomicLoadStoreSwap(): Int64 {
    let a = AtomicInt64(10)
    // load -> cj_atomic_load
    let v1 = a.load()
    // store -> cj_atomic_store
    a.store(v1 + 1)
    // swap -> cj_atomic_swap (返回旧值)
    let old = a.swap(100)
    if (old != 11) { return 1 }
    if (a.load() != 100) { return 1 }
    return 0
}

func atomicRoundTrip(): Int64 {
    let x = AtomicInt64(0)
    // 连续 store 多次确保 intrinsic 实例化多次,降低内联剪枝风险
    var sum: Int64 = 0
    for (i in 0..8) {
        x.store(i)
        sum += x.load()
        let _ = x.swap(sum)
    }
    return x.load()
}

main(): Int64 {
    let r1 = atomicLoadStoreSwap()
    if (r1 != 0) { return 1 }
    let r2 = atomicRoundTrip()
    if (r2 < 0) { return 1 }
    return 0
}
