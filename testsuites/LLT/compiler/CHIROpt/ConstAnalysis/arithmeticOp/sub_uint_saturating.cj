// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 0
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 0
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 0
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at (.*) has been set to 0

@OverflowSaturating
func foo() {
    var a: UInt64 = 9000
    var b: UInt64 = 10000
    var c = a - b
}

@OverflowSaturating
func goo() {
    var a: UInt32 = 1111
    var b: UInt32 = 2222
    var c = a - b
}

@OverflowSaturating
func hoo() {
    var a: UInt16 = 11111
    var b: UInt16 = 60000
    var c = a - b
}

@OverflowSaturating
func koo() {
    var a: UInt8 = 200
    var b: UInt8 = 240
    var c = a - b
}

main(): Int64 {
    0
}
