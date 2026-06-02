// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// (DEBUG_OPTION)EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_LOCAL_1` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func goo() {
    42
}

const func foo (x: Int64) {
    const LOCAL_1 = goo()
    x + LOCAL_1
}

main () {
    println("foo(100): " + foo(100).toString())
    0
}