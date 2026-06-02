/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a02_02

  @Level:         1

  @Assertion:   10.1.2.1(2) 2. Determine the visible set based on whether f is a function or a constructor. 
                If f is a constructor, determine the visible set according to the following rules: 
                If f is a type name who has constructors, the visible set includes only the constructors defined in f.

  @Description:  Test for constructor overloading with 2 candidate


  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue: 0006645

*/


import utils.assert.Assert

open class Klass {
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

    init(x: Float32) {
        this.f32 = x
    }
    init(x: Float64) {
        this.f64 = x
    }
    

}

main(ina :Array<String>) {
    var kl:Klass = Klass(0.15f32);
    Assert.equals(0.15f32, kl.f32)
    Assert.equals(0, kl.i32)
    var kl64 = Klass(1.1f64)
    Assert.equals(1.1f64, kl64.f64)

    0
}
