/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a16_02

  @Level:         1

  @Assertion:    10.1.2.1(16) If present in a type extension, the visible function
                 set contains both the non-static member method f in the type and in the extension.
  
  @Description:  Overloaded non-static methods are both in structure and in extend.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert



struct Klass {
    var obj :Int8;
    init(inival:Int8) {
        this.obj = inival
    }

    public  func SCheck(arg:Int8) {
        Assert.equals(Int8(this.obj), arg)
    }
    public  func SCheck(arg:Int16) {
        Assert.equals(Int16(this.obj), arg)
    }
    public  func SCheck(arg:Int32) {
        Assert.equals(Int32(this.obj), arg)
    }
    public  func SCheck(arg:Int64) {
        Assert.equals(Int64(this.obj), arg)
    }
    
    public  func SCheck(arg:UInt8) {
        Assert.equals(UInt8(this.obj), arg)
    }
    public  func SCheck(arg:UInt16) {
        Assert.equals(UInt16(this.obj), arg)
    }
    public  func SCheck(arg:UInt32) {
        Assert.equals(UInt32(this.obj), arg)
    }
    public  func SCheck(arg:UInt64) {
        Assert.equals(UInt64(this.obj), arg)
    }
    
    public  func SCheck(arg:Float16) {
        Assert.equals(Float16(this.obj), arg)
    }
    public  func SCheck(arg:Float32) {
        Assert.equals(Float32(this.obj), arg)
    }
    public  func SCheck(arg:Float64) {
        Assert.equals(Float64(this.obj), arg)
    }   
    func Check(arg:Int8) {
        this.SCheck(arg)
    }
    func Check(arg:Int16) {
        this.SCheck(arg)
    }
    func Check(arg:Int32) {
        this.SCheck(arg)
    }
    func Check(arg:Int64) {
        this.SCheck(arg)
    }
}

extend Klass {
    
    func Check(arg:UInt8) {
        this.SCheck(arg)
    }
    func Check(arg:UInt16) {
        this.SCheck(arg)
    }
    func Check(arg:UInt32) {
        this.SCheck(arg)
    }
    func Check(arg:UInt64) {
        this.SCheck(arg)
    }
    func Check(arg:Float16) {
        this.SCheck(arg)
    }
    func Check(arg:Float32) {
        this.SCheck(arg)
    }
    func Check(arg:Float64) {
        this.SCheck(arg)
    }
}


main(ina :Array<String>) {
    let i8 : Int8    = -8i8     
    let i16: Int8   = -16i8   
    let i32: Int8   = -32i8   
    let i64: Int8   = -64i8   
    let u8 : Int8   =  8i8     
    let u16: Int8  =  16i8   
    let u32: Int8  =  32i8   
    let u64: Int8  =  64i8  

    let f16: Int8   =  17i8  
    let f32: Int8   =  33i8   
    let f64: Int8   =  65i8

  var kl: Klass = Klass(i8);
    kl.Check(Int8(i8))
    kl = Klass(i16)
    kl.Check(Int16(i16))
    kl = Klass(i32)
    kl.Check(Int32(i32))
    kl = Klass(i64)
    kl.Check(Int64(i64))

    kl = Klass(u8)
    kl.Check(UInt8(u8))
    kl = Klass(u16)
    kl.Check(UInt16(u16))
    kl = Klass(u32)
    kl.Check(UInt32(u32))
    kl = Klass(u64)
    kl.Check(UInt64(u64))

    kl = Klass(f64)
    kl.Check(Float64(f64))
    kl = Klass(f32)
    kl.Check(Float32(f32))
    kl = Klass(f16)
    kl.Check(Float16(f16))

    0
}



