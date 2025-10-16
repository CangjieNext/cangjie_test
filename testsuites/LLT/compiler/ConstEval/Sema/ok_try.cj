// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_x` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func f(x: Int64) {
    try {
        x
    } catch (_) {
        x + 1
    } finally {
        x - 1
    }
}

const x = f(0)

main() {
    x
}
