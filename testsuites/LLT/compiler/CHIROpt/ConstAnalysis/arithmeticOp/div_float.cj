// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Div at .* has been set to -0.500000
// ASSERT: regex \[ConstAnalysis\] The const value of Div at .* has been set to 6.000000

func foo() {
    var a: Float64 = 6.6
    var b: Float64 = 1.1
    var c = a / b
}

func goo() {
    var a: Float32 = 1111.00
    var b: Float32 = -2222.000
    var c = a / b
}

main(): Int64 {
    0
}
