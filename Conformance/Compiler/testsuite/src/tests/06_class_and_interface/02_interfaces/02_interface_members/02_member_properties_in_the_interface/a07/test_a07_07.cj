/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a07_07

  @Level:         1

  @Assertion: 6.2.2.2(7)
              The default implementation is not part of the inheritance semantics,
              so override redef super cannot be used.

  @Description: Check that a default implementation of a static immutable property
                can not be accessed through 'super' in a redefined property
                of a subinterface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006368, 0006124

  @Comment: This assertion does not make much sence.
            For now check that 'super' can not refer to the default implementation of the superinterface
            in overridden and redefined functions and properties.
            If the meaning is clarified in the issue 0006368, redo the assertion

*/

interface I {
    static prop p: Int64 {
        get() {
            1
        }
    }
}

interface J <: I {
    redef static prop p: Int64 {
        get() {
            super.p
        }
    }
}

main() {
}