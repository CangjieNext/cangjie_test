/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a44_107

  @Level:         1

  @Assertion: 6.1.2.4(44)
              redef: When a static function redefines a static function that inherits from a parent type,
              it can be declared with an optional modifier redef.

  @Description: Check that a static generic function with the 'private' access modifier
                that overloads a function in its own class
                can not be defined with the 'redef' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    static func f<T>() {}
    redef private static func f<T>(x: Int64) {}
}

main() {
}