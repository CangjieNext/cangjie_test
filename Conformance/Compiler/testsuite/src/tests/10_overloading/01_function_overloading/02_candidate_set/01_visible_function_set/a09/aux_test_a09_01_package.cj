/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_est_a09_01_package

  @Level:         1

  @Assertion:   10.1.2.1(9) 4) Functions defined in the top level of the package

  @Description:  Constants and overloaded routines are described in separate file

  @Mode:         run

  @Negative:     no

  @Structure:    complex-aux

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
}
func Check(arg:Int16) { 
    Assert.equals(i16, arg)
}
func Check(arg:Int32) { 
    Assert.equals(i32, arg)
}
func Check(arg:Int64) { 
    Assert.equals(i64, arg)
}

func Check(arg:UInt8) { 
    Assert.equals(u8, arg)
}
func Check(arg:UInt16) { 
    Assert.equals(u16, arg)
}
func Check(arg:UInt32) { 
    Assert.equals(u32, arg)
}
func Check(arg:UInt64) { 
    Assert.equals(u64, arg)
}

func Check(arg:Float64) { 
    Assert.equals(f64, arg)
}
func Check(arg:Float32) { 
    Assert.equals(f32, arg)
}
func Check(arg:Float16) { 
    Assert.equals(f16, arg)
}


