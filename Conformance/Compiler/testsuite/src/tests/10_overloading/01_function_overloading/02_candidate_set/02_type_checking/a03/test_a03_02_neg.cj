/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_02_a03_02_neg

  @Level:         1

  @Assertion:   10.1.2.2(3) 1.If an actual parameter has multiple types and 
                one of the types of the parameter can pass the type check in 
                the type check phase, it is considered that the parameter can
                pass the type check of the candidate function.
  
  @Description:  Overloading with arrow (functional/procedural) type
                 Emit error as could not find approprite pattern
                 
  @Mode:         compileonly

  @Negative:     yes

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



class Klass  {

    static func check(arg: Int8){
    }
    static func check(arg: Int16){
    }


    public static func fv(f:(Int8)->Int8,arg:Int8) {
        check(f(arg))
   }

    public static func fv(f:(Int16)->Int16,arg:Int16) {
        check(f(arg))
   }


}


func neg(arg:Int8) {
    -arg
}

func neg(arg:Int16) {
    -arg
}





main(ina :Array<String>) {
    Klass.fv(neg,i32)

    0
}



