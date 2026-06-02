// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 2000

func foo() {
    var flag = true
    var a: UInt64 = if (flag) {
        9000
    } else {
        3000
    }
    var b: UInt64 = 7000
    var c = a - b
}

main(): Int64 {
    0
}
