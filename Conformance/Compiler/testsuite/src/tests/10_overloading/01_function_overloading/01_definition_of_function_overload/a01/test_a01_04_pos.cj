/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a01_04_pos

  @Level:         1

  @Assertion:    10.1.1(1) Function overloading occurs if multiple functions with 
                 the same name but different parameter types reside in the same scope.
                 For details, see Function Overloading Definition.

  @Description:  Check function overloading for function with 1 argument.
                 Argument is usual, positional

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
    Check(-1i8)
    Check(-2i16)
    Check(-3i32)
    Check(-4i64)
    Check(IntNative(-5))

    Check(1u8)
    Check(2u16)
    Check(3u32)
    Check(4u64)
    Check(UIntNative(5))



    Check(0.1f64)
    Check(0.2f32)
    Check(0.3f16)
    0
}
