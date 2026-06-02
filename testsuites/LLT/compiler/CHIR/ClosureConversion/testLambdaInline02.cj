// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %f %enableO2

var a: Int64 = 1
main() {
    func foo(): Unit {
        println(222)
        if (a == 2) {
            func goo1(): Unit {
                foo()
            }
            goo1()
        } else {
            func goo2(): Unit {
                goo2()
            }
        }
    }
    println(111)
}