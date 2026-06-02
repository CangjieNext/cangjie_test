/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a13_02

  @Level:         1

  @Assertion:     5.1(13) The function name cannot be assigned. That is, the function name cannot appear in the 
                  program as an expression lvalue.

  @Description:   Check that function can not be used in left side of expression:
                  in class constructor by name.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
class myClass {
  myClass(in_val:String) {
    this.myClassFunc = in_val
  }
  func myClassFunc(in_val:Float32): String {
    in_val.toString()
  }
} 
main() {
}
