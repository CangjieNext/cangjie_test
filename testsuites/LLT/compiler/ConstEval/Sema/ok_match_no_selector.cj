// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %compile_exe_opt %debugCHIROpt %cmp_opt %f -o %output | compare %f
// (DEBUG_OPTION)EXEC: %run %run_opt %output %run_args
// ASSERT: scan debug: consteval at :0:0 - :0:0 replaced initializer function `gv$_s` with initializer constant(s).
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func sign(x: Int64) {
    match {
        case x < 0 => -1
        case x == 0 => 0
        case _ => 1
    }
}

const s = sign(0)

main() {
    s
}
