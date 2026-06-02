// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
/*  SCAN
goo: q
goo: 1
goo: true
*/

var x = 1
func foo(): Unit {
    func goo<T>(a: T): Unit where T <: ToString {
        println("goo: ${a}")
        if (x == 1) {
            x++
            goo<Int64>(1) 
        } else if (x == 2) {
            x++
            goo<Bool>(true)
        }
    }
    goo<Rune>(r'q')
}

main() {
    foo()
}