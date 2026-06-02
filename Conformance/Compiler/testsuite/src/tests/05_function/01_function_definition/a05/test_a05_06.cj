/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a05_06

  @Level:         1

  @Assertion:     5.1(5) List of optional type parameters following the function name. The type parameter list is 
                  enclosed by <>. Multiple type parameters are separated by comma.

  @Description:   Check that function definition wrong syntax of list of optional type parameters will produce error: 
                  each type parameter enclosed by <>.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func concatTwoTypeValues<T><S>(x: T, y: S):String where T <: ToString,  S <: ToString {
  return "${x.toString()} + ${y.toString()}"
}
main() {
}
