// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args 2>&1
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_x`
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func f(x: Int64) {
    if (x < 0) {
        "negative"
    } else if (x == 0) {
        "zero"
    } else {
        return "positive"
    }
}

const x = f(0)

main() {
    println(x)
    0
}
