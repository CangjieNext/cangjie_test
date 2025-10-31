// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f -o %output %enableSwitchOpt
// (DEBUG_OPTION)EXEC: %run %run_opt %output
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %f %enableSwitchOpt 2>&1 | compare %f
// ASSERT: regex-1 icmp eq i32 %\d+

enum E {
    R | G | B(Int64)
}

main() {
    var a = G
    match (a) {
        case R | G => 0
        case G => 2
        case B(_) => 1
    }
}
