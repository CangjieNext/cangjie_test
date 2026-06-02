/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a59_04

  @Level:         1

  @Assertion: 6.1.2.1(59)
              Outside the constructor, it is not allowed to call the constructor of this class through the this.

  @Description: Check that this constuctors can not be called as an initial value for
                a protected mutable instance member variable

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    init() {}

    protected var x = this()
}

main() {
}