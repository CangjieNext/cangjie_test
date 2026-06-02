/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_03_01_a03_02

  @Level:         1

  @Assertion:     5.3.1(3) The syntax of named arguments can only be used when the name of corresponding parameters 
                  are followed by the symbol ! in the function definition, otherwise the syntax of named arguments 
                  cannot be used. 

  @Description:   Check that function with named parameters can't be invoked without binded by names parameters.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

class myClass {
  func f0(f: Int32, g!: Int32): String { 
    "${f + g}"
  } 
}


main() {
  var myClassImpl = myClass()
  myClassImpl.f0(2, 16)
}
