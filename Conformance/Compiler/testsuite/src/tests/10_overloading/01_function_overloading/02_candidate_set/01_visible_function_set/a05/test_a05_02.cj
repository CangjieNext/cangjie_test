/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a05_02

  @Level:         1

  @Assertion:   10.1.2.1(5)
                Functions in the visible set must meet the following conditions:
                If f is a type name who has constructors, the visible set includes only the constructors defined in f.
                Otherwise, if f is a type name without a constructor, the visible set is empty

  @Description:  Type w/o constructor may be class or struct w/o init
                 No overloading. Default constructor is used.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

struct Struct {
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

}


main(ina :Array<String>) {
    var kl:Struct = Struct();
    Assert.equals(0.0f32, kl.f32)
    0
}

