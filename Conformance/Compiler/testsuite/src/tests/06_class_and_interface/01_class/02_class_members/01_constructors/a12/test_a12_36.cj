/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a12_36

  @Level:         1

  @Assertion: 6.1.2.1(12)
              The syntax of the member variable parameter is the same as that
              defined outside the primary constructor.

  @Description: Check that a var member variable parameter can not be modified
                with both 'private' and 'protected'

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006175

*/

class A {
  A(private protected var x: Int64) {}
}

main() {
}