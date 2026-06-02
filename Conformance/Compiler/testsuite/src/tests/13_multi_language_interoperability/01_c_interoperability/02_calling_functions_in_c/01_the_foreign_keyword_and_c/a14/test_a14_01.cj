/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a14_01

  @Level:         1

  @Assertion:    13.1.2.1(14) 
                 foreign { 
                   func foo(): Unit 
                   func bar(): Unit 
                 } 

  @Description:  Example from specification.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

foreign { 
    func foo(): Unit 
    func bar(): Unit 
} 

main() {
}