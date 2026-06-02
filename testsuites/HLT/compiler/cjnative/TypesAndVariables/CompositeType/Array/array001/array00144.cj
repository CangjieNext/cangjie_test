/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
open class C0 {}

open class C1 <: C0 {}

open class C2 <: C1 {}

open class C3 <: C1 {}

class A <: C2 {}

class B <: C3 {}

main(): Int64 {
    var a = A()
    var b = B()
    let myArray0: Array<C0> = [a, b]
    let myArray1: Array<C1> = [a, b]
    return 0
}
