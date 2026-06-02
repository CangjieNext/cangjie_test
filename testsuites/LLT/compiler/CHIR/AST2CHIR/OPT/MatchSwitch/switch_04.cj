// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f -o %output %enableSwitchOpt
// (DEBUG_OPTION)EXEC-1: %run %run_opt %output
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %f %enableSwitchOpt 2>&1 | compare %f
// ASSERT: regex-1 switch i32 %\d+

enum E {
    R | G(Int64) | B
}

main() {
    var a = B
    match (a) {
        case R => 0
        case B => 1
        case _ => 2
    }
}
