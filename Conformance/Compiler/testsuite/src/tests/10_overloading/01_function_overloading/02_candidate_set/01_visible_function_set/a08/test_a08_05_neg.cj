/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a08_05_neg

  @Level:         1

  @Assertion:    10.1.2.1(8) 3) If the function call expression is in the non-static context
                 of class/interface/struct, the member methods of class/interface/struct is included;


  @Description:  Compiler emits error due to using undefined method in structure

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

import utils.assert.Assert


struct STRUCT {
   
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
        Assert.equals(i8, arg)
    }
    func Check(arg:Int16) {
        Assert.equals(i16, arg)
    }
    func Check(arg:Int32) {
        Assert.equals(i32, arg)
    }
    func Check(arg:Int64) {
        Assert.equals(i64, arg)
    }
    
    func Check(arg:UInt8) {
        Assert.equals(u8, arg)
    }
    func Check(arg:UInt16) {
        Assert.equals(u16, arg)
    }
    func Check(arg:UInt32) {
        Assert.equals(u32, arg)
    }
    func Check(arg:UInt64) {
        Assert.equals(u64, arg)
    }
    
    func Check(arg:Float64) {
        Assert.equals(f64, arg)
    }
    func Check(arg:Float32) {
        Assert.equals(f32, arg)
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

    if ( Assert.getRuntimeZero(ina) == 0) {
        i8  = -8i8
        i16 = -16i16
        i32 = -32i32
        i64 = -64i64
        u8  =  8u8
        u16 =  16u16
        u32 =  32u32
        u64 =  64u64
        f16 =  16.0f16
        f32 =  32.0f32
        f64 =  64.0f64
    }
  var kli8: STRUCT = STRUCT(i8);
  var kli16: STRUCT = STRUCT(i16);
  var kli32: STRUCT = STRUCT(i32);
  var kli64: STRUCT = STRUCT(i64);
  var klu8: STRUCT = STRUCT(u8);
  var klu16: STRUCT = STRUCT(u16);
  var klu32: STRUCT = STRUCT(u32);
  var klu64: STRUCT = STRUCT(u64);
  var klf64: STRUCT = STRUCT(f64);
  var klf32: STRUCT = STRUCT(f32); 
  var klf16: STRUCT = STRUCT(f16);


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



