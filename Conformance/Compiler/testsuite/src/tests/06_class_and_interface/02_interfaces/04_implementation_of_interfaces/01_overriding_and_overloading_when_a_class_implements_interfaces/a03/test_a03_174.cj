/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a03_174

  @Level:         1

  @Assertion: 6.2.4.1(3)
              The function name and parameter list of the implemented function
              must be the same as the corresponding function in the interface.

  @Description: Check that an enum can not implement an abstract operator
                from a superinterface by defining the same operator with less parameters
                with the 'override' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    operator func ()(x1: Int64, x2: Int64): Unit
}

enum A <: I {
    E(Bool)
    public override operator func ()(x1: Int64) {}
}

main() {
}