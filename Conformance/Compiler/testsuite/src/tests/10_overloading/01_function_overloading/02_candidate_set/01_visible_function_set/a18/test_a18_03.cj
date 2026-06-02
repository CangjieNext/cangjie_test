/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a18_03

  @Level:         1

  @Assertion:    10.1.2.1(18) 5) If the function invocation is in the form of <object name>.f(...)
                 If the object type is a class, interface, struct or enum type and the type 
                 contains instance member method f, 
                 all member methods named f are included in the visible set.
  
  @Description:  Overloading static methods with generic class
                 Instant does not effect, but it is demanded by syntax

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



class Klass <T> {
    public static func SCheck(arg:Int8) {
        Assert.equals(i8, arg)
    }
    public static func SCheck(arg:Int16) {
        Assert.equals(i16, arg)
    }
    public static func SCheck(arg:Int32) {
        Assert.equals(i32, arg)
    }
    public static func SCheck(arg:Int64) {
        Assert.equals(i64, arg)
    }
    
    public static func SCheck(arg:UInt8) {
        Assert.equals(u8, arg)
    }
    public static func SCheck(arg:UInt16) {
        Assert.equals(u16, arg)
    }
    public static func SCheck(arg:UInt32) {
        Assert.equals(u32, arg)
    }
    public static func SCheck(arg:UInt64) {
        Assert.equals(u64, arg)
    }
    
    public static func SCheck(arg:Float64) {
        Assert.equals(f64, arg)
    }
    public static func SCheck(arg:Float32) {
        Assert.equals(f32, arg)
    }
    public static func SCheck(arg:Float16) {
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
    
    Klass<Int8>.SCheck(i8)
    Klass<Int8>.SCheck(i16)
    Klass<Int8>.SCheck(i32)
    Klass<Int8>.SCheck(i64)

    Klass<Int8>.SCheck(u8)
    Klass<Int8>.SCheck(u16)
    Klass<Int8>.SCheck(u32)
    Klass<Int8>.SCheck(u64)

    Klass<Int8>.SCheck(f64)
    Klass<Int8>.SCheck(f32)
    Klass<Int8>.SCheck(f16)
///////////////////////////////////////////////
    
    Klass<Float64>.SCheck(i8)
    Klass<Float64>.SCheck(i16)
    Klass<Float64>.SCheck(i32)
    Klass<Float64>.SCheck(i64)

    Klass<Float64>.SCheck(u8)
    Klass<Float64>.SCheck(u16)
    Klass<Float64>.SCheck(u32)
    Klass<Float64>.SCheck(u64)

    Klass<Float64>.SCheck(f64)
    Klass<Float64>.SCheck(f32)
    Klass<Float64>.SCheck(f16)

    0
}



