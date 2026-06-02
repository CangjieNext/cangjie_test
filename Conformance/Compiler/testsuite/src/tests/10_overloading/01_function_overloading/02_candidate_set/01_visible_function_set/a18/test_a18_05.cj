/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a18_05

  @Level:         1

  @Assertion:    10.1.2.1(18) 5) If the function invocation is in the form of <object name>.f(...)
                 If the object type is a class, interface, struct or enum type and the type 
                 contains instance member method f, 
                 all member methods named f are included in the visible set.
  
  @Description:  Overloading non-static methods with generic enum

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert


enum ENUM <T> {
    i8 | i16 | i32 | i64 | u8| u16| u32| u64| f16| f32| f64
    
    public static func enuco(enu:ENUM<T>): Int8 {
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


    static public  func SCheck(this_value:ENUM<T>, arg:Int8) {
        Assert.equals(enuco(this_value), enuco(i8))
    }
    static public  func SCheck(this_value:ENUM<T>, arg:Int16) {
        Assert.equals(enuco(this_value), enuco(i16))
    }
    static public  func SCheck(this_value:ENUM<T>, arg:Int32) {
        Assert.equals(enuco(this_value), enuco(i32))
   }
    static public  func SCheck(this_value:ENUM<T>, arg:Int64) {
        Assert.equals(enuco(this_value), enuco(i64))
    }
    
    static public  func SCheck(this_value:ENUM<T>, arg:UInt8) {
        Assert.equals(enuco(this_value), enuco(u8))
    }
    static public  func SCheck(this_value:ENUM<T>, arg:UInt16) {
        Assert.equals(enuco(this_value), enuco(u16))
    }
    static public  func SCheck(this_value:ENUM<T>, arg:UInt32) {
        Assert.equals(enuco(this_value), enuco(u32))
   }
    static public  func SCheck(this_value:ENUM<T>, arg:UInt64) {
        Assert.equals(enuco(this_value), enuco(u64))
    }

    static public  func SCheck(this_value:ENUM<T>, arg:Float16) {
        Assert.equals(enuco(this_value), enuco(f16))
    }
    static public  func SCheck(this_value:ENUM<T>, arg:Float32) {
        Assert.equals(enuco(this_value), enuco(f32))
   }
    static public  func SCheck(this_value:ENUM<T>, arg:Float64) {
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
   
    var kli8: ENUM<Int8> = i8;
    var kli16: ENUM<Int16> = i16;
    var kli32: ENUM<Int32> = i32;
    var kli64: ENUM<Int64> = i64;

    var klu8: ENUM<UInt8> = u8;
    var klu16: ENUM<UInt16> = u16;
    var klu32: ENUM<UInt32> = u32;
    var klu64: ENUM<UInt64> = u64;

    var klf16: ENUM<Float16> = f16;
    var klf32: ENUM<Float32> = f32;
    var klf64: ENUM<Float64> = f64;


    ENUM<Int8>.SCheck(kli8,ci8)
    ENUM<Int16>.SCheck(kli16,ci16)
    ENUM<Int32>.SCheck(kli32,ci32)
    ENUM<Int64>.SCheck(kli64,ci64)
    ENUM<UInt8>.SCheck(klu8,cu8)
    ENUM<UInt16>.SCheck(klu16,cu16)
    ENUM<UInt32>.SCheck(klu32,cu32)
    ENUM<UInt64>.SCheck(klu64,cu64)

    ENUM<Float16>.SCheck(klf16,cf16)
    ENUM<Float32>.SCheck(klf32,cf32)
    ENUM<Float64>.SCheck(klf64,cf64)

    
    0
}



