/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a03_051

  @Level:         1

  @Assertion: 6.2.4.1(3)
              The function name and parameter list of the implemented function
              must be the same as the corresponding function in the interface.

  @Description: Check that a class can not implement an abstract operator
                from a superinterface by defining a different opeartor
                with the same parameter list
                with the 'override' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    operator func ()(x: Int64): Unit
}

class A <: I {
    public override operator func [](x: Int64) {}
}

main() {
}