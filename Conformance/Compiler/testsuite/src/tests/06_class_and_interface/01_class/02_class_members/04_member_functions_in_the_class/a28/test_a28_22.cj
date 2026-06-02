/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a28_22

  @Level:         1

  @Assertion: 6.1.2.4(28)
              private: A function declared with modifier private can only be accessed in this class.
              This means that private member functions cannot be called
              through this class instance and cannot be inherited.

  @Description: Check that a private instance generic function
                with the empty signature
                is not visible in a subclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006264

*/

open class A {
    private func f<T>() {}
}

class Test <: A {
    func test() {
        f<Unit>()
    }
}

main() {
}