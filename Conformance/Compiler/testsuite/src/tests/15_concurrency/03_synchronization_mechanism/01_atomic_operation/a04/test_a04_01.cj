/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_01_a04_01

  @Level:         1
  @Assertion:    15.3.1(4) Cangjie provides atomic operations for integer types
                 (including Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32,
                 UInt64), Boolean type (Bool), and reference type.

  @Description:  Checks that all Atomic classes are avilable

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../helper.cj

  @Issue:        0006220

*/

import std.sync.*  // Multithreading
import utils.assert.Assert

main(): Int64 {
    // signed
    let v1 = Int8(-99)
    let a1 = AtomicInt8(v1)
    Assert.equals(v1, a1.load())

    let v2 = Int16(-66)
    let a2 = AtomicInt16(v2)
    Assert.equals(v2, a2.load())

    let v3 = Int32(-9999)
    let a3 = AtomicInt32(v3)
    Assert.equals(v3, a3.load())

    let v4 = Int64(-6666)
    let a4 = AtomicInt64(v4)
    Assert.equals(v4, a4.load())

    // unsigned
    let v5 = UInt8(99)
    let a5 = AtomicUInt8(v5)
    Assert.equals(v5, a5.load())

    let v6 = UInt16(66)
    let a6 = AtomicUInt16(v6)
    Assert.equals(v6, a6.load())

    let v7 = UInt32(9999)
    let a7 = AtomicUInt32(v7)
    Assert.equals(v7, a7.load())

    let v8 = UInt64(6666)
    let a8 = AtomicUInt64(v8)
    Assert.equals(v8, a8.load())

    // bool
    let v9 = true
    let a9 = AtomicBool(v9)
    Assert.equals(v9, a9.load())

    // reference
    let v10 = MyClass(2)
    let a10 = AtomicReference<MyClass>(v10)
    Assert.equals(v10, a10.load())

    let v11 = Option<MyClass>.Some(MyClass(9543))
    let a11 = AtomicOptionReference<MyClass>(v11)
    Assert.equals(v11, a11.load())

    return 0
}
