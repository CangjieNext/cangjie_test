// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f -o %output %enableSwitchOpt
// (DEBUG_OPTION)EXEC: %run %run_opt %output
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %f %enableSwitchOpt 2>&1 | compare %f
// ASSERT: regex switch i32 %\d+

enum E {
    R | G(Int64) | B(Rune, Object)
}

// 1 switch for first level. 1 switch for B, 1 switch for G
main() {
    var a = R
    match (a) {
        case R | G(1) => 0
        case B('c', v: ToString) =>
            v;
            2
        case B('c', v: Object) =>
            v;
            3
        case B('a', v) => 3
        case _ => 4
    }
}
