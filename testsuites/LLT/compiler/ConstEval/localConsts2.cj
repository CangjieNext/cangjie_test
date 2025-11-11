// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// (DEBUG_OPTION)EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_4` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_3` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_4` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_5` with initializer constant(s).
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_f_LOCAL_2` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public const func inc(x: Int64) {
    x + 1
}

public const func dec(x: Int64) {
    x - 1
}

func f() {
    const f_LOCAL_1 = 42
    const f_LOCAL_2 = if (inc(f_LOCAL_1) == 43) {f_LOCAL_1} else {0}
    const f_LOCAL_3 = inc(f_LOCAL_1)
    var x = 42

    if (f_LOCAL_3 == 100) {
        const f_LOCAL_4 = f_LOCAL_1 + 222
        while(true) {
            const f_LOCAL_5 = f_LOCAL_4 + f_LOCAL_3
        }
    } else {
        const f_LOCAL_4 = f_LOCAL_3 + 1
        x += f_LOCAL_4
    }
    x
}

main () {
    println("f(): " + f().toString())
    println("inc(100): " + inc(100).toString())
    println("dec(100): " + dec(100).toString())
    f() - 86
}