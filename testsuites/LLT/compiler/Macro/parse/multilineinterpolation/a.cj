// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj a.expect
// EXEC: %compiler define.cj --compile-macro
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %run_args %output > a.t
// EXEC: %diff a.t a.expect

import std.ast.*
import define.*

@M
func A() {
    let declType = "func"
    let p = '''
        \"\"\"
        0000    Files XXX
        \"\"\"
        ${declType}
        '''
    println(p)
    println("-------------------------------------------")
    let q = """
        '''
        1111    Files XXX
        '''
        ${declType}
        """
    println(q)
    println("this line should be good: ${my("nono")}")
}

func my(a: String) {
    a.size
}

main() {
    A()
    0
}
