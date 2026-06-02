/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a04_06

  @Level:         1

  @Assertion: 6.2.2.2(4)
              this can be used in the default implementation of an instance member function,
              and the type of this is the current interface.

  @Description: Check that 'this' can not be used in a default implementation
                of a static non-generic function

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006374

*/

interface I {
    static func f() {
        this
        1
    }
}

main() {
}