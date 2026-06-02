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

interface Ice1 {}

interface Ice2 {}

class B<T> <: Ice1 & Ice2 where T <: Ice1 & Ice2 {
    public static var a: Int32 = 1
}

class A<T> where T <: Ice1 & Ice2 {}

extend Int32 <: Ice1 & Ice2 {}

main(): Int64 {
    let x = A<B<Int32>>()
    return 0
}
