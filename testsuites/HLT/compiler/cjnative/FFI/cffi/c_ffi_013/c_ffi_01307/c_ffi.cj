/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*

foreign func nativeFun(): Unit

foreign func setReady(): Unit

var global = Object()

func makeGarbage() {
    let N = 100_000_00;
    for (i in 0..N) {
        global = Object()
    }
}

main() {
    let fut: Future<Int64> = spawn {
        unsafe {
            nativeFun()
        }
        42
    }
    println("start garbaging")
    makeGarbage()
    println("done garbaging")

    unsafe {
        setReady()
    }

    fut.get()
    println("done with native fun")
    GC()
    return 0
}
