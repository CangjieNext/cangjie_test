// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt -g --disable-reflection %n.cj 2>&1 | compare %f
// ASSERT: regex !DILocalVariable\(name: "foo", scope: !\d+, file: !\d+, line: 12, type: !(?P<num1>\d+)\)
// ASSERT: regex !(?P=num1) = !DICompositeType\(tag: DW_TAG_structure_type, name: "Array<Int64>",

main() {
    var foo = [1, 2, 3]
    return 0
}
