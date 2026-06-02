/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface A {}

interface B {}

class C <: A & B & X<C> & Y<C> {}

interface X<T> where T <: A {}

interface Y<T> where T <: B {}

class Z<T> where T <: X<T> & Y<T> {}

main(): Int64 {
    Z<C>()
    return 0
}
