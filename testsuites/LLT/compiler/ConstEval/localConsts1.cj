// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// (DEBUG_OPTION)EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_h_LOCAL_1` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_h_LOCAL_2` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_g_LOCAL_1` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_GLOBAL_2` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_2` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_3` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_5` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_GLOBAL_3` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_5` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_4` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func inc(x: Int64) {
    x + 1
}

const func dec(x: Int64) {
    x - 1
}

const GLOBAL_1 = 42
const GLOBAL_2 = inc(GLOBAL_1)
const GLOBAL_3 = inc(GLOBAL_1) + dec(GLOBAL_2) + 1

func f() {
    let x_1 = 0
    const f_LOCAL_1 = 42
    var x_2 = x_1 + f_LOCAL_1
    const f_LOCAL_2 = if (GLOBAL_2 == 43) {f_LOCAL_1 + 1} else {0}
    const f_LOCAL_3 = inc(f_LOCAL_1) + dec(f_LOCAL_2) + 1
    var x_3 = x_2 + f_LOCAL_3
    const f_LOCAL_4 = inc(f_LOCAL_1) + dec(f_LOCAL_2) + GLOBAL_3

    if (f_LOCAL_4 == 100) {
        const f_LOCAL_5 = f_LOCAL_3 + 1
        var x_4 = f_LOCAL_5 + 2
        x_3 += x_4 + 111
    } else {
        const f_LOCAL_5 = GLOBAL_3 + f_LOCAL_1 + 222
        x_2 += f_LOCAL_5
    }

    x_3 + f_LOCAL_4
}

func g() {
    const g_LOCAL_1 = dec(444)
    g_LOCAL_1
}

func h () {
    const h_LOCAL_1 = dec(111)
    const h_LOCAL_2 = h_LOCAL_1 + 1
    return h_LOCAL_1 + inc(0)
}

main () {
    println("GLOBAL_1: " + GLOBAL_1.toString())
    println("GLOBAL_2: " + GLOBAL_2.toString())
    println("GLOBAL_3: " + GLOBAL_3.toString())
    println("f(): " + f().toString())
    println("h():" + h().toString())
    println("g(): " + g().toString())
    0
}