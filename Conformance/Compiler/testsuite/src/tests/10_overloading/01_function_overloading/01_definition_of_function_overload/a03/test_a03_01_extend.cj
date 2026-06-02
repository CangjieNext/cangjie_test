/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a03_01_extend

  @Level:         1

  @Assertion:    10.1.1(3) 2.Static member functions and instance member functions of extends
                 of the same type cannot be overloaded with each other, except that two functions 
                 in extensions of the same type both are private

  @Description:  Test shows that overloading in class and extend is possible between instance member functions
                 and static functions. It is OK if names of static and instance are not the same

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert

class Klass {
    var o: Int32
    init(x: Int32) {
        this.o = x
    }
    
    static func SCheck(arg:Int8) {
        Assert.equals(-1i8, arg)
    }
    static func SCheck(arg:Int16) {
        Assert.equals(-2i16, arg)
    }
    static func SCheck(arg:Int32) {
        Assert.equals(-3i32, arg)
    }
    static func SCheck(arg:Int64) {
        Assert.equals(-4i64, arg)
    }
    
    static func SCheck(arg:UInt8) {
        Assert.equals(1u8, arg)
    }
    static func SCheck(arg:UInt16) {
        Assert.equals(2u16, arg)
    }
    static func SCheck(arg:UInt32) {
        Assert.equals(3u32, arg)
    }
    static func SCheck(arg:UInt64) {
        Assert.equals(4u64, arg)
    }
    
    static func SCheck(arg:Float64) {
        Assert.equals(0.10f64, arg)
    }
    static func SCheck(arg:Float32) {
        Assert.equals(0.2f32, arg)
    }
    static func SCheck(arg:Float16) {
        Assert.equals(0.3f16, arg)
    }

    func Check(arg:Int8) {
        SCheck(-1i8)
    }
    func Check(arg:Int16) {
        SCheck(-2i16)
    }
    func Check(arg:Int32) {
        SCheck(-3i32)
    }
    func Check(arg:Int64) {
        SCheck(-4i64)
    }
    
    func Check(arg:UInt8) {
        SCheck(1u8)
    }
    func Check(arg:UInt16) {
        SCheck(2u16)
    }
    func Check(arg:UInt32) {
        SCheck(3u32)
    }
    func Check(arg:UInt64) {
        SCheck(4u64)
    }
    
    func Check(arg:Float64) {
        SCheck(0.10f64)
    }
    func Check(arg:Float32) {
        SCheck(0.2f32)
    }
    func Check(arg:Float16) {
        SCheck(0.3f16)
    }

}
extend Klass {
    static func SCheck(arg:IntNative) {
        Assert.equals(-5, arg)
    }
    static func SCheck(arg:UIntNative) {
        Assert.equals(5, arg)
    }
    func Check(arg:IntNative) {
        SCheck(IntNative(-5))
    }
    func Check(arg:UIntNative) {
        SCheck(UIntNative(5))
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
