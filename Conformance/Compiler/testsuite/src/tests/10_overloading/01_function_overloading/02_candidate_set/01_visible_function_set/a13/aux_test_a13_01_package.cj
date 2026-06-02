/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_est_a13_01_package

  @Level:         1

  @Assertion:   10.1.2.1(13) 2) If c in a.b.c is a type name defined by class, 
                struct or enum, visible set includes static methods defined in the c.


  @Description:  Class and struct  with static routines are members of package.
                 To call their routinse need to use prefix pcheck. .
  
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

public class Klass {
    static public func Check(arg:Int8) { 
        Assert.equals(i8, arg)
    }
    static public func Check(arg:Int16) { 
        Assert.equals(i16, arg)
    }
    static public func Check(arg:Int32) { 
        Assert.equals(i32, arg)
    }
    static public func Check(arg:Int64) { 
        Assert.equals(i64, arg)
    }

    static public func Check(arg:UInt8) { 
        Assert.equals(u8, arg)
    }
    static public func Check(arg:UInt16) { 
        Assert.equals(u16, arg)
    }
    static public func Check(arg:UInt32) { 
        Assert.equals(u32, arg)
    }
    static public func Check(arg:UInt64) { 
        Assert.equals(u64, arg)
    }

    static public func Check(arg:Float64) { 
        Assert.equals(f64, arg)
    }
    static public func Check(arg:Float32) { 
        Assert.equals(f32, arg)
    }
    static public func Check(arg:Float16) { 
        Assert.equals(f16, arg)
    }
}


public struct Struct {
    static public func Check(arg:Int8) { 
        Assert.equals(i8, arg)
    }
    static public func Check(arg:Int16) { 
        Assert.equals(i16, arg)
    }
    static public func Check(arg:Int32) { 
        Assert.equals(i32, arg)
    }
    static public func Check(arg:Int64) { 
        Assert.equals(i64, arg)
    }

    static public func Check(arg:UInt8) { 
        Assert.equals(u8, arg)
    }
    static public func Check(arg:UInt16) { 
        Assert.equals(u16, arg)
    }
    static public func Check(arg:UInt32) { 
        Assert.equals(u32, arg)
    }
    static public func Check(arg:UInt64) { 
        Assert.equals(u64, arg)
    }

    static public func Check(arg:Float64) { 
        Assert.equals(f64, arg)
    }
    static public func Check(arg:Float32) { 
        Assert.equals(f32, arg)
    }
    static public func Check(arg:Float16) { 
        Assert.equals(f16, arg)
    }
}

public enum Enum {
    ZERO | ONE | TWO | THREE
    static public func Check(arg:Int8) { 
        Assert.equals(i8, arg)
    }
    static public func Check(arg:Int16) { 
        Assert.equals(i16, arg)
    }
    static public func Check(arg:Int32) { 
        Assert.equals(i32, arg)
    }
    static public func Check(arg:Int64) { 
        Assert.equals(i64, arg)
    }

    static public func Check(arg:UInt8) { 
        Assert.equals(u8, arg)
    }
    static public func Check(arg:UInt16) { 
        Assert.equals(u16, arg)
    }
    static public func Check(arg:UInt32) { 
        Assert.equals(u32, arg)
    }
    static public func Check(arg:UInt64) { 
        Assert.equals(u64, arg)
    }

    static public func Check(arg:Float64) { 
        Assert.equals(f64, arg)
    }
    static public func Check(arg:Float32) { 
        Assert.equals(f32, arg)
    }
    static public func Check(arg:Float16) { 
        Assert.equals(f16, arg)
    }

}