// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE:%compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:  scan Exception

// Test Nothing as param type in a closure and passing closure to function.
// pass (Int64)->A to (Nothing)->A
open class A {}

func fn2_cj(x: Int64) {
    A()
}

func fff(x: (Int64) -> A) { // (Int64) -> A <: (Int64) -> Any
    x(1)
    return x
}

func ggg(x: (Nothing) -> A) { // (Nothing) -> A <: (Nothing) -> Any
    x(throw Exception())
}

main() {
    fff(fn2_cj)
    ggg(fn2_cj)
    return
}
