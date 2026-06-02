/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a12_05

  @Level:         1

  @Assertion:     5.1.2.2(12) When a function is called, the parameter values are evaluated from left to right 
                  according to the sequence of definition.
  
  @Description:   Check that parameter value can't use as default value parameter which defined later: struct member 
                  static func.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

struct myStruct {

  static func myStructStaticFunc(b!: Int32 = c, c!: Int32 = 4) {
    b + c
  }
}

main() {
}
