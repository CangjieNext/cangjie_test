/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface I0 {}

interface I1 <: I0 {}

interface I2 <: I0 {}

interface I3 <: I0 {}

class ClassA <: I1 & I2 & I3 {
    public var i: Int32 = 10
}

class ClassB <: I1 & I2 & I3 {
    public var i: Int32 = 20
}

main(): Int64 {
    var a = ClassA()
    var b = ClassB()
    let arr0: Array<I0> = [a, b]
    let arr1: Array<I1> = [a, b]
    let arr2: Array<I2> = [a, b]
    let arr3: Array<I3> = [a, b]
    let arr4: Array<Object> = [a, b]
    return 0
}
