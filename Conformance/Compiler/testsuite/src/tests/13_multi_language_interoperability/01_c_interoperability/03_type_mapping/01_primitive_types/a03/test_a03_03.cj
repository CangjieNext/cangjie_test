/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_01_a03_03

  @Level:         1

  @Assertion:    13.1.3.1(3)  Note: 1. Because the size of int and long types in C is indeterminate, 
  so the programmers need to specify the corresponding type in the Cangjie programming language. 
  2. IntNative/UIntNative in C interoperation scenarios, it is consistent with ssize_t/size_t in C language. 
  3. In C interoperation scenarios, like C, the Unit type can only be used as a return type in CFunc
   and as a generic parameter to CPointer.

  @Description:  Variable of type 'Unit' cannot be used as argument in foreign
                 function.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

foreign func func_01(x: Unit) : Int32

main() {
    var U : Unit = ()
    var Value : Int32 = unsafe { func_01(U); };
}