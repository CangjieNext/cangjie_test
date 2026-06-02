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

class A<X, Y> {}

class B<X, Y> {}

class C<X, Y> where X <: A<A<B<Int32, Int32>, A<Int32, Int32>>, B<A<Int32, Int32>, B<Int32, Int32>>>,
    Y <: B<B<A<Int32, Int32>, B<Int32, Int32>>, A<B<Int32, Int32>, A<Int32, Int32>>> {}

main(): Int64 {
    return 0
}
