/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a08_01

  @Level:         1

  @Assertion:    1.2(8) Scenarios where the use of a newline character as a separator
                        between two tokens is prohibited are listed as follows:
			- A newline character cannot be used as a separator
                        between a unary operator and its operand.

  @Description:  No newline character as a separator between a unary operators and its operand.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
    // test case for Int8/UInt8
    var i8 : Int8  = -8
    var u8 : UInt8 = 8
    
    i8++
    i8 = -i8
    
    u8++
    
    Assert.equals(7, i8)
    Assert.equals(9, u8)
    
    // test case for Int16/UInt16
    var i16 : Int16  = -16
    var u16 : UInt16 = 16
    i16++
    i16 = -i16
    
    u16++
    
    Assert.equals(15, i16)
    Assert.equals(17, u16)
    
    // test case for Int32/UInt32
    var i32 : Int32  = -32
    var u32 : UInt32 = 32
    i32++
    i32 = -i32
    
    u32++
    
    Assert.equals(31, i32)
    Assert.equals(33, u32)
    
    // test case for Int64/UInt64
    var i64 : Int64  = -64
    var u64 : UInt64 = 64
    i64++
    i64 = -i64
    
    u64++
    
    Assert.equals(63, i64)
    Assert.equals(65, u64)
    
    // test case for Bool
    var b : Bool = true
    Assert.equals(false, !b)
}
