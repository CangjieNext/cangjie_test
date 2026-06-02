 /*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_est_a22_02

  @Level:         1

  @Assertion:   10.1.2.1(22) 4) If T implements interfaces, the () operator overload function 
                obtained from the interface with the default implementation is also included.

  @Description:  the () operator overload function in interface.
                 File with interface implementation
                 

  @Mode:         run

  @Negative:     no

  @Structure:    complex-aux

*/

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

interface IF {
}

public class AuxTestA2202 <: IF {
     open operator func ()(arg: Int8) : Unit {
        Assert.equals(i8, arg)
    }
     open operator func ()(arg: Int16) : Unit {
        Assert.equals(i16, arg)
    }

     open operator func ()(arg:Int32) : Unit {
        Assert.equals(i32, arg)
    }
     open operator func ()(arg:Int64) : Unit {
        Assert.equals(i64, arg)
    }
    
     open operator func ()(arg:UInt8) : Unit {
        Assert.equals(u8, arg)
    }
     open operator func ()(arg:UInt16) : Unit {
        Assert.equals(u16, arg)
    }
     open operator func ()(arg:UInt32) : Unit {
        Assert.equals(u32, arg)
    }
     open operator func ()(arg:UInt64) : Unit {
        Assert.equals(u64, arg)
    }
    
     open operator func ()(arg:Float64) : Unit {
        Assert.equals(f64, arg)
    }
     open operator func ()(arg:Float32) : Unit {
        Assert.equals(f32, arg)
    }
     open operator func ()(arg:Float16) : Unit {
        Assert.equals(f16, arg)
    }

}



