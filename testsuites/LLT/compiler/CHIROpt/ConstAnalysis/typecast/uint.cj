// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %debugCHIROpt %enableCompileDebug %f -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex \[ConstAnalysis\] The const value of TypeCast at (.*) has been set to 65535
// ASSERT: regex \[ConstAnalysis\] The const value of TypeCast at (.*) has been set to 40001

func foo() {
    var u16Num: UInt16 = 65535
    var u32Num: UInt32 = 0
    u32Num = UInt32(u16Num)
    u32Num = 40001
    u16Num = UInt16(u32Num)
}

main(): Int64 {
    0
}
