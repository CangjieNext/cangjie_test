/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a08_06_neg

  @Level:         1

  @Assertion:    10.1.2.1(8) 3) If the function call expression is in the non-static context
                 of class/interface/struct, the member methods of class/interface/struct is included;


  @Description:  Compiler emits error due to using undefined method in interface

  @Mode:         compileonly

  @Negative:     yes

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
//    func Verify(arg:Float16) :Unit {
//    }

}

class CLFace <: InterFace{
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

var Face :CLFace = CLFace();

  Face.Verify(i8)
  Face.Verify(i16)
  Face.Verify(i32)
  Face.Verify(i64)
  Face.Verify(u8)
  Face.Verify(u16)
  Face.Verify(u32)
  Face.Verify(u64)
  Face.Verify(f64)
  Face.Verify(f32)
  Face.Verify(f16)

    0
}



