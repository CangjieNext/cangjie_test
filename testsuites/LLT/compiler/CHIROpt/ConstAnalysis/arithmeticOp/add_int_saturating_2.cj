// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Add at .* has been set to -128
// ASSERT: regex \[ConstAnalysis\] The const value of Add at .* has been set to -32768
// ASSERT: regex \[ConstAnalysis\] The const value of Add at .* has been set to -2147483648
// ASSERT: regex \[ConstAnalysis\] The const value of Add at .* has been set to -9223372036854775808

@OverflowSaturating
func foo() {
    var a: Int64 = -9223372036854775800
    var b: Int64 = -10
    var c = a + b
}

@OverflowSaturating
func goo() {
    var a: Int32 = -2147483644
    var b: Int32 = -12
    var c = a + b
}

@OverflowSaturating
func hoo() {
    var a: Int16 = -32767
    var b: Int16 = -3
    var c = a + b
}

@OverflowSaturating
func koo() {
    var a: Int8 = -127
    var b: Int8 = -4
    var c = a + b
}

main(): Int64 {
    0
}
