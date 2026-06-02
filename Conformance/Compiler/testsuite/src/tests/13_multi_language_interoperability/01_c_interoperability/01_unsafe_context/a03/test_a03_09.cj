/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a03_09

  @Level:         1

  @Assertion:    13.1.1(3) 2. qualify a function definition

                 unsafeFunction
                 : 'unsafe' functionDefinition
                 ;

  @Description:  Unsafe cannot be applied to extend definition.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

unsafe extend Int32 {
  func printSize() {
    print(4)
  }
}

main() {
  12.printSize()
}