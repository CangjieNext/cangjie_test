/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a17_04_super_interface

  @Level:         1

  @Assertion:   10.1.2.1(17) 4) If the function invocation is in the form of super.f(...),
                the visible set includes non-static member functions in the super class or super interfaces.
  

  @Description:  Compile test with interface and abstract class

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

                
*/

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
 
}


open class Klass <: Parent {

    override open public func Verify(arg:Int8) {
        super.Verify(arg - 1)
    }
    override open public func Verify(arg:Int16) {
        super.Verify(arg - 1)
    }
    override open public func Verify(arg:Int32) {
        super.Verify(arg - 1)
    }
    override open public func Verify(arg:Int64) {
        super.Verify(arg - 1)
    }
    
    override open public func Verify(arg:UInt8) {
        super.Verify(arg - 1)
    }
    override open public func Verify(arg:UInt16) {
        super.Verify(arg - 1)
    }
    override open public func Verify(arg:UInt32) {
        super.Verify(arg - 1)
    }
    override open public func Verify(arg:UInt64) {
        super.Verify(arg - 1)
    }
    
    override open public func Verify(arg:Float64) {
        super.Verify(arg - 1.0)
    }
    override open public func Verify(arg:Float32) {
        super.Verify(arg - 1.0)
    }
    override open public func Verify(arg:Float16) {
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

