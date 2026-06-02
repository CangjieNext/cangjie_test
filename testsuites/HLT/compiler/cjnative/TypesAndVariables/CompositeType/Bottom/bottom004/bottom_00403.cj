/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test(): Int64 {
    throw throw Exception() // EXPECT:regex the object thrown must derive from `core.
}

main(): Int64 {
    test()
    return 0
}
// ASSERT: scan sema_throw_expr_with_wrong_type
