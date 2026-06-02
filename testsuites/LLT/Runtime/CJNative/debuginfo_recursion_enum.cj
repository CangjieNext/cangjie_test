// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix
// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f
// ASSERT: regex-auto !DIDerivedType(tag: DW_TAG_member, name: "arg_1"
// ASSERT: regex-auto !DIDerivedType(tag: DW_TAG_member, name: "arg_2"
// ASSERT: regex-auto !DIDerivedType(tag: DW_TAG_member, name: "arg_3"

public enum test_RGBColor {
    | Red
    | Blue
    | Yellow
    | Yellow(Int8, test_RGBColor, Int64)
}

main() {
    var test_enum_1 = Yellow(1, Red, 10)
    0
}
