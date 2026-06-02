// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE:%compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// Test Nothing as param type in a closure and closure assignment.
// Assign ()->Unit to (Nothing)->Unit
func foo(a: Unit): Unit {
    println(1)
}

main() {
    let a: (Nothing) -> Unit = foo
}
