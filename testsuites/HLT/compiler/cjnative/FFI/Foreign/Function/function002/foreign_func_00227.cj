/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

@C
enum A<T> {
    a(Int64)
}

foreign func foo(a: A<Int64>): A<Int64>

foreign func bar(a: A<Int64>): A<Int64>
// ASSERT: scan sema_illegal_use_of_annotation
// ASSERT: scan sema_enum_pattern_func_cty_error
// ASSERT: scan sema_invalid_cfunc_arg_type
// ASSERT: scan sema_invalid_cfunc_return_type
