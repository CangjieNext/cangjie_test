/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a07_03_interface

  @Level:         1

  @Assertion:   10.1.2.1(7) 2) If the function call expression is in the static 
                context of class/interface/struct, the static member methods of 
                the type is included.

  @Description:  In this tests overloaded static member methods are used in class
                 Overloaded methods are used in interface

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
interface IF {
    func Verify(arg:Int8) :Bool;
    func Verify(arg:Int16):Bool;
    func Verify(arg:Int32):Bool;
    func Verify(arg:Int64):Bool;
    func Verify(arg:Float64):Bool;
}

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

open class Klass <: IF {
    
    private static func SVerify(arg:Int8) : Bool {
        Assert.equals(i8, arg); true
    }
    private static func SVerify(arg:Int16) : Bool {
        Assert.equals(i16, arg); true
    }
    private static func SVerify(arg:Int32) : Bool {
        Assert.equals(i32, arg); true
    }
    private static func SVerify(arg:Int64) : Bool {
        Assert.equals(i64, arg); true
    }
    
    private static func SVerify(arg:UInt8) : Bool {
        Assert.equals(u8, arg); true
    }
    private static func SVerify(arg:UInt16) : Bool {
        Assert.equals(u16, arg); true
    }
    private static func SVerify(arg:UInt32) : Bool {
        Assert.equals(u32, arg); true
    }
    private static func SVerify(arg:UInt64) : Bool {
        Assert.equals(u64, arg); true
    }
    
    private static func SVerify(arg:Float64) : Bool {
        Assert.equals(f64, arg); true
    }
    private static func SVerify(arg:Float32) : Bool {
        Assert.equals(f32, arg); true
    }
    private static func SVerify(arg:Float16) : Bool {
        Assert.equals(f16, arg); true
    }

    public open func Verify(arg:Int8) : Bool {
        SVerify(arg)
    }
    public open func Verify(arg:Int16) : Bool {
        SVerify(arg)
    }
    public open func Verify(arg:Int32) : Bool {
        SVerify(arg)
    }
    public open func Verify(arg:Int64) : Bool {
        SVerify(arg)
    }
    
    public open func Verify(arg:UInt8) : Bool {
        SVerify(arg)
    }
    public open func Verify(arg:UInt16) : Bool {
        SVerify(arg)
    }
    public open func Verify(arg:UInt32) : Bool {
        SVerify(arg)
    }
    public open func Verify(arg:UInt64) : Bool {
        SVerify(arg)
    }
    
    public open func Verify(arg:Float64) : Bool {
        SVerify(arg)
    }
    public open func Verify(arg:Float32) : Bool {
        SVerify(arg)
    }
    public open func Verify(arg:Float16) : Bool {
        SVerify(arg)
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
  var kl: Klass = Klass();
    kl.Verify(i8)
    kl.Verify(i16)
    kl.Verify(i32)
    kl.Verify(i64)

    kl.Verify(u8)
    kl.Verify(u16)
    kl.Verify(u32)
    kl.Verify(u64)

    kl.Verify(f64)
    kl.Verify(f32)
    kl.Verify(f16)

    0
}



