// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Mod at (.*) has been set to 2
// ASSERT: regex \[ConstAnalysis\] The const value of Mod at (.*) has been set to 0
// ASSERT: regex \[ConstAnalysis\] The const value of Mod at (.*) has been set to 8
// ASSERT: regex \[ConstAnalysis\] The const value of Mod at (.*) has been set to 1

func foo() {
    var a: UInt64 = 7
    var b: UInt64 = 6
    var c = a % b
}

func goo() {
    var a: UInt32 = 17
    var b: UInt32 = 9
    var c = a % b
}

func hoo() {
    var a: UInt16 = 121
    var b: UInt16 = 11
    var c = a % b
}

func koo() {
    var a: UInt8 = 12
    var b: UInt8 = 10
    var c = a % b
}

main(): Int64 {
    0
}
