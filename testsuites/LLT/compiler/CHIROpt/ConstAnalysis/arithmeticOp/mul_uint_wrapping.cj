// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Mul at (.*) has been set to 14
// ASSERT: regex \[ConstAnalysis\] The const value of Mul at (.*) has been set to 37538
// ASSERT: regex \[ConstAnalysis\] The const value of Mul at (.*) has been set to 1115098112
// ASSERT: regex \[ConstAnalysis\] The const value of Mul at (.*) has been set to 4233720368547758058

@OverflowWrapping
func foo() {
    var a: UInt64 = 10446744073709551614
    var b: UInt64 = 11
    var c = a * b
}

@OverflowWrapping
func goo() {
    var a: UInt32 = 2000000000
    var b: UInt32 = 7
    var c = a * b
}

@OverflowWrapping
func hoo() {
    var a: UInt16 = 60034
    var b: UInt16 = 17
    var c = a * b
}

@OverflowWrapping
func koo() {
    var a: UInt8 = 90
    var b: UInt8 = 3
    var c = a * b
}

main(): Int64 {
    0
}
