// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Div at (.*) has been set to 2
// ASSERT: regex \[ConstAnalysis\] The const value of Div at (.*) has been set to -2

func foo() {
    var a: Int16 = 7
    var b: Int16 = -3
    var c = a / b // -2
}

func goo() {
    var a: Int8 = -7
    var b: Int8 = -3
    var c = a / b // 2
}

main(): Int64 {
    0
}
