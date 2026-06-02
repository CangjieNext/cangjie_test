/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a03_09

  @Level:         1

  @Assertion: 6.2.2.1(3)
              Abstract functions can have named parameters, but cannot have parameter default values.

  @Description: Check that named parameters in interfaces follow the rules for functions parameters:
                a named parameter can not be placed in between unnamed parameters
                in a static function with a body

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    static func f(x: Bool, y!: Rune, z: Unit) {
        return {a: Int64, b: Int64 => a + b}
    }
}

main() {
}