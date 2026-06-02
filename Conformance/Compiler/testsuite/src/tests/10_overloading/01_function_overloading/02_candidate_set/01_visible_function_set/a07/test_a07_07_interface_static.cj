/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a07_07_interface_static

  @Level:         1

  @Assertion:   10.1.2.1(7) 2) If the function call expression is in the static 
                context of class/interface/struct, the static member methods of 
                the type is included.


  @Description:  Overloaded calls in static context.Interface.

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


interface InterFace {
    static func Verify(arg:Int8) :Unit {
        Assert.equals(i8, arg)
    }
    static func Verify(arg:Int16) :Unit {
        Assert.equals(i16, arg)
    }
    static func Verify(arg:Int32) :Unit {
        Assert.equals(i32, arg)
    }
    static func Verify(arg:Int64) :Unit {
        Assert.equals(i64, arg)
    }
    
    static func Verify(arg:UInt8) :Unit {
        Assert.equals(u8, arg)
    }
    static func Verify(arg:UInt16) :Unit {
        Assert.equals(u16, arg)
    }
    static func Verify(arg:UInt32) :Unit {
        Assert.equals(u32, arg)
    }
    static func Verify(arg:UInt64) :Unit {
        Assert.equals(u64, arg)
    }
    
    static func Verify(arg:Float64) :Unit {
        Assert.equals(f64, arg)
    }
    static func Verify(arg:Float32) :Unit {
        Assert.equals(f32, arg)
    }
    static func Verify(arg:Float16) :Unit {
        Assert.equals(f16, arg)
    }

}



main(ina :Array<String>) {
    var i8 : Int8    =0;
    var i16: Int16   =0;
    var i32: Int32   =0;
    var i64: Int64   =0;
    var u8 : UInt8   =0;
    var u16: UInt16  =0;
    var u32: UInt32  =0;
    var u64: UInt64  =0;
    var f16: Float16 =0.0;
    var f32: Float32 =0.0;
    var f64: Float64 =0.0;

    if ( Assert.getRuntimeZero(ina) == 0) {
        i8  = -8i8
        i16 = -16i16
        i32 = -32i32
        i64 = -64i64
        u8  =  8u8
        u16 =  16u16
        u32 =  32u32
        u64 =  64u64
        f16 =  16.0f16
        f32 =  32.0f32
        f64 =  64.0f64
    }



  InterFace.Verify(i8)
  InterFace.Verify(i16)
  InterFace.Verify(i32)
  InterFace.Verify(i64)
  InterFace.Verify(u8)
  InterFace.Verify(u16)
  InterFace.Verify(u32)
  InterFace.Verify(u64)
  InterFace.Verify(f64)
  InterFace.Verify(f32)
  InterFace.Verify(f16)

    0
}



