/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
import std.collection.*

var count: Int64 = 0

main(): Int64 {

    var thread_list = ArrayList<Future<Unit>>()
    var maxCoroutineNumber = 50

    for (i in 0..(maxCoroutineNumber-1)) {
        let fut = spawn {
            while (true) {
                let a = E1<Int32>.A(1,2)
                let b = E1<String>.B("gg")
                let c = a.test(1)
                sleep(Duration.second)
            }
        }
        thread_list.add(fut)
    }
    print("${thread_list.size}\n")
    return 0
}

enum E1<T> {
    A(T,T) | B(T)
    func test(a:T) {
        1
    }
}
