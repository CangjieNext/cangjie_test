/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a15_08

  @Level:         1

  @Assertion:    10.1.2.1(15) If present in a type definition, the visible function
                 set contains only non-static member methods f in the current type 
                 (including inherited but not extended);
  
  
  @Description:  Overloading via type definition. 
                 Overloaded static methods also are visible  via new type.
                 Primary type is enum

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert



enum ENUM {
    i8 | i16 | i32 | i64 | u8| u16| u32| u64| f16| f32| f64
    
    public static func enuco(enu:ENUM): Int8 {
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


    static public  func SCheck(this_value:Klass, arg:Int8) {
        Assert.equals(enuco(this_value), enuco(i8))
    }
    static public  func SCheck(this_value:Klass, arg:Int16) {
        Assert.equals(enuco(this_value), enuco(i16))
    }
    static public  func SCheck(this_value:Klass, arg:Int32) {
        Assert.equals(enuco(this_value), enuco(i32))
   }
    static public  func SCheck(this_value:Klass, arg:Int64) {
        Assert.equals(enuco(this_value), enuco(i64))
    }
    
    static public  func SCheck(this_value:Klass, arg:UInt8) {
        Assert.equals(enuco(this_value), enuco(u8))
    }
    static public  func SCheck(this_value:Klass, arg:UInt16) {
        Assert.equals(enuco(this_value), enuco(u16))
    }
    static public  func SCheck(this_value:Klass, arg:UInt32) {
        Assert.equals(enuco(this_value), enuco(u32))
   }
    static public  func SCheck(this_value:Klass, arg:UInt64) {
        Assert.equals(enuco(this_value), enuco(u64))
    }

    static public  func SCheck(this_value:Klass, arg:Float16) {
        Assert.equals(enuco(this_value), enuco(f16))
    }
    static public  func SCheck(this_value:Klass, arg:Float32) {
        Assert.equals(enuco(this_value), enuco(f32))
   }
    static public  func SCheck(this_value:Klass, arg:Float64) {
        Assert.equals(enuco(this_value), enuco(f64))
    }


    func Check(arg:Int8) {
        SCheck(this,0i8)             
    }
    func Check(arg:Int16) {
        SCheck(this,arg)
    }
    func Check(arg:Int32) {
        SCheck(this,arg)
    }
    func Check(arg:Int64) {
        SCheck(this,1)
    }
    
    func Check(arg:UInt8) {
        SCheck(this,arg)
    }
    func Check(arg:UInt16) {
        SCheck(this,arg)
    }
    func Check(arg:UInt32) {
        SCheck(this,arg)
    }
    func Check(arg:UInt64) {
        SCheck(this,arg)
    }
    func Check(arg:Float16) {
        SCheck(this,arg)
    }
    func Check(arg:Float32) {
        SCheck(this,arg)
    }
    func Check(arg:Float64) {
        SCheck(this,arg)
    }

    
}

type Klass = ENUM

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


    Klass.SCheck(kli8,ci8)
    Klass.SCheck(kli16,ci16)
    Klass.SCheck(kli32,ci32)
    Klass.SCheck(kli64,ci64)
    Klass.SCheck(klu8,cu8)
    Klass.SCheck(klu16,cu16)
    Klass.SCheck(klu32,cu32)
    Klass.SCheck(klu64,cu64)

    Klass.SCheck(klf16,cf16)
    Klass.SCheck(klf32,cf32)
    Klass.SCheck(klf64,cf64)

    
    0
}



