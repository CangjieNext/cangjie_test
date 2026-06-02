/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a04_01

  @Level:         1
  @Assertion:       2.1.10.4(4) Member variables defined within primary constructor can only be modified with
                    visibility modifiers (i.e. public or private, leaving it out is Default), not with the static
                    modifier.

  @Description:     Check that the modifier for a primary constructor member variable is optional. Check the behavior
                    matches the default visibility, i.e. primary constructor variables are visible inside the package.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

struct S1 {
    S1(let a: Int64, let b: Int64) {}
}
struct S2 {
    S2(let a: Int64, var b: Int32) {}
}
struct S3 {
    S3(let a: Int64, let b!: UInt64) {}
}
struct S4 {
    S4(let a: Int64, var b!: UInt32) {}
}
struct S5 {
    S5(let a: Int64, let b!: Int16=1+1) {}
}
struct S6 {
    S6(let a: Int32, var b!: Int16=1+1) {}
}
struct S7 {
    S7(let a!: UInt64, let b!: Int16) {}
}
struct S8 {
    S8(let a!: UInt32, var b!: Int16=1+1) {}
}

main() {
    let s1 = S1(0, 2)
    Assert.equals(0, s1.a)
    Assert.equals(2, s1.b)

    let s2 = S2(0, 2i32)
    Assert.equals(0, s2.a)
    Assert.equals(2, s2.b)

    let s3 = S3(0, b: 2u64)
    Assert.equals(0, s3.a)
    Assert.equals(2, s3.b)

    let s4 = S4(0, b: 2u32)
    Assert.equals(0, s4.a)
    Assert.equals(2, s4.b)

    let s5 = S5(0)
    Assert.equals(0, s5.a)
    Assert.equals(2, s5.b)

    let s5v2 = S5(0, b: 2i16)
    Assert.equals(0, s5v2.a)
    Assert.equals(2, s5v2.b)

    let s6 = S6(0i32)
    Assert.equals(0, s6.a)
    Assert.equals(2, s6.b)

    let s6v2 = S6(0i32, b: 2i16)
    Assert.equals(0, s6v2.a)
    Assert.equals(2, s6v2.b)

    let s7 = S7(a: 0u64, b: 2i16)
    Assert.equals(0, s7.a)
    Assert.equals(2, s7.b)

    let s8 = S8(a: 0u32)
    Assert.equals(0, s8.a)
    Assert.equals(2, s8.b)

    let s8v2 = S8(a: 0u32, b: 2i16)
    Assert.equals(0, s8v2.a)
    Assert.equals(2, s8v2.b)
}
