/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a12_54

  @Level:         1

  @Assertion: 2.1.10.2(12)
              The syntax of the member variable parameter is the same as that
              defined outside the primary constructor.

  @Description: Check that a var member variable parameter can not
                declare several types

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

struct A {
    A(var x: Int64 : String : Bool) {}
}

main() {
}