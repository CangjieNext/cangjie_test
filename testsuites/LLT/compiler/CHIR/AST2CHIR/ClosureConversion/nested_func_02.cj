// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output | compare %f

func foo1() {
    var a = 1
    let b = 3
    func goo1(c: Int64) {
        println(b + c)
    }
    var x = goo1
    x(a + 10)
    var y = goo1
    return x
}

main() {
    foo1()(0)
}

/* SCAN
14
3
*/
