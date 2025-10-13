// DEPENDENCE: %n.txt expect1.expect expect2.expect
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.txt %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare expect1.expect
// EXEC: %run %run_opt %output %run_args | compare expect2.expect

func foo(): Unit {
    println(0)
}

class A<T> {
    static init() {
        foo()
    }
}

main(): Int32 {
    var a = A<Int8>()
    var b = A<Int32>()
    0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
