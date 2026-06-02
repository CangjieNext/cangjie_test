/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a24_78

  @Level:         1

  @Assertion: 6.1.2.4(24)
              A generic static function defined in a class can be invoked
              as long as legal type arguments are provided for the generic class
              and generic static function of the class

  @Description: Check that a generic static function with constraints
                with the empty signature
                can not be instantiated with generic types that do not satisfy the constraints

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test<T1, T2> where T1 <: String, T2 <: Int64 {
    static func f<T1, T2>() where T1 <: T2 {}

    static func test() {
        f<T1, T2>()
    }
}

main() {
}