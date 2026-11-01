/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

let lockA: Mutex = Mutex()
let lockB: Mutex = Mutex()

func transfer1(): Unit {
    synchronized(lockA) {
        synchronized(lockB) {
            println("t1")
        }
    }
}

func transfer2(): Unit {
    synchronized(lockB) {
        synchronized(lockA) {
            println("t2")
        }
    }
}

main() {
    transfer1()
    transfer2()
}
