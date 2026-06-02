/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a06_44

  @Level:         1

  @Assertion: 6.2.4.1(6)
              The mut modifier of the implemented property
              must be the same as the corresponding property in the interface.

  @Description: Check that an enum that implements an interface can not
                change an instance mutable property without a default implementation
                to an immutable property while using the 'override' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I {
    mut prop p: Int64
}

enum A <: I {
    E
    public override prop p: Int64 {
        get() {
            1
        }
    }
}

main() {
}