/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a17_03_super_interface

  @Level:         1

  @Assertion:   10.1.2.1(17) 4) If the function invocation is in the form of super.f(...),
                the visible set includes non-static member functions in the super class or super interfaces.
  

  @Description:  Overloading test with overloaded call with super-prefix is used in child class

  @Mode:         run

  @Negative:     no

  @Structure:    single

                
*/

import utils.assert.Assert

let i8 : Int8    = -8i8     
let i16: Int16   = -16i16   
let i32: Int32   = -32i32   
let i64: Int64   = -64i64   
let u8 : UInt8   =  8u8     
let u16: UInt16  =  16u16   
let u32: UInt32  =  32u32   
let u64: UInt64  =  64u64   
let f16: Float16 =  16.0f16 
let f32: Float32 =  32.0f32 
let f64: Float64 =  64.0f64 


interface InterFace {
    func Verify(arg:Int8) :Unit {
    }
    func Verify(arg:Int16) :Unit {
    }
    func Verify(arg:Int32) :Unit {
    }
    func Verify(arg:Int64) :Unit {
    }
    
    func Verify(arg:UInt8) :Unit {
    }
    func Verify(arg:UInt16) :Unit {
    }
    func Verify(arg:UInt32) :Unit {
    }
    func Verify(arg:UInt64) :Unit {
    }
    
    func Verify(arg:Float64) :Unit {
    }
    func Verify(arg:Float32) :Unit {
    }
    func Verify(arg:Float16) :Unit {
    }

}



open class Parent <: InterFace {
 
     private static func SVerify(arg:Int8) {
        Assert.equals(i8, arg)
    }
    private static func SVerify(arg:Int16) {
        Assert.equals(i16, arg)
    }
    private static func SVerify(arg:Int32) {
        Assert.equals(i32, arg)
    }
    private static func SVerify(arg:Int64) {
        Assert.equals(i64, arg)
    }
    
    private static func SVerify(arg:UInt8) {
        Assert.equals(u8, arg)
    }
    private static func SVerify(arg:UInt16) {
        Assert.equals(u16, arg)
    }
    private static func SVerify(arg:UInt32) {
        Assert.equals(u32, arg)
    }
    private static func SVerify(arg:UInt64) {
        Assert.equals(u64, arg)
    }
    
    private static func SVerify(arg:Float64) {
        Assert.equals(f64, arg)
    }
    private static func SVerify(arg:Float32) {
        Assert.equals(f32, arg)
    }
    private static func SVerify(arg:Float16) {
        Assert.equals(f16, arg)
    }

    open public func Verify(arg:Int8) {
        SVerify(arg)
    }
    open public func Verify(arg:Int16) {
        SVerify(arg)
    }
    open public func Verify(arg:Int32) {
        SVerify(arg)
    }
    open public func Verify(arg:Int64) {
        SVerify(arg)
    }
    
    open public func Verify(arg:UInt8) {
        SVerify(arg)
    }
    open public func Verify(arg:UInt16) {
        SVerify(arg)
    }
    open public func Verify(arg:UInt32) {
        SVerify(arg)
    }
    open public func Verify(arg:UInt64) {
        SVerify(arg)
    }
    
    open public func Verify(arg:Float64) {
        SVerify(arg)
    }
    open public func Verify(arg:Float32) {
        SVerify(arg)
    }
    open public func Verify(arg:Float16) {
        SVerify(arg)
    }


}


class Klass <: Parent {

    override public func Verify(arg:Int8) {
        super.Verify(arg - 1)
    }
    override public func Verify(arg:Int16) {
        super.Verify(arg - 1)
    }
    override public func Verify(arg:Int32) {
        super.Verify(arg - 1)
    }
    override public func Verify(arg:Int64) {
        super.Verify(arg - 1)
    }
    
    override public func Verify(arg:UInt8) {
        super.Verify(arg - 1)
    }
    override public func Verify(arg:UInt16) {
        super.Verify(arg - 1)
    }
    override public func Verify(arg:UInt32) {
        super.Verify(arg - 1)
    }
    override public func Verify(arg:UInt64) {
        super.Verify(arg - 1)
    }
    
    override public func Verify(arg:Float64) {
        super.Verify(arg - 1.0)
    }
    override public func Verify(arg:Float32) {
        super.Verify(arg - 1.0)
    }
    override public func Verify(arg:Float16) {
        super.Verify(arg - 1.0)
    }

}


main(ina :Array<String>) {
    var kl:Klass = Klass();
    kl.Verify(i8+1)
    kl.Verify(i16+1)
    kl.Verify(i32+1)
    kl.Verify(i64+1)

    kl.Verify(u8+1)
    kl.Verify(u16+1)
    kl.Verify(u32+1)
    kl.Verify(u64+1)

    kl.Verify(f16+1.0)
    kl.Verify(f32+1.0)
    kl.Verify(f64+1.0)


    0
}

