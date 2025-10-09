/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

import std.collection.*

main() {
    var count: Int64 = 0

    for (i in 0..100) {
        let fut = spawn {
            if (i > 50) {
              sleep(Duration.millisecond * 10000)
            }
        }
        fut.thread.name = "spawn${i}"
    }

   for (i in 0..100) {
    sleep(Duration.millisecond * 1000)
    println("sleep")
   }
}

