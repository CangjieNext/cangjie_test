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
                let a = C1()
                let b = a.test()
                sleep(Duration.second)
            }
        }
        thread_list.add(fut)
    }
    print("${thread_list.size}\n")
    return 0
}

interface I1 {
    func test(){
        let height = 20
        let tuple1 = (8, false)
        let r1 = Range<Int64>(0, 10, 1, true, true, true)
        0
    }
}

class C1 <: I1{}