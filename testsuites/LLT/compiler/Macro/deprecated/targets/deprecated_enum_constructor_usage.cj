// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan enum 'Enum' is deprecated.
// ASSERT: scan enum 'Enum' is deprecated.

@Deprecated
enum Enum {
    | EnumA
    | EnumB(Bool)
}

main(): Unit {
    let _ = EnumA
    let _ = EnumB(true)
}

