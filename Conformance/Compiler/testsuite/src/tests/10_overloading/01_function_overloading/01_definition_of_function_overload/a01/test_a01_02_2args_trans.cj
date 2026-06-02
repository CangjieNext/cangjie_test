/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a01_02_2args_trans

  @Level:         1

  @Assertion:    10.1.1(1) Function overloading occurs if multiple functions with 
                 the same name but different parameter types reside in the same scope.
                 For details, see Function Overloading Definition.

  @Description:  Check function overloading for function with 2 arguments.
                 Second argument is named. In calls args are transposed

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert


func Check(arg!:Int8, arg2!:Int32 = 1) {
    var va:Int8 = arg + Int8(arg2)
    Assert.equals(-1i8, va)
}
func Check(arg!:Int16, arg2!:Int32 = 1) { 
    var va:Int16 = arg + Int16(arg2)
    Assert.equals(-2i16, va)
}
func Check(arg!:Int32, arg2!:Int32 = 1) { 
    var va:Int32 = arg + Int32(arg2)
    Assert.equals(-3i32, va)
}
func Check(arg!:Int64, arg2!:Int32 = 1) { 
    var va:Int64 = arg + Int64(arg2)
    Assert.equals(-4i64, va)
}
func Check(arg!:IntNative, arg2!:Int32 = 1) { 
    var va:IntNative = arg + IntNative(arg2)
    Assert.equals(-5, va)
}

func Check(arg!:UInt8, arg2!:Int32 = 1) { 
    var va:UInt8 = arg + UInt8(arg2)
    Assert.equals(1u8, va)
}
func Check(arg!:UInt16, arg2!:Int32 = 1) { 
    var va:UInt16 = arg + UInt16(arg2)
    Assert.equals(2u16, va)
}
func Check(arg!:UInt32, arg2!:Int32 = 1) { 
    var va:UInt32 = arg + UInt32(arg2)
    Assert.equals(3u32, va)
}
func Check(arg!:UInt64, arg2!:Int32 = 1) { 
    var va:UInt64 = arg + UInt64(arg2)
    Assert.equals(4u64, va)
}
func Check(arg!:UIntNative, arg2!:Int32 = 1) { 
    var va:UIntNative = arg + UIntNative(arg2)
    Assert.equals(5, va)
}



func Check(arg!:Float64, arg2!:Int32 = 1) { 
    var va:Float64 = arg + Float64(arg2)
    Assert.equals(0.10f64, va)
}
func Check(arg!:Float32, arg2!:Int32 = 1) { 
    var va:Float32 = arg + Float32(arg2)
    Assert.equals(0.2f32, va)
}
func Check(arg!:Float16, arg2!:Int32 = 1) { 
    var va:Float16 = arg + Float16(arg2)
    Assert.equals(0.3f16, va)
}

main(ina :Array<String>) {
    Check(arg2:0,arg:-1i8  )
    Check(arg2:0,arg:-2i16 )
    Check(arg2:0,arg:-3i32 )
    Check(arg2:0,arg:-4i64 )
                 
    Check(arg2:0,arg:1u8   )
    Check(arg2:0,arg:2u16  )
    Check(arg2:0,arg:3u32  )
    Check(arg2:0,arg:4u64  )
                      
    Check(arg2:0,arg:0.1f64)
    Check(arg2:0,arg:0.2f32)
    Check(arg2:0,arg:0.3f16)
    0
}