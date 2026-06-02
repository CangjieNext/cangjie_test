/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a02_01_in_class

  @Level:         1

  @Assertion:    10.1.1(2) 1.Static member functions and instance member functions 
                 of an class, interface, struct type cannot be overloaded with each other.

  @Description:  Demonstrated oveloading in class with instance member functions 

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert

open class Klass {
    var o: Int32
    init(x: Int32) {
        this.o = x
    }
    
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
}

main(ina :Array<String>) {
    var kl:Klass = Klass(0);
    kl.Check(-1i8)
    kl.Check(-2i16)
    kl.Check(-3i32)
    kl.Check(-4i64)
    kl.Check(IntNative(-5))

    kl.Check(1u8)
    kl.Check(2u16)
    kl.Check(3u32)
    kl.Check(4u64)
    kl.Check(UIntNative(5))

    kl.Check(0.1f64)
    kl.Check(0.2f32)
    kl.Check(0.3f16)
    0
}
