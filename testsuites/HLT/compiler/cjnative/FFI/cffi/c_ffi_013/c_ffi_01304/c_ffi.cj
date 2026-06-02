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

foreign func nativeFun(b: CFunc<() -> Int64>): Int64

@C
func callback(): Int64 {
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

class Box {
    let x: Int64
    init(x: Int64) {
        this.x = x
    }
}

main() {
    let r1 = Box(1)
    global = r1
    let r2 = Box(2)
    global = r2
    let r3 = Box(3)
    global = r3
    let r4 = Box(4)
    global = r4
    let r5 = Box(5)
    global = r5
    let r6 = Box(6)
    global = r6
    let r7 = Box(7)
    global = r7
    let r8 = Box(8)
    global = r8
    let r9 = Box(9)
    global = r9
    let r10 = Box(10)
    global = r10
    let r11 = Box(11)
    global = r11
    let r12 = Box(12)
    global = r12
    let r13 = Box(13)
    global = r13
    let r14 = Box(14)
    global = r14
    let r15 = Box(15)
    global = r15
    let r16 = Box(16)
    global = r16
    let r17 = Box(17)
    global = r17
    let r18 = Box(18)
    global = r18

    let x = unsafe {
        nativeFun(callback)
    }

    let result = x + r1.x + r2.x + r3.x + r4.x + r5.x + r6.x + r7.x + r8.x + r9.x + r10.x + r11.x + r12.x + r13.x + r14
        .x + r15.x + r16.x + r17.x + r18.x
    assertEquals(result, 213)
    return 0
}
