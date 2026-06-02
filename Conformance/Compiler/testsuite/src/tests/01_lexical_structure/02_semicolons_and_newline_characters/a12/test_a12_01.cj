/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            01_02_a12_01

  @Level:         1

  @Assertion:       1.2(12) Note: The above scenarios only prohibit the use of a newline character as a separator 
                    between two tokens, it does not mean that newline characters cannot be used in these scenarios 
                    (if a newline character is used, it is directly treated as the end of an expression or 
                    declaration).

  @Description:     Check that when newline characters is not allowed bw  tokens - it can be used as terminator 
                    for operators.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

main() {
    var i8 : Int8  = -8


    var u8 : UInt8 = 8

    
    i8++
    i8 = -i8
    
    // new lines after operator
    u8++

    // new lines after operator
    
    Assert.equals(7, i8)
    Assert.equals(9, u8)
    
    // test case for Int16/UInt16
    var i16 : Int16  = -16
    var u16 : UInt16 = 16
    i16++
    i16 = -i16
    
    u16++
    


    // new lines after operator
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
