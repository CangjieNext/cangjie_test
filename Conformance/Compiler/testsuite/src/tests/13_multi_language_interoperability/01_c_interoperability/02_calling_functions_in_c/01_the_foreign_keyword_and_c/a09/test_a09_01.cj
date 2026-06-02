/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a09_01

  @Level:         1

  @Assertion:    13.1.2.1(9)
                 foreign func foo(): Unit 
                 foreign var a: Int32 = 0 // compiler error 
                 foreign func bar(): Unit { // compiler error 
                   return 
                 } 

  @Description:  The first example.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

foreign func foo(): Unit

main() {
}