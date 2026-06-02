// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 evaluated initializer function `gv$_s` of 6 expressions to one of 5 expressions.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

struct S {
    var x: Int64
    const init(x: Int64) {
        this.x = x
        this.x++
    }
}

main() {
    const s = S(-1)
    s.x
}
