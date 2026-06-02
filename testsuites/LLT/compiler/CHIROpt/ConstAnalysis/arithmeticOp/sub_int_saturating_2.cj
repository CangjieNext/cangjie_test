// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to -128
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to -32768
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to -2147483648
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to -9223372036854775808

@OverflowSaturating
func foo() {
    var a: Int64 = -9000
    var b: Int64 = 9223372036854775800
    var c = a - b
}

@OverflowSaturating
func goo() {
    var a: Int32 = -1111
    var b: Int32 = 2147483647
    var c = a - b
}

@OverflowSaturating
func hoo() {
    var a: Int16 = -100
    var b: Int16 = 32767
    var c = a - b
}

@OverflowSaturating
func koo() {
    var a: Int8 = -100
    var b: Int8 = 127
    var c = a - b
}

main(): Int64 {
    0
}
