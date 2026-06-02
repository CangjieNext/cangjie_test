// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_a`
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_b`
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_x` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum E {
    A | B(Int64)

    const func zero() { 0 }
}

const a = A
const b = B(0)

const func f(x: E) {
    match (x) {
        case A => x.zero()
        case B(t) => t
    }
}

const x = f(a) + f(b)

main() { x }
