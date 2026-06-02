/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a04_02_super

  @Level:         1

  @Assertion:    10.1.2.1(4) Otherwise, if f is super, the calling expression appears in class/interface,
                 and f contains only the direct super class's constructor of the class/interface 
                 where the calling expression resides

  @Description:  Overloading test with super expression. Overloaded routines in child class
                uses expression with super. Rouitines are described w/o override open public 
                and it causes to errors


  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

                
*/


import utils.assert.Assert

open class Parent {
    
    private static func SVerify(arg:Int8) {
        Assert.equals(-1i8, arg)
    }
    private static func SVerify(arg:Int16) {
        Assert.equals(-2i16, arg)
    }
    private static func SVerify(arg:Int32) {
        Assert.equals(-3i32, arg)
    }
    private static func SVerify(arg:Int64) {
        Assert.equals(-4i64, arg)
    }
    
    private static func SVerify(arg:UInt8) {
        Assert.equals(1u8, arg)
    }
    private static func SVerify(arg:UInt16) {
        Assert.equals(2u16, arg)
    }
    private static func SVerify(arg:UInt32) {
        Assert.equals(3u32, arg)
    }
    private static func SVerify(arg:UInt64) {
        Assert.equals(4u64, arg)
    }
    
    private static func SVerify(arg:Float64) {
        Assert.equals(0.10f64, arg)
    }
    private static func SVerify(arg:Float32) {
        Assert.equals(0.2f32, arg)
    }
    private static func SVerify(arg:Float16) {
        Assert.equals(0.3f16, arg)
    }

    public open func Verify(arg:Int8) {
        SVerify(-1i8)
    }
    public open func Verify(arg:Int16) {
        SVerify(-2i16)
    }
    public open func Verify(arg:Int32) {
        SVerify(-3i32)
    }
    public open func Verify(arg:Int64) {
        SVerify(-4i64)
    }
    
    public open func Verify(arg:UInt8) {
        SVerify(1u8)
    }
    public open func Verify(arg:UInt16) {
        SVerify(2u16)
    }
    public open func Verify(arg:UInt32) {
        SVerify(3u32)
    }
    public open func Verify(arg:UInt64) {
        SVerify(4u64)
    }
    
    public open func Verify(arg:Float64) {
        SVerify(0.10f64)
    }
    public open func Verify(arg:Float32) {
        SVerify(0.2f32)
    }
    public open func Verify(arg:Float16) {
        SVerify(0.3f16)
    }

}



open class Klass <: Parent {

     func Verify(arg:Int8) {
        super.Verify(arg)
    }
     func Verify(arg:Int16) {
        super.Verify(arg)
    }
     func Verify(arg:Int32) {
        super.Verify(arg)
    }
     func Verify(arg:Int64) {
        super.Verify(arg)
    }
    
     func Verify(arg:UInt8) {
        super.Verify(arg)
    }
     func Verify(arg:UInt16) {
        super.Verify(arg)
    }
     func Verify(arg:UInt32) {
        super.Verify(arg)
    }
     func Verify(arg:UInt64) {
        super.Verify(arg)
    }
    
     func Verify(arg:Float64) {
        super.Verify(arg)
    }
     func Verify(arg:Float32) {
        super.Verify(arg)
    }
     func Verify(arg:Float16) {
        super.Verify(arg)
    }

}


main(ina :Array<String>) {
    var kl:Klass = Klass();
    kl.Verify(1u8)

    kl.Verify(0.3f16)
    var pa:Parent = Parent();
    pa.Verify(1u8)
    pa.Verify(0.2f32)
    0
}
