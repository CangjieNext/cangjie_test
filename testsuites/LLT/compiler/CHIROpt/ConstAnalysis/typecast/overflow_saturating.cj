// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of TypeCast at (.*) has been set to 255
// ASSERT: regex \[ConstAnalysis\] The const value of TypeCast at (.*) has been set to 0
// ASSERT: regex \[ConstAnalysis\] The const value of TypeCast at (.*) has been set to 127
// ASSERT: regex \[ConstAnalysis\] The const value of TypeCast at (.*) has been set to -128

@OverflowSaturating
func foo() {
    var a: Int16 = -2000
    var b: Int8 = Int8(a)
}

@OverflowSaturating
func goo() {
    var a: UInt16 = 2000
    var b: Int8 = Int8(a)
}

@OverflowSaturating
func hoo() {
    var a: Int16 = -2000
    var b: UInt8 = UInt8(a)
}

@OverflowSaturating
func koo() {
    var a: UInt16 = 2000
    var b: UInt8 = UInt8(a)
}

main(): Int64 {
    0
}
