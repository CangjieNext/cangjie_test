/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func a<T>(x: T): T {
    x
}

func b(input: Int32): Int64 {
    0
}

main(): Int64 {
    a ~> b
    b ~> a
    return 1
}
// ASSERT: scan sema_generic_func_without_type_arg
// ASSERT: scan sema_invalid_binary_expr
