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
enum I<T> {
    i(Int64)
}

interface A<X> {}

interface A2 <: A<I<Int32>> {}

class B<X> <: A<X> {}

class C <: A<I<Int32>> {}

main() {
    var i: A<I<Int32>> = B<I<Int32>>()
    var j: A<I<Int32>> = C()
    var k: A2
    return 0
}
