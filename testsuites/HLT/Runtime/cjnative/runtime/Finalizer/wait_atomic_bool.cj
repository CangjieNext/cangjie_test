/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./the_class.cj
// EXEC: %compiler %cmp_opt %f ./the_class.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.sync.*
import std.collection.*
import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.common.*

// let done = Monitor()
let atomicFlag = AtomicBool(false)

func syncAtomicBool(): Unit {
    // atomic bool是轻量锁，所以没问题
    while (!atomicFlag.load()) {
        // 当前无法进行sleep，等价于没写sleep，所以需要测试sleep是否能够正常进行
        sleep(Duration.millisecond * 1)
    }
    // synchronized(done) {
    //     done.notifyAll()
    // }
}

main(): Unit {
    let notifier = spawn {
        sleep(Duration.second * 2)
        atomicFlag.store(true)
    }
    let c = C(syncAtomicBool)
    blackBox(c)
    println("main: trigger gc")
    gc(heavy: true)
    println("main: gc returned")
    notifier.get()
    
    // synchronized(done) {
    //     @Assert(done.wait(timeout: Duration.second * 50))
    // }
}
