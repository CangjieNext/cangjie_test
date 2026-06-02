/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a04_03_super

  @Level:         1

  @Assertion:    10.1.2.1(4) Otherwise, if f is super, the calling expression appears in class/interface,
                 and f contains only the direct super class's constructor of the class/interface 
                 where the calling expression resides

  @Description:  Overloading test with class constructor and super expression. Overloaded routines in child class
                uses expression with super. Rouitines are described as override open public 


  @Mode:         run

  @Negative:     no

  @Structure:    single

                
*/


import utils.assert.Assert

open class Parent {
    
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

    init(x: Int8) {
        this.i8 = x
    }
    init(x: Int16) {
        this.i16 = x
    }
    init(x: Int32) {
        this.i32 = x
    }
    init(x: Int64) {
        this.i64 = x
    }
    init(x: UInt8) {
        this.u8 = x
    }
    init(x: UInt16) {
        this.u16 = x
    }
    init(x: UInt32) {
        this.u32 = x
    }
    init(x: UInt64) {
        this.u64 = x
    }
    init(x: Float16) {
        this.f16 = x
    }
    init(x: Float32) {
        this.f32 = x
    }
    init(x: Float64) {
        this.f64 = x
    }

}


open class Klass <: Parent {
    var Ki8 : Int8    =0;
    var Ki16: Int16   =0;
    var Ki32: Int32   =0;
    var Ki64: Int64   =0;
    var Ku8 : UInt8   =0;
    var Ku16: UInt16  =0;
    var Ku32: UInt32  =0;
    var Ku64: UInt64  =0;
    var Kf16: Float16 =0.0;
    var Kf32: Float32 =0.0;
    var Kf64: Float64 =0.0;

    init(x: Int8) {
        super(x)
        this.Ki8  = super.i8
    }
    init(x: Int16) {
        super(x - 1)
        this.Ki16  = super.i16 + 1
    }
    init(x: Int32) {
        super(x)
        this.Ki32  = super.i32
    }
    init(x: Int64) {
        super(x)
        this.Ki64  = super.i64
    }
    init(x: UInt8) {
        super(x)
        this.Ku8  = super.u8
    }
    init(x: UInt16) {
        super(x)
        this.Ku16  = super.u16
    }
    init(x: UInt32) {
        super(x)
        this.Ku32  = super.u32
    }
    init(x: UInt64) {
        super(x)
        this.Ku64  = super.u64
    }
    init(x: Float16) {
        super(x)
        this.Kf16  = super.f16
    }
    init(x: Float32) {
        super(x)
        this.Kf32  = super.f32
    }
    init(x: Float64) {
        super(x)
        this.Kf64  = super.f64
    }


}


main(ina :Array<String>) {
    var kl:Klass = Klass(0.15f32);
    var klu:Klass = Klass(64u64)
    var kli16 = Klass(16i16)
    Assert.equals(0.15f32, kl.f32)
    Assert.equals(64u64, klu.u64)
    Assert.equals(0.15f32, kl.f32)
    Assert.equals(15i16, kli16.i16)
    Assert.equals(16i16, kli16.Ki16)

    Assert.equals(0, klu.i32)
    0
}
