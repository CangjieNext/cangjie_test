// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix
// ASSERT: regex \[ConstAnalysis\] The const value of Div at .* has been set to -128
// ASSERT: regex \[ConstAnalysis\] The const value of Div at .* has been set to -32768
// ASSERT: regex \[ConstAnalysis\] The const value of Div at .* has been set to -2147483648
// ASSERT: regex \[ConstAnalysis\] The const value of Div at .* has been set to -9223372036854775808

@OverflowWrapping
func foo() {
    var a: Int64 = -9223372036854775808
    var c = a / -1
}

@OverflowWrapping
func goo() {
    var a: Int32 = -2147483648
    var c = a / -1
}

@OverflowWrapping
func hoo() {
    var a: Int16 = -32768
    var c = a / -1
}

@OverflowWrapping
func koo() {
    var a: Int8 = -128
    var c = a / -1
}

main(): Int64 {
    0
}
