/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a13_05

  @Level:         1

  @Assertion:     5.1(13) The function name cannot be assigned. That is, the function name cannot appear in the 
                  program as an expression lvalue.

  @Description:   Check that function can not be used in left side of expression:
                  static struct function by name inside main method.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

struct myStruct {
  static func myStaticStructFunc() {
    'C'
  }
}

main() {
  myStruct.myStaticStructFunc = 'C'
}
