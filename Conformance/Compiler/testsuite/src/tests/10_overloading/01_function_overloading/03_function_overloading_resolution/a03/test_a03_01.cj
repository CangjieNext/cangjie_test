/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_a03_01

  @Level:         1

  @Assertion:    10.1.3(3) If there are multiple functions in the candidate set, 
                 the function with the highest scope priority is selected first 
                 according to the scope priority rule
  
  @Description:  Scopes in classes and extends. Only static functions in classes.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

let i8 : Int8    = -8i8     
let i16: Int16   = -16i16   
let i32: Int32   = -32i32   
let i64: Int64   = -64i64   
let u8 : UInt8   =  8u8     
let u16: UInt16  =  16u16   
let u32: UInt32  =  32u32   
let u64: UInt64  =  64u64   
let f16: Float16 =  16.0f16 
let f32: Float32 =  32.0f32 
let f64: Float64 =  64.0f64 

open class Parent {
    
     public static func SVerify(arg:Int8) {
        Assert.equals(i8, arg)
    }
    public static func SVerify(arg:Int16) {
        Assert.equals(i16, arg)
    }
}

open class Sub <: Parent {
    public static func SVerify(arg:Int16) {
        Parent.SVerify(arg)
        SVerify(Int8(arg/2))
    }
    public static func SVerify(arg:Int32) {
        Assert.equals(i32, arg)
        SVerify(Int16(arg/2))
    }
    public static func SVerify(arg:Int64) {
        Assert.equals(i64, arg)
    }

}

open class Klass  {
    public static func SVerify(arg:Int16) {
        Sub.SVerify(arg)
    }

    public static func SVerify(arg:UInt16) {
        Assert.equals(u16, arg)
    }
    public static func SVerify(arg:UInt32) {
        Assert.equals(u32, arg)
    }
    public static func SVerify(arg:UInt64) {
        Assert.equals(u64, arg)
    }
}

extend Klass {
    public static func SVerify(arg:Int32) {
        Sub.SVerify(arg)
    }
    public static func SVerify(arg:Int64) {
        Sub.SVerify(arg)
    }
}


main(ina :Array<String>) {
    Klass.SVerify(i16)
    Klass.SVerify(i32)
    Klass.SVerify(i64)

    Klass.SVerify(u16)
    Klass.SVerify(u32)
    Klass.SVerify(u64)

    Sub.SVerify(i8)
    Sub.SVerify(i16)
    Sub.SVerify(i32)
    Sub.SVerify(i64)
    0
}

