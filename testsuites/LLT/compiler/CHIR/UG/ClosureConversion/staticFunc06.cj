// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
/* SCAN
1
1
1
*/

var cnt = 1

interface I1 {
    static func sf(): Unit {
        func inner1() {
            if (cnt < 3) {
                cnt++
                sf()
            }
        }
        func inner2() {
            inner1()
        }
        inner2()
        println(1)
    }
}

func test<T>() where T <: I1 {
    T.sf()
}

main() {
    test<I1>()
    0
}
