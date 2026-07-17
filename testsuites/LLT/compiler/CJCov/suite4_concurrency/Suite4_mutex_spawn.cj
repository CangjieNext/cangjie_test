// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 套件4-2: spawn 多线程争用 Mutex → 触发 createMutexLockStub 的 slow-path (cmpxchg 失败走 CJ_MCC_MutexLockSlowPath)
//   单线程 cmpxchg 总成功(BB1 fast-path); 多线程争用会失败(BB2 slow-path)
//   同时 spawn 覆盖 CJFillMetadata Future 属性分支 + ReentrantMutex 属性分支
// EXEC: %compiler %cmp_opt %import-cangjie-stdx --dy-std --coverage -Woff deprecated %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import std.sync.*
import std.collection.*

let gCounter = ReentrantMutex()
let gList = ArrayList<Int64>([])

func worker(id: Int64): Int64 {
    for (i in 0..1000) {
        gCounter.lock()
        gList.add(id * 1000 + i)
        gCounter.unlock()
    }
    return id
}

main(): Int64 {
    let futures = ArrayList<Future<Int64>>([])
    for (id in 0..4) {
        futures.add(spawn { worker(id) })
    }
    var sum = 0
    for (f in futures) {
        sum += f.get()
    }
    // gList 应有 4*1000=4000 个元素
    if (gList.size == 4000) {
        return 0
    }
    return 1
}
