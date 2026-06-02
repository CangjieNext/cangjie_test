/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a24_24

  @Level:         1

  @Assertion: 6.1.2.4(24)
              A generic static function defined in a class can be invoked
              as long as legal type arguments are provided for the generic class
              and generic static function of the class

  @Description: Check that a generic static function without constraints
                without parameters an a non-Unit return type
                can not be instantiated with the wildcard pattern

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    static func f<T>() {
        return 1
    }
}

main() {
    Test.f<_>()
}