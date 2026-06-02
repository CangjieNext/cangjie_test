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

foreign func nativeFun(
    b: CFunc<(Float64, Float64, Float64, Float64, Float64, Float64, Float64, Float64, Float64, Float64) -> Float64>): Float64

@C
func callback(r0: Float64, r1: Float64, r2: Float64, r3: Float64, r4: Float64, r5: Float64, r6: Float64, r7: Float64,
    r8: Float64, r9: Float64) {
    println("args: ${r0}, ${r1}, ${r2}, ${r3}, ${r4}, ${r5}, ${r6}, ${r7}, ${r8}, ${r9}")
    assertEquals(r0, 4.0)
    assertEquals(r1, 8.0)
    assertEquals(r2, 15.0)
    assertEquals(r3, 16.0)
    assertEquals(r4, 23.0)
    assertEquals(r5, 42.0)
    assertEquals(r6, 108.0)
    assertEquals(r7, -1.0)
    assertEquals(r8, 37.0)
    assertEquals(r9, 3.14159265)
    return r0 + r1 + r2 + r3 + r4 + r5 + r6 + r7 + r8 + r9
}

main() {
    let x = unsafe {
        nativeFun(callback)
    }
    assertEquals(x, 255.14159265)
    return 0
}
