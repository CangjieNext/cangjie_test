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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Exception

import std.core

foreign func nativeFun(b: CFunc<(Int32, Int32, Int32, Int32, Int32, Int32, Int32, Int32) -> Int32>, r0: Int32,
    r1: Int32, r2: Int32, r3: Int32, r4: Int32, r5: Int32, r6: Int32, r7: Int32): Int32

@C
func callback(r0: Int32, r1: Int32, r2: Int32, r3: Int32, r4: Int32, r5: Int32, r6: Int32, r7: Int32) {
    println("args: ${r0}, ${r1}, ${r2}, ${r3}, ${r4}, ${r5}, ${r6}, ${r7}")
    assertEquals(r0, 4)
    assertEquals(r1, 8)
    assertEquals(r2, 15)
    assertEquals(r3, 16)
    assertEquals(r4, 23)
    assertEquals(r5, 42)
    assertEquals(r6, 108)
    assertEquals(r7, -1)
    core.Exception().printStackTrace()
    return r0 + r1 + r2 + r3 + r4 + r5
}

main() {
    let x = unsafe {
        nativeFun(callback, 4, 8, 15, 16, 23, 42, 108, -1)
    }
    assertEquals(x, 108)
    return 0
}
