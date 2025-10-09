// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.expect.out
// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args 2>&1 > %n.real.out
// (DEBUG_OPTION)EXEC: %diff %n.expect.out %n.real.out
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_GLOBAL_2` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const GLOBAL_1 = 42
const GLOBAL_2 = {x:Int64 => const LOCAL_1 = 111; x + LOCAL_1 }(9)
const GLOBAL_3 = 1

main () {
    println("GLOBAL_1: " + GLOBAL_1.toString())
    println("GLOBAL_2: " + GLOBAL_2.toString())
    println("GLOBAL_3: " + GLOBAL_3.toString())
    0
}