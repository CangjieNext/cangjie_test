// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Mul at (.*) has been set to 90
// ASSERT: regex \[ConstAnalysis\] The const value of Mul at (.*) has been set to 6660
// ASSERT: regex \[ConstAnalysis\] The const value of Mul at (.*) has been set to -244420
// ASSERT: regex \[ConstAnalysis\] The const value of Mul at (.*) has been set to 63000000

func foo() {
    var a: Int64 = 9000
    var b: Int64 = 7000
    var c = a * b
}

func goo() {
    var a: Int32 = -11110
    var b: Int32 = 22
    var c = a * b
}

func hoo() {
    var a: Int16 = -111
    var b: Int16 = -60
    var c = a * b
}

func koo() {
    var a: Int8 = 30
    var b: Int8 = 3
    var c = a * b
}

main(): Int64 {
    0
}
