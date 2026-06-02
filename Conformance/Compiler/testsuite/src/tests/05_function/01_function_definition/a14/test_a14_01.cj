/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a14_01

  @Level:         1

  @Assertion:     5.1(14) The operations in the following example are forbidden. 
    func f(a: Int64): Int64 { a } 
    // f = {a: Int64 => a + 1}          // compile-time error 

  @Description:   Example from specification.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func f(a: Int64): Int64 { a } 
main() {
  f = {a: Int64 => a + 1}
}
