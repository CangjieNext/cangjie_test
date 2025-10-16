// DEPENDENCE: %n.1 %n.2 expect1.expect expect2.expect
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare expect1.expect
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile %n.1 %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare expect2.expect
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.2 %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output
// EXEC-1: %run %run_opt %output %run_args

let a: Int32 = 2
let b: Int32 = 2
func foo(): Int32 {
    foo3()
    a
}

func foo2(): Int32 {
    a - 1
}

main(): Int32 {
    foo2()
}

func foo3(): Int32 {
    foo2() + b
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
