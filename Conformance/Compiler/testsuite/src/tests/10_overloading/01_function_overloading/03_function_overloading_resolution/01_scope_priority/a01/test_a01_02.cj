/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a01_02

  @Level:         1

  @Assertion:    10.1.3.1(1) If two functions in the candidate set have 
                 different scope levels, the function with the higher 
                 scope level is selected when the function is overloaded
  
  @Description:  Scopes in enclosed routines

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
class MyInt32  {
    var my : Int32 =0;
    init(x: Int32) {
        this.my = x
    }
}

func SCheck(arg:Int64) {
    let i8 :Int8 = Int8(arg & 0xff)
    let i16:Int16 = Int16(arg & 0xffff)
    let i32 :Int32 = Int32(arg & 0xffffffff)
    
     func SCheck(arg:Int8) {
        Assert.equals(0xA, arg)
    }
    func SCheck(arg:Int16) {
        Assert.equals(0x6b0a, arg)
    }
    func SCheck(arg:Int32) {
        Assert.equals(0x60006B0A, arg)
    }
    func SCheck(arg:MyInt32) {
        Assert.equals(0x60006B0Ai32, arg.my)
    }

    SCheck(MyInt32(0x60006B0Ai32))
    SCheck(i8) 
    SCheck(i16) 
    SCheck(i32) 

}

func SCheck(arg:Int32) {
    let i8 :Int8 = Int8(arg & 0xffi32)
    let i16:Int16 = Int16(arg & 0xffffi32)
    
     func SCheck(arg:Int8) {
        Assert.equals(0x01, arg)
    }
    func SCheck(arg:Int16) {
        Assert.equals(0x0201, arg)
    }
    func SCheck(arg:MyInt32) {
        Assert.equals(0x04030201i32, arg.my)
    }
    SCheck(MyInt32(arg))
    SCheck(i8) 
    SCheck(i16) 

}


main(ina :Array<String>) {
    SCheck(0x04030201i32)
    SCheck(0x6111111160006B0Ai64)
    0
}

