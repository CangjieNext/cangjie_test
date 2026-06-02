/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a17_06

  @Level:         1

  @Assertion: 6.1.2.4(17)
              Static member functions cannot access instance member variables,
              cannot invoke instance member functions,
              and cannot reference the super or this keyword in its body.

  @Description: Check that a static function can not reference
                an instance generic function as an object

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    static func f() {
        g<Rune>
    }

    func g<T>() {}
}

main() {
}