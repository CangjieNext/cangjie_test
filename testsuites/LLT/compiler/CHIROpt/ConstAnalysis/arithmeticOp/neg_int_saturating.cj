// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Neg at (.*) has been set to 127
// ASSERT: regex \[ConstAnalysis\] The const value of Neg at (.*) has been set to 32767
// ASSERT: regex \[ConstAnalysis\] The const value of Neg at (.*) has been set to 2147483647
// ASSERT: regex \[ConstAnalysis\] The const value of Neg at (.*) has been set to 9223372036854775807

@OverflowSaturating
func foo() {
    var a: Int64 = -9223372036854775808
    var c = -a
}

@OverflowSaturating
func goo() {
    var a: Int32 = -2147483648
    var c = -a
}

@OverflowSaturating
func hoo() {
    var a: Int16 = -32768
    var c = -a
}

@OverflowSaturating
func koo() {
    var a: Int8 = -128
    var c = -a
}

main(): Int64 {
    0
}
