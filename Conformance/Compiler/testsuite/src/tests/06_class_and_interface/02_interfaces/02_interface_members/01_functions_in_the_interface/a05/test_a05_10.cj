/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a05_10

  @Level:         1

  @Assertion: 6.2.2.1(5)
              Functions defined in the interface can be accessed outside the interface,
              with the same effect as public, no access modifiers are allowed.

  @Description: Check that an instance function without a body
                can not have the 'protected' access modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    protected func f(): Unit
}
main() {
}

