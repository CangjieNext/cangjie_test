// DEPENDENCE: %n.1 %n.2 expect1.expect expect2.expect expect3.expect
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare expect1.expect
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile %n.1 %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare expect2.expect
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpfile %n.2 %n.cj
// EXEC: %compiler %optimization_level_2 %incrementalCompile %n.cj -o %output | compare expect3.expect
// EXEC-1: %run %run_opt %output %run_args

private let a: Int32 = 1

private func foo(): Int32 {

    a
}

private func foo2(): Int32 {
    a - 1
}

main(): Int32 {
    foo()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
