/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_01_a01_03_neg

  @Level:         1

  @Assertion:    10.1.3.1(1) If two functions in the candidate set have 
                 different scope levels, the function with the higher 
                 scope level is selected when the function is overloaded
  
  @Description:  Scopes in enclosed routines. Compiler do not  connect 
                 call SCheck(i8) with below description inside routine
                 and emit error. Is it right ?

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

class MyInt32  {
    var my : Int32 =0;
    init(x: Int32) {
        this.my = x
    }
}

func SCheck(arg:Int64) {
    let i8 :Int8 = Int8(arg & 0xff)
    let i16:Int16 = Int16(arg & 0xffff)
    let i32 :Int32 = Int32(arg & 0xffffffff)
    SCheck(i8) 
    
    func SCheck(arg:Int8) {
    }
    func SCheck(arg:Int16) {
    }
    func SCheck(arg:Int32) {
    }
    func SCheck(arg:MyInt32) {
    }

    SCheck(MyInt32(0x60006B0Ai32))

}



main(ina :Array<String>) {
    0
}

