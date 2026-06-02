/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_est_a12_01_package

  @Level:         1

  @Assertion:   10.1.2.1(12) For function calls with a qualifier, e.g. c.f(...),
                the visible set includes functions introduced in the following ways:
                1) If c is the name of a package and f is a function defined at the 
                top of the package, it does not include functions imported by way of import clause.


  @Description:  Constants and overloaded routines are described in separate file
                 and are put package pcheck. To be visible in other file need to
                 have 'public' before

  @Mode:         run

  @Negative:     no

  @Structure:    complex-aux

*/

package pcheck

import utils.assert.Assert

public let i8 : Int8    = -8i8     
public let i16: Int16   = -16i16   
public let i32: Int32   = -32i32   
public let i64: Int64   = -64i64   
public let u8 : UInt8   =  8u8     
public let u16: UInt16  =  16u16   
public let u32: UInt32  =  32u32   
public let u64: UInt64  =  64u64   
public let f16: Float16 =  16.0f16 
public let f32: Float32 =  32.0f32 
public let f64: Float64 =  64.0f64 

public func Check(arg:Int8) { 
    Assert.equals(i8, arg)
}
public func Check(arg:Int16) { 
    Assert.equals(i16, arg)
}
public func Check(arg:Int32) { 
    Assert.equals(i32, arg)
}
public func Check(arg:Int64) { 
    Assert.equals(i64, arg)
}

public func Check(arg:UInt8) { 
    Assert.equals(u8, arg)
}
public func Check(arg:UInt16) { 
    Assert.equals(u16, arg)
}
public func Check(arg:UInt32) { 
    Assert.equals(u32, arg)
}
public func Check(arg:UInt64) { 
    Assert.equals(u64, arg)
}

public func Check(arg:Float64) { 
    Assert.equals(f64, arg)
}
public func Check(arg:Float32) { 
    Assert.equals(f32, arg)
}
public func Check(arg:Float16) { 
    Assert.equals(f16, arg)
}


