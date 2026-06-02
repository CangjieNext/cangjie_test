/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define1.cj
// EXEC: %compiler %cmp_macro define1.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args

import define.*
import std.sync.*
import std.collection.*

var count: Int64 = 0
let mtx = ReentrantMutex()

@Parallel002
func foo() {
    let list = ArrayList<Future<Unit>>()

    for (i in 0..1000) {
        let fut = spawn {
            sleep(Duration.millisecond) // sleep for 1ms.
            synchronized(mtx) {
                count++
            }
        }
        list.add(fut)
    }

    for (f in list) {
        f.get()
    }
    println("count = ${count}")
}

main() {
    foo()
}
