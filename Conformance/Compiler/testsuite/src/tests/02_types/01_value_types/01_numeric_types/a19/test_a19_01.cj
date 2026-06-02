/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a19_01

  @Level:         1

  @Assertion:   2.1.1(19) For ease of use, the Cangjie programming language provides some type aliases
                in particular (For details about type aliases, see the Type Alias section below.):
                1. A Byte type as a type alias of UInt8, and Byte is completely equivalent to UInt8.
                2. Int/UInt type as type alias of Int64/UInt64. Int is completely equivalent to Int64,
                UInt is completely equivalent to UInt64.)

  @Description: Checks that variable declared with type Byte actually has type Byte,
                that is the same as UInt8 type, and can be assigned by positive value and zero;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

main() {
    //Test case 1
    let byteVar01: Byte = 128;
    Assert.equals(true, byteVar01 is Byte, 
        reason: """
Test case 1: A variable, declared with type Byte
and assigned by positive integer value, has type
different from Byte type.
""");

    //Test case 2
    Assert.equals(true, byteVar01 is UInt8, 
        reason: """
Test case 1: A variable, declared with type Byte (alias of UInt8)
and assigned by positive integer value, has type
different from UInt8 type.
""");

    //Test case 3
    Assert.equals(128, byteVar01, 
        reason: """
Test case 3: A variable, declared with type Byte
and assigned by positive integer value, has unexpected value.
""");

    //Test case 4
    let byteVar02: Byte = 0;
    Assert.equals(true, byteVar02 is Byte, 
        reason: """
Test case 4: A variable, declared with type Byte
and assigned by zero, has type different from Byte.
""");

    //Test case 5
    Assert.equals(true, byteVar02 is UInt8, 
        reason: """
Test case 5: A variable, declared with type Byte (alias of UInt8)
and assigned by zero, has type different from UInt8.
""");

    //Test case 6
    Assert.equals(0, byteVar02, 
        reason: """
Test case 6: A variable, declared with type Byte
and assigned by zero, has unexpected value.
""");

    return 0
}

