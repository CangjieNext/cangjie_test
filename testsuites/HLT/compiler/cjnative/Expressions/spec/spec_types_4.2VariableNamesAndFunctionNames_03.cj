/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func add(i: Int64, j: Int64): Int64 {
    return i + j;
}

func add<T>(i: T, j: T): T where T <: Add {
    return i + j;
}

main(): Int64 {
    var plus = add // error: ambiguous function 'add'
    return 0
}
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_invalid_binary_expr
