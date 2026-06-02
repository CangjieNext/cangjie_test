/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a12_05

  @Level:         1

  @Assertion: 6.2.2.1(12)
              The open modifier is optional when defining instance member functions in interfaces,
              as they have the semantics of open by default.

  @Description: Check that a static generic function with a body
                can not be modified with the 'open' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006367

  @Comment: The specification does not say this clearly.
            But in other chapters it's stated that static functions can not be open.
            And this assertion is the best place for such tests in the interface chapter.

*/

interface I {
    open static func f<T>() {}
}

main() {
}