/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func a(input: Int64): Int64 {
    0
}

func b(input: Int32): Int32 {
    0
}

main(): Int64 {
    a ~> b
    b ~> a
    return 1
}
// ASSERT: scan sema_invalid_binary_expr
