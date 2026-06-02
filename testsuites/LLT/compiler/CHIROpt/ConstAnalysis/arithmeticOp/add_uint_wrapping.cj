// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Add at .* has been set to 1
// ASSERT: regex \[ConstAnalysis\] The const value of Add at .* has been set to 15
// ASSERT: regex \[ConstAnalysis\] The const value of Add at .* has been set to 5
// ASSERT: regex \[ConstAnalysis\] The const value of Add at .* has been set to 8

@OverflowWrapping
func foo() {
    var a: UInt64 = 18446744073709551614
    var b: UInt64 = 10
    var c = a + b // 8
}

@OverflowWrapping
func goo() {
    var a: UInt32 = 4294967294
    var b: UInt32 = 7
    var c = a + b // 5
}

@OverflowWrapping
func hoo() {
    var a: UInt16 = 65534
    var b: UInt16 = 17
    var c = a + b // 15
}

@OverflowWrapping
func koo() {
    var a: UInt8 = 254
    var b: UInt8 = 3
    var c = a + b // 1
}

main(): Int64 {
    0
}
