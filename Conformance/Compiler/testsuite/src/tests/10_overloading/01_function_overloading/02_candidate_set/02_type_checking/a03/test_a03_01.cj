/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_02_a03_01

  @Level:         1

  @Assertion:   10.1.2.2(3) 1.If an actual parameter has multiple types and 
                one of the types of the parameter can pass the type check in 
                the type check phase, it is considered that the parameter can
                pass the type check of the candidate function.
  
  @Description:  Overloading with arrow (functional/procedural) type
                 Compiler successfully solves overloading in functions fv
                 
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



class Klass  {

    static func check(arg: Int8){
        Assert.equals(-i8, arg)
    }
    static func check(arg: Int16){
        Assert.equals(-i16, arg)
    }

    static func check(arg:Int32) {
        Assert.equals(-i32, arg)
    }
    static func check(arg:Int64) {
        Assert.equals(-i64, arg)
    }
        
    static func check(arg:Float16) {
        Assert.equals(-f16, arg)
    }
    static func check(arg:Float32) {
        Assert.equals(-f32, arg)
    }
    static func check(arg:Float64) {
        Assert.equals(-f64, arg)
    }

    public static func fv(f:(Int8)->Int8,arg:Int8) {
        check(f(arg))
   }

    public static func fv(f:(Int16)->Int16,arg:Int16) {
        check(f(arg))
   }

    public static func fv(f:(Int32)->Int32,arg:Int32) {
        check(f(arg))
   }

    public static func fv(f:(Int64)->Int64,arg:Int64) {
        check(f(arg))
   }

    public static func fv(f:(Float16)->Float16,arg:Float16) {
        check(f(arg))
   }

    public static func fv(f:(Float32)->Float32,arg:Float32) {
        check(f(arg))
   }

    public static func fv(f:(Float64)->Float64,arg:Float64) {
        check(f(arg))
   }

}


func neg(arg:Int8) {
    -arg
}
func same(arg:Int8) {
    arg
}

func neg(arg:Int16) {
    -arg
}
func same(arg:Int16) {
    arg
}

func neg(arg:Int32) {
    -arg
}
func same(arg:Int32) {
    arg
}

func neg(arg:Int64) {
    -arg
}
func same(arg:Int64) {
    arg
}

func neg(arg:Float16) {
    -arg
}
func same(arg:Float16) {
    arg
}

func neg(arg:Float32) {
    -arg
}
func same(arg:Float32) {
    arg
}

func neg(arg:Float64) {
    -arg
}
func same(arg:Float64) {
    arg
}




main(ina :Array<String>) {
    Klass.fv(neg,i8)
    Klass.fv(same,-i8)
    Klass.fv(neg,i16)
    Klass.fv(same,-i16)
    Klass.fv(neg,i32)
    Klass.fv(same,-i32)
    Klass.fv(neg,i64)
    Klass.fv(same,-i64)

    Klass.fv(neg,f16)
    Klass.fv(same,-f16)
    Klass.fv(neg,f32)
    Klass.fv(same,-f32)
    Klass.fv(neg,f64)
    Klass.fv(same,-f64)


    0
}



