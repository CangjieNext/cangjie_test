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
interface I0 {}

interface I1 <: I0 {}

interface I2 <: I0 {}

interface I3 <: I0 {}

class A <: I1 & I2 & I3 {}

class B <: I1 & I2 & I3 {}

main(): Int64 {
    var a = A()
    var b = B()
    let myArray0: Array<I0> = [a, b]
    let myArray1: Array<I1> = [a, b]
    let myArray2: Array<I2> = [a, b]
    let myArray3: Array<I3> = [a, b]
    return 0
}
