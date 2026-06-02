/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a18_02_neg

  @Level:         1

  @Assertion:    10.1.2.1(18) 5) If the function invocation is in the form of <object name>.f(...)
                 If the object type is a class, interface, struct or enum type and the type 
                 contains instance member method f, 
                 all member methods named f are included in the visible set.
  
  @Description:  Call with class w/o instance. Compiler emits error.
                 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


let i8 : Int8    = -8i8     
let i16: Int16   = -16i16   

class Klass <T> {
    public static func SCheck(arg:Int8) {
    }
    public static func SCheck(arg:Int16) {
    }
}


main(ina :Array<String>) {
    var i8 : Int8    =0;
    var i16: Int16   =0;
    Klass.SCheck(i8)

    0
}



