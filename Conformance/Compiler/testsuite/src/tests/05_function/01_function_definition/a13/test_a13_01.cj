/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a13_01

  @Level:         1

  @Assertion:     5.1(13) The function name cannot be assigned. That is, the function name cannot appear in the 
                  program as an expression lvalue.

  @Description:   Check that function can not be used in left side of expression:
                  inside other function by name.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func myTestedFunc(a: Int64): Int64 { a } 
func myFunc(x: Int64): Int64 {
  myTestedFunc = x * 2
}
main() {
}
