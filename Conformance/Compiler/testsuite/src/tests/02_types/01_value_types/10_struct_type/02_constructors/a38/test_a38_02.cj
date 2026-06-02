/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a38_02

  @Level:         1

  @Assertion: 2.1.10.2(38)
              If called, it must be at the first expression in the constructor body,
              without any expression or declaration before it.

  @Description: Check that this can not be called after a variable declaration

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Comment: This is the continuation of the previous assertion:
            It is allowed to invoke other constructors via this in a constructor.

*/

struct A {
    init(x: Int64) {
        let a = 1
        this()
    }
    init() {}
}

main() {
}