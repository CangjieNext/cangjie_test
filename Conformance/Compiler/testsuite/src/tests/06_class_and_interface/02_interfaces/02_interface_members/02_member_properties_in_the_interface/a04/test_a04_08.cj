/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a04_08

  @Level:         1

  @Assertion: 6.2.2.2(4)
              this can be used in the default implementation of an instance member function,
              and the type of this is the current interface.

  @Description: Check that 'this' can not be used in a default implementation
                of the getter of a static immutable property

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006374, 0006124

*/

interface I {
    static prop p: Int64 {
        get() {
            this
            1
        }
    }
}

main() {
}