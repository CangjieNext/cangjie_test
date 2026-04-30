/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
import std.collection.ArrayList

var count: Int64 = 0

main(): Int64 {

    var thread_list = ArrayList<Future<Unit>>()
    var maxCoroutineNumber = 50

    for (i in 0..(maxCoroutineNumber-1)) {
        let fut = spawn {
            while (true) {
                let s1 = 'Hello Cangjie Lang'
                let tuple1 = (8, false)
                var a: Array<Int64> = [0, 0, 0, 0]
                let r1 = Range<Int64>(0, 10, 1, true, true, true)
                sleep(Duration.second)
            }
        }
        thread_list.add(fut)
    }
    print("${thread_list.size}\n")
    return 0
}
