/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a10_03_neg

  @Level:         1

  @Assertion:   10.1.2.1(10) 5) Functions declared in extend;

  @Description:  Compiler emits error as function with such type was not defined

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


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
    
    func Check(arg:Int8) {
    }


}

extend Klass {
    func Check(arg:Int32) {
    }
    func Check(arg:Int64) {
    }
    
    func Check(arg:UInt8) {
    }
    func Check(arg:UInt16) {
    }
    func Check(arg:UInt32) {
    }
    func Check(arg:UInt64) {
    }
    
    func Check(arg:Float64) {
    }
    func Check(arg:Float32) {
    }
    func Check(arg:Float16) {
    }
}


main(ina :Array<String>) {
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

    var kli8: Klass = Klass(i8);
    var kli16: Klass = Klass(i16);
    var kli32: Klass = Klass(i32);
    var kli64: Klass = Klass(i64);
    var klu8: Klass = Klass(u8);
    var klu16: Klass = Klass(u16);
    var klu32: Klass = Klass(u32);
    var klu64: Klass = Klass(u64);
    var klf64: Klass = Klass(f64);
    var klf32: Klass = Klass(f32); 
    var klf16: Klass = Klass(f16);
    
    
    kli8.Check(i8)
    kli16.Check(i16)
    kli32.Check(i32)
    kli64.Check(i64)
    klu8.Check(u8)
    klu16.Check(u16)
    klu32.Check(u32)
    klu64.Check(u64)
    klf64.Check(f64)
    klf32.Check(f32)
    klf16.Check(f16)

    0
}



