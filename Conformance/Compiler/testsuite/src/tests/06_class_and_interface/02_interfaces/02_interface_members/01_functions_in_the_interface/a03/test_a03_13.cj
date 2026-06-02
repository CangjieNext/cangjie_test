/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a03_13

  @Level:         1

  @Assertion: 6.2.2.1(3)
              Abstract functions can have named parameters, but cannot have parameter default values.

  @Description: Check that named parameters in interfaces follow the rules for functions parameters:
                an argument for a named parameter can not be passed without specifying the name
                during the call to a static function with a body

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    static func f(n!: Int64) {
        return { => 10}()
    }
    func g() {
        f(1)
    }
}

main() {
}