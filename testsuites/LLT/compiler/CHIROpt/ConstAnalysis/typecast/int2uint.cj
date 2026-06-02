// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of TypeCast at (.*) has been set to 127
// ASSERT: regex \[ConstAnalysis\] The const value of TypeCast at (.*) has been set to 100

func foo() {
    var i8Num: Int8 = 127
    var u8Num: UInt8 = 0
    u8Num = UInt8(i8Num) // ok: u8Num = 127
    u8Num = 100
    i8Num = Int8(u8Num) // ok: i8Num = 100
}

main(): Int64 {
    0
}
