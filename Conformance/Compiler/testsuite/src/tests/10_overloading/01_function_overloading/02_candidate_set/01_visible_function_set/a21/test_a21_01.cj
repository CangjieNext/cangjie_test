/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a21_01

  @Level:         1

  @Assertion:    10.1.2.1(21) 3) If T has a super class, the () operator overload
                  function inherited from the super class is also included.  
  
  @Description:  Overloading operators () inherited from parent class
                 
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



open class Parent  {

    public open operator func ()(arg: Int8){
        Assert.equals(i8, arg)
    }
    public open operator func ()(arg: Int16){
        Assert.equals(i16, arg)
    }

    public open operator func ()(arg:Int32) {
        Assert.equals(i32, arg)
    }
    public open operator func ()(arg:Int64) {
        Assert.equals(i64, arg)
    }
    
    public open operator func ()(arg:UInt8) {
        Assert.equals(u8, arg)
    }
    public open operator func ()(arg:UInt16) {
        Assert.equals(u16, arg)
    }
    public open operator func ()(arg:UInt32) {
        Assert.equals(u32, arg)
    }
    public open operator func ()(arg:UInt64) {
        Assert.equals(u64, arg)
    }
    
    public open operator func ()(arg:Float64) {
        Assert.equals(f64, arg)
    }
    public open operator func ()(arg:Float32) {
        Assert.equals(f32, arg)
    }
    public open operator func ()(arg:Float16) {
        Assert.equals(f16, arg)
    }
}

open class Klass <: Parent {

    override open public operator func ()(arg:Int8) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:Int16) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:Int32) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:Int64) {
        var Par:Parent = Parent()
        Par(arg)
    }
    
    override open public operator func ()(arg:UInt8) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:UInt16) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:UInt32) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:UInt64) {
        var Par:Parent = Parent()
        Par(arg)
    }
    
    override open public operator func ()(arg:Float64) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:Float32) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:Float16) {
        var Par:Parent = Parent()
        Par(arg)
    }

}


main(ina :Array<String>) {
    var klass : Klass = Klass();
    klass(i8)
    klass(i16)
    klass(i32)
    klass(i64)

    klass(u8)
    klass(u16)
    klass(u32)
    klass(u64)

    klass(f16)
    klass(f32)
    klass(f64)

    0
}



