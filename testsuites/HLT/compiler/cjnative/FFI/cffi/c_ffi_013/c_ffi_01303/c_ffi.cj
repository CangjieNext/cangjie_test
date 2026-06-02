/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c ../assert.cj
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt assert.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

foreign func nativeFun(b: CFunc<() -> Int32>): Int32

@C
func callback(): Int32 {
    makeGarbage()
    return 42
}

var global = Object()

func makeGarbage() {
    let N = 100_000_00;
    for (i in 0..N) {
        global = Object()
    }
}

main() {
    let x = unsafe {
        nativeFun(callback)
    }
    assertEquals(x, 42)
    return 0
}
