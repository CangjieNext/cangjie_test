// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

var count: Int64 = 0
let mtx: Mutex = Mutex()

main(): Int64 {
    var i: Int64 = 0
    while (i < 10) {
        i = i + 1
        spawn {
            synchronized(mtx) {
                count = count + 1
            }
        }
    }
    while (count < 10) {
        sleep(0)
    }
    synchronized(mtx) {
        print("in main, count\n")
    }
    return 0
}