/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a20_01

  @Level:         1

  @Assertion:   2.1.1(20)
                    let a: UInt8 = 128
                    let b: Byte = a // ok
                    let c: Int64 = 9223372036854775807
                    let d: Int = c // ok
                    let e: UInt64 = 18446744073709551615
                    let f: UInt = e // ok

  @Description: Checks that variable declared with type Byte can be assigned by 
                variable of type UInt8;

  @Mode:        run

  @Negative:    no

  @Structure:   single

  @Issue:       0006613

*/

import utils.assert.Assert

main() {
    let a: UInt8 = 128
    let b: Byte = a // ok
    let c: Int64 = 9223372036854775807
    let d: Int = c // ok
    let e: UInt64 = 18446744073709551615
    let f: UInt = e // ok

    Assert.equals(128, b,
        reason:"""
A variable, declared with type Byte
and assigned by variable of type UInt8, has unexpected value.
""")
    Assert.equals(9223372036854775807, d,
        reason:"""
A variable, declared with type Int
and assigned by variable of type Int64, has unexpected value.
""")
    Assert.equals(18446744073709551615, f,
        reason:"""
A variable, declared with type UInt
and assigned by variable of type UInt64, has unexpected value.
""")
    0
}

