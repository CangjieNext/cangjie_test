/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a60_04

  @Level:         1

  @Assertion: 6.1.2.1(60)
              The compiler analyzes the dependency between all constructors.
              If a cyclic invoking is performed, an error is reported.

  @Description: Check that two constructors calling eache other through 'this'
                causes an error

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    init(x: Int64) {
        this(0.1)
    }

    init(x: Float64) {
      this(1)
    }
}

main() {
}