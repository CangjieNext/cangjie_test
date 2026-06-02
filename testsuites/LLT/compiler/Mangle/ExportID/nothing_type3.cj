// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE:%compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// Test possible expressions of Nothing type pass to a function.
// Could be throw or return.
func fn1_cj(a: Nothing) {
    println("fn1_cj")
    throw Exception("Exception fn1_cj")
}

func fn2_cj(a: Nothing) {
    println("fn2_cj")
    throw Exception("Exception fn2_cj")
}

func call(f: (Nothing) -> String, a: Nothing) {
    f(a)
}

var context: Context = Context()

class Context {
    init() {
        println("init")
        try {
            call(fn1_cj, throw Exception())
        } catch (e: Exception) {
            println("fn1")
            call(fn2_cj, return)
        }
    }
}

main() {
    println("fn2")
    return 0
}
