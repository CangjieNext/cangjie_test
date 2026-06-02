/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a28_17

  @Level:         1

  @Assertion: 6.1.2.4(28)
              private: A function declared with modifier private can only be accessed in this class.
              This means that private member functions cannot be called
              through this class instance and cannot be inherited.

  @Description: Check that a private static generic function
                with parameters and with a non-Unit return type
                can not be accessed outside the class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006264

*/

class Test {
    private static func f<T>(x: Int64) {
        return 1
    }
}

main() {
    Test.f<Unit>(1)
}