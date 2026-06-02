/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a01_06_resov

  @Level:         1

  @Assertion:    10.1.1(1) Function overloading occurs if multiple functions with 
                 the same name but different parameter types reside in the same scope.
                 For details, see Function Overloading Definition.

  @Description:  Attemp to use overloading by function result
                 function 'Check' has overload conflicts

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/




func Check(arg1:Int32, arg2!:Int32 = 1) : Int8 {
    Int8(arg) + Int8(arg2)
}
func Check(arg:Int32, arg2!:Int32 = 1) :Int16 { 
    Int16(arg) + Int16(arg2)
}

main(ina :Array<String>) {
    var i8  : Int8;
    var i16 : Int16;
    i8 =  Check(-1, 1)
    i16 = Check(5i32,7i32)
    0
}