/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a21_02_neg

  @Level:         1

  @Assertion:    10.1.2.1(21) 3) If T has a super class, the () operator overload
                  function inherited from the super class is also included.  
  
  @Description:  Compiler emits error, super class has operator() for int32 
                 
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



open class Parent  {

    public open operator func ()(arg: Int8){
    }
    public open operator func ()(arg: Int16){
    }

}

open class Klass <: Parent {

    override open public operator func ()(arg:Int8) {
        var Par:Parent = Parent()
        Par(arg)
    }
    override open public operator func ()(arg:Int32) {
        var Par:Parent = Parent()
        Par(arg)
    }

}


main(ina :Array<String>) {
    var klass : Klass = Klass();
    klass(i8)
    klass(i16)
    klass(i32)

    0
}



