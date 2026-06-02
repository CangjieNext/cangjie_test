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
class I {}

interface A<X> {}

interface A2 <: A<I> {}

class B<X> <: A<X> {}

class C <: A<I> {}

main() {
    var i: A<I> = B<I>()
    var j: A<I> = C()
    var k: A2
    return 0
}
