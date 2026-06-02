/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a05_05

  @Level:         1

  @Assertion:     5.1.2.2(5) Functions explicitly or implicitly modified by the open keyword in a class or interface
                  cannot have optional parameters.

  @Description:   Check that open class member function with default implementation can't have optional parameter.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

  @Issue:         6200

  @Comment:      This test failed because of compiler bug

*/

open class myClass0 {
  open public func myFunc(a!: Int32 = 2): Int32 { a - 1}
}

main() {
}
