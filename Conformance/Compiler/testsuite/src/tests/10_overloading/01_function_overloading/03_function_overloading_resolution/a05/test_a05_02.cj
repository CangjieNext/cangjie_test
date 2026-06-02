/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_a05_02

  @Level:         1

  @Assertion:    10.1.3(5)If no unique closest matching function exists,
                 a compilation error is reported
  
  @Description:  Scopes in enclosed routines. Attempt to check ability to solve overloading
                 via type class heritage

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
class MyInt8  {
    var my : Int8 =0;
    init(x: Int8) {
        this.my = x
    }
}
class MyInt16  {
    var my : Int16 =0;
    init(x: Int16) {
        this.my = x
    }
}
class MyInt32  {
    var my : Int32 =0;
    init(x: Int32) {
        this.my = x
    }
}

func SCheck(arg:Int64) {
    
     func SCheck(arg:Int8) {
        Assert.equals(0xA, arg)
    }
    func SCheck(arg:Int16) {
        Assert.equals(0x6b0a, arg)
    }
    func SCheck(arg:Int32) {
        Assert.equals(0x60006B0A, arg)
    }
     func SCheck(arg:MyInt8,b!: Bool = false) {
        Assert.isTrue(b)
    }
    func SCheck(arg:MyInt16,b!: Bool = false) {
        Assert.isTrue(b)
    }
    func SCheck(arg:MyInt32,b!: Bool = false) {
        Assert.isTrue(b)
    }
    let i8 = Int8(arg & 0xff)
    let i16 = Int16(arg & 0xffff)
    let i32 = Int32(arg & 0xffffffff)
    SCheck(i8) 
    SCheck(i16) 
    SCheck(i32) 
    if (arg == 0) {
        let mi8 = MyInt8(i8)
        let mi16 = MyInt16(i16)
        let mi32 = MyInt32(i32)
        SCheck(mi8) 
        SCheck(mi16) 
        SCheck(mi32) 
    }

}

func SCheck(arg:Int32) {
    
     func SCheck(arg:Int8) {
        Assert.equals(0x01, arg)
    }
    func SCheck(arg:Int16) {
        Assert.equals(0x0201, arg)
    }
    let i8 = Int8(arg & 0xffi32)
    let i16 = Int16(arg & 0xffffi32)
    SCheck(i8) 
    SCheck(i16) 
}


func SCheck(arg:MyInt32,b!: Bool = false) {
    Assert.isTrue(b)
}
main(ina :Array<String>) {
    SCheck(0x04030201i32)
    SCheck(0x6111111160006B0Ai64)
    0
}

