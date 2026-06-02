/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_extend_duplicate_interface

interface I {}

class A<T> {}

extend<T> A<(T, Int64)> <: I {}

extend<T> A<Option<T>> <: I {}

main(): Int64 {
    0
}
