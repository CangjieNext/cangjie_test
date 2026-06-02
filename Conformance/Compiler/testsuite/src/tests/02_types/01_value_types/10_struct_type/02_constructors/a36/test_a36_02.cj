/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:02_01_10_02_a36_02

  @Level:         1

  @Assertion: 2.1.10.2(36)
              Also, this cannot be used as a separate expression.

  @Description: Check that 'this' can not be used after all the member variables are initialized

  @Mode: compileonly

  @Negative: no

  @Structure: single

  @Issue: 0006484

  @Comment: This is in the context of using 'this' inside an init constructor

*/

struct A {
    init() {
        x = 1
        this
    }
    let x: Int64
}

main() {
}