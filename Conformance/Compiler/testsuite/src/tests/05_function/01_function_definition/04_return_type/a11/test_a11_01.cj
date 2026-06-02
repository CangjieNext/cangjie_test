/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a11_01

  @Level:         1

  @Assertion:     5.1.4(11) Note that the return value of a function has the semantics that defined by let. 

  @Description:   Check that function return value can not be changed:
                  inside other function.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
func myTestedFunc(a: Int64): Int64 { a } 
func myFunc(x: Int64): Int64 {
    myTestedFunc(x) = x * 2
}
main() {
}
