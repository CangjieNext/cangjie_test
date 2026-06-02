/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a01_05_pos_rt

  @Level:         1

  @Assertion:    10.1.1(1) Function overloading occurs if multiple functions with 
                 the same name but different parameter types reside in the same scope.
                 For details, see Function Overloading Definition.

  @Description:  Check function overloading for function with 1 argument.
                 Argument is usual, positional. Using run-time arhument

  @Mode:         run

  @Negative:     no

  @Structure:    single

                
*/


import utils.assert.Assert


func Check(arg:Int8) { 
    Assert.equals(-1i8, arg)
}
func Check(arg:Int16) { 
    Assert.equals(-2i16, arg)
}
func Check(arg:Int32) { 
    Assert.equals(-3i32, arg)
}
func Check(arg:Int64) { 
    Assert.equals(-4i64, arg)
}
func Check(arg:IntNative) { 
    Assert.equals(-5, arg)
}

func Check(arg:UInt8) { 
    Assert.equals(1u8, arg)
}
func Check(arg:UInt16) { 
    Assert.equals(2u16, arg)
}
func Check(arg:UInt32) { 
    Assert.equals(3u32, arg)
}
func Check(arg:UInt64) { 
    Assert.equals(4u64, arg)
}
func Check(arg:UIntNative) { 
    Assert.equals(5, arg)
}



func Check(arg:Float64) { 
    Assert.equals(0.10f64, arg)
}
func Check(arg:Float32) { 
    Assert.equals(0.2f32, arg)
}
func Check(arg:Float16) { 
    Assert.equals(0.3f16, arg)
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
        i8  = -1i8
        i16 = -2i16
        i32 = -3i32
        i64 = -4i64
        u8  =  1u8
        u16 =  2u16
        u32 =  3u32
        u64 =  4u64
        f16 =  0.3f16
        f32 =  0.2f32
        f64 =  0.1f64
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