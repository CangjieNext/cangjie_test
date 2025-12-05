/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan sema_global_var_used_before_initialization

interface I<T> {}

abstract class C<T> {}

extend<T> C<T> <: I<T> where T <: I<T> {}

class D <: C<D> {}

main(): Unit {
    println("hello")
}
