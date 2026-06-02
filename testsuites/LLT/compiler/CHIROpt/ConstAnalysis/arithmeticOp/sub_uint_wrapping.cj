// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at .* has been set to 4
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at .* has been set to 23
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at .* has been set to 13
// ASSERT: regex \[ConstAnalysis\] The const value of Sub at .* has been set to 36

@OverflowWrapping
func foo() {
    var a: UInt64 = 30
    var b: UInt64 = 18446744073709551610
    var c = a - b // 36
}

@OverflowWrapping
func goo() {
    var a: UInt32 = 10
    var b: UInt32 = 4294967293
    var c = a - b // 13
}

@OverflowWrapping
func hoo() {
    var a: UInt16 = 17
    var b: UInt16 = 65530
    var c = a - b // 23
}

@OverflowWrapping
func koo() {
    var a: UInt8 = 3
    var b: UInt8 = 255
    var c = a - b // 4
}

main(): Int64 {
    0
}
