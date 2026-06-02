// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Neg at .* has been set to 1111000.000000
// ASSERT: regex \[ConstAnalysis\] The const value of Neg at .* has been set to -9000.002000

func foo() {
    var a: Float64 = 9000.002
    var c = -a
}

func goo() {
    var a: Float32 = -1111e3
    var c = -a
}

main(): Int64 {
    0
}
