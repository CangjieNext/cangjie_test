/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_02_a01_03

  @Level:         1

  @Assertion:    10.1.2.2(1) The type check is performed on functions in the visible function set

  @Description:  Overloaded function calls via this. Enum.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert



enum Klass {
    i8 | i16 | i32 | i64 | u8| u16| u32| u64| f16| f32| f64
    
    private static func enuco(enu:Klass): Int8 {
        let  this_value = match(enu) {
            case i8 => 0i8
            case i16 => 1i8
            case i32 => 2i8
            case i64 => 3i8
            case u8 =>  4i8
            case u16 => 5i8
            case u32 => 6i8
            case u64 => 7i8
            case f16 => 9i8
            case f32 => 10i8
            case f64 => 11i8
        }
        return this_value;
   }

    private operator func == (Right:Klass):Bool {
        enuco(this) == enuco(Right)
    }

    private  func SCheck(arg:Int8) {
        Assert.isTrue(this == i8)
    }
    private  func SCheck(arg:Int16) {
        Assert.isTrue(this == i16)
    }
    private  func SCheck(arg:Int32) {
        Assert.isTrue(this == i32)
   }
    private  func SCheck(arg:Int64) {
        Assert.isTrue(this == i64)
    }
    
    private  func SCheck(arg:UInt8) {
        Assert.isTrue(this == u8)
    }
    private  func SCheck(arg:UInt16) {
        Assert.isTrue(this == u16)
    }
    private  func SCheck(arg:UInt32) {
        Assert.isTrue(this == u32)
   }
    private  func SCheck(arg:UInt64) {
        Assert.isTrue(this == u64)
    }

    private  func SCheck(arg:Float16) {
        Assert.isTrue(this == f16)
    }
    private  func SCheck(arg:Float32) {
        Assert.isTrue(this == f32)
   }
    private  func SCheck(arg:Float64) {
        Assert.isTrue(this == f64)
    }


    func Check(arg:Int8) {
        this.SCheck(0i8)             
    }
    func Check(arg:Int16) {
        this.SCheck(arg)
    }
    func Check(arg:Int32) {
        this.SCheck(arg)
    }
    func Check(arg:Int64) {
        this.SCheck(1)
    }
    
    func Check(arg:UInt8) {
        this.SCheck(arg)
    }
    func Check(arg:UInt16) {
        this.SCheck(arg)
    }
    func Check(arg:UInt32) {
        this.SCheck(arg)
    }
    func Check(arg:UInt64) {
        this.SCheck(arg)
    }
    func Check(arg:Float16) {
        this.SCheck(arg)
    }
    func Check(arg:Float32) {
        this.SCheck(arg)
    }
    func Check(arg:Float64) {
        this.SCheck(arg)
    }

    
}



main(ina :Array<String>) {
    let ci8 : Int8    = -8i8     
    let ci16: Int16   = -16i16   
    let ci32: Int32   = -32i32   
    let ci64: Int64   = -64i64   
    let cu8 : UInt8   =  8u8     
    let cu16: UInt16  =  16u16   
    let cu32: UInt32  =  32u32   
    let cu64: UInt64  =  64u64   
    let cf16: Float16 =  16.0f16 
    let cf32: Float32 =  32.0f32 
    let cf64: Float64 =  64.0f64 

    var kli8: Klass = i8;
    var kli16: Klass = i16;
    var kli32: Klass = i32;
    var kli64: Klass = i64;

    var klu8: Klass = u8;
    var klu16: Klass = u16;
    var klu32: Klass = u32;
    var klu64: Klass = u64;

    var klf16: Klass = f16;
    var klf32: Klass = f32;
    var klf64: Klass = f64;

    klu8.Check(cu8)
    klu16.Check(cu16)
    klu32.Check(cu32)
    klu64.Check(cu64)

    klf16.Check(cf16)
    klf32.Check(cf32)
    klf64.Check(cf64)

    kli8.Check(ci8)
    kli16.Check(ci16)
    kli32.Check(ci32)
    kli64.Check(ci64)

    
    0
}



