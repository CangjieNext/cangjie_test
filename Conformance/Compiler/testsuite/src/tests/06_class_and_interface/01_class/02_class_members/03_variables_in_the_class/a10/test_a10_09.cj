/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a10_09

  @Level:         1

  @Assertion: 6.1.2.3(10)
              Private variables cannot be accessed outside of a class through a class instance
              and cannot be inherited.

  @Description: Check that a private immutable static variable is not visible in a subclass scope

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006236

*/

open class A {
    static private let x = 1
}

class B <: A {
    func test() {
        x
    }
}

main() {
}