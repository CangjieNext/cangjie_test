/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
main(): Int64 {
    var count: Int64 = 0
    var thread_list = ArrayList<Future<Unit>>()

    for (i in 0..102) {
        let fut = spawn {
            print("thread.\n")
        }
        thread_list.add(fut)
    }
    // Wait for all threads finished.
    for (f in thread_list) {
        f.get()
    }
    print("count = ${count}\n")
    var test_con = 2
    return 0
}
