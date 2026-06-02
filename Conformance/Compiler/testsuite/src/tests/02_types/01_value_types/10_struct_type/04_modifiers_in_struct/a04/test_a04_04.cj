/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a04_04

  @Level:         1
  @Assertion:       2.1.10.4(4) Member variables defined within primary constructor can only be modified with
                    visibility modifiers (i.e. public or private, leaving it out is Default), not with the static
                    modifier.

  @Description:     Check that "private" can be a modifier of a member variable of the primary constructor. Check the
                    behavior matches the private visibility.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

struct S1 {
    S1(private let a: Int64, private let b: Int64) {}
    func test() {
        Assert.equals(0, a)
        Assert.equals(2, b)
    }
}
struct S2 {
    S2(private let a: Int64, private var b: Int32) {}
    func test() {
        Assert.equals(0, a)
        Assert.equals(2, b)
    }
}
struct S3 {
    S3(private let a: Int64, private let b!: UInt64) {}
    func test() {
        Assert.equals(0, a)
        Assert.equals(2, b)
    }
}
struct S4 {
    S4(private let a: Int64, private var b!: UInt32) {}
    func test() {
        Assert.equals(0, a)
        Assert.equals(2, b)
    }
}
struct S5 {
    S5(private let a: Int64, private let b!: Int16=1+1) {}
    func test() {
        Assert.equals(0, a)
        Assert.equals(2, b)
    }
}
struct S6 {
    S6(private let a: Int32, private var b!: Int16=1+1) {}
    func test() {
        Assert.equals(0, a)
        Assert.equals(2, b)
    }
}
struct S7 {
    S7(private let a!: UInt64, private let b!: Int16) {}
    func test() {
        Assert.equals(0, a)
        Assert.equals(2, b)
    }
}
struct S8 {
    S8(private let a!: UInt32, private var b!: Int16=1+1) {}
    func test() {
        Assert.equals(0, a)
        Assert.equals(2, b)
    }
}

main() {
    S1(0, 2).test()
    S2(0, 2i32).test()
    S3(0, b: 2u64).test()
    S4(0, b: 2u32).test()
    S5(0).test()
    S5(0, b: 2i16).test()
    S6(0i32).test()
    S6(0i32, b: 2i16).test()
    S7(a: 0u64, b: 2i16).test()
    S8(a: 0u32).test()
    S8(a: 0u32, b: 2i16).test()
}
