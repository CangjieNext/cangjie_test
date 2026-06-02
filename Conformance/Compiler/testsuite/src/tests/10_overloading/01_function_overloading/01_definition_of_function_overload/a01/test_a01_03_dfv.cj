/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a01_03_dfv

  @Level:         1

  @Assertion:    10.1.1(1) Function overloading occurs if multiple functions with 
                 the same name but different parameter types reside in the same scope.
                 For details, see Function Overloading Definition.

  @Description:  Check function overloading for function with 2 argument.
                 Second argument is same type for all function and uses default value

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert


func Check(arg:Int8, arg2!:Int32 = 1) {
    var va:Int8 = arg + Int8(arg2)
    Assert.equals(-0i8, va)
}
func Check(arg:Int16, arg2!:Int32 = 1) { 
    var va:Int16 = arg + Int16(arg2)
    Assert.equals(-1i16, va)
}
func Check(arg:Int32, arg2!:Int32 = 1) { 
    var va:Int32 = arg + Int32(arg2)
    Assert.equals(-2i32, va)
}
func Check(arg:Int64, arg2!:Int32 = 1) { 
    var va:Int64 = arg + Int64(arg2)
    Assert.equals(-3i64, va)
}
func Check(arg:IntNative, arg2!:Int32 = 1) { 
    var va:IntNative = arg + IntNative(arg2)
    Assert.equals(-4, va)
}

func Check(arg:UInt8, arg2!:Int32 = 1) { 
    var va:UInt8 = arg + UInt8(arg2)
    Assert.equals(2u8, va)
}
func Check(arg:UInt16, arg2!:Int32 = 1) { 
    var va:UInt16 = arg + UInt16(arg2)
    Assert.equals(3u16, va)
}
func Check(arg:UInt32, arg2!:Int32 = 1) { 
    var va:UInt32 = arg + UInt32(arg2)
    Assert.equals(4u32, va)
}
func Check(arg:UInt64, arg2!:Int32 = 1) { 
    var va:UInt64 = arg + UInt64(arg2)
    Assert.equals(5u64, va)
}
func Check(arg:UIntNative, arg2!:Int32 = 1) { 
    var va:UIntNative = arg + UIntNative(arg2)
    Assert.equals(6, va)
}



func Check(arg:Float64, arg2!:Int32 = 1) { 
    var va:Float64 = arg + Float64(arg2)
    Assert.equals(1.10f64, va)
}
func Check(arg:Float32, arg2!:Int32 = 1) { 
    var va:Float32 = arg + Float32(arg2)
    Assert.equals(1.2f32, va)
}
func Check(arg:Float16, arg2!:Int32 = 1) { 
    var va:Float16 = arg + Float16(arg2)
    Assert.equals(1.3f16, va)
}

main(ina :Array<String>) {
    Check(-1i8)
    Check(-2i16)
    Check(-3i32)
    Check(-4i64)

    Check(1u8)
    Check(2u16)
    Check(3u32)
    Check(4u64)

    Check(0.1f64)
    Check(0.2f32)
    Check(0.3f16)
    0
}
