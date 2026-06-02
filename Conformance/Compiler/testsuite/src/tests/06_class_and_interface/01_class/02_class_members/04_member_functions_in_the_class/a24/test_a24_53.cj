/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a24_53

  @Level:         1

  @Assertion: 6.1.2.4(24)
              A generic static function defined in a class can be invoked
              as long as legal type arguments are provided for the generic class
              and generic static function of the class

  @Description: Check that a generic static function with constraints
                with parameters an a non-Unit return type
                can not be instantiated with a variable name

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

let x = 1

class Test {
    static func f<T>(a: String, b: String) where T <: Object {
        return 1
    }
}

main() {
    Test.f<x>("ajf", "")
}