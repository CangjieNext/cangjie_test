/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a06_02

  @Level:         1

  @Assertion:    10.1.2.1(6) 2.2. If f is a function name, the visible set includes functions 
                that are introduced in the following ways:
                By calling function without qualifierffe.g. f(...), the visible set includes functions
                introduced in the following ways: 1) Local functions visible in the scope;


  @Description:  Calls of overloaded functions are identified in visible scope.
                 A little bit complicated than 1st test. Some overloaded routines 
                 have overloaded calls inside

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


func Check(arg:Int8) { 
    Assert.equals(i8, arg)
    var i16: Int16   = Int16(2*arg)
    Check(i16)
}
func Check(arg:Int16) { 
    Assert.equals(i16, arg)
    var i32: Int32   = Int32(2*arg)
    Check(i32)
}
func Check(arg:Int32) { 
    Assert.equals(i32, arg)
    var i64: Int64   = Int64(2*arg)
    Check(i64)
}
func Check(arg:Int64) { 
    Assert.equals(i64, arg)
    0
}

func Check(arg:UInt8) { 
    Assert.equals(u8, arg)
    var u16: UInt16   = UInt16(2*arg)
    Check(u16)
}
func Check(arg:UInt16) { 
    Assert.equals(u16, arg)
    var u32: UInt32   = UInt32(2*arg)
    Check(u32)
}
func Check(arg:UInt32) { 

    Assert.equals(u32, arg)
    var u64: UInt64   = UInt64(2*arg)
    Check(u64)
}
func Check(arg:UInt64) { 
    Assert.equals(u64, arg)
    0
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

    Check(i8)
    Check(i16)
    Check(i32)
    Check(i64)

    Check(u8)
    Check(u16)
    Check(u32)
    Check(u64)

    Check(f64)
    Check(f32)
    Check(f16)

    0
}


func Check(arg:Float64) { 
    Assert.equals(f64, arg)
    0
}
func Check(arg:Float32) { 
    Assert.equals(f32, arg)
    0
}
func Check(arg:Float16) { 
    Assert.equals(f16, arg)
    0
}

