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
interface X<T> where T <: Y<T> & Z<T> {}

interface Y<T> where T <: X<T> & Z<T> {}

interface Z<T> where T <: X<T> & Y<T> {}

interface C <: X<C> & Y<C> & Z<C> {}

main(): Int64 {
    return 0
}
