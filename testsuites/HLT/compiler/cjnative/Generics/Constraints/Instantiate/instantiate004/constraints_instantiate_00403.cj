/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {}

interface B {}

interface X<T> where T <: A {}

interface Y<T> where T <: B {}

class Z <: X<A> & Y<B> {} // Z is not A,B`s child type.

class C<T> where T <: X<T> & Y<T> {}

main(): Int64 {
    C<Z>()
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
