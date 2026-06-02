/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a16_12

  @Level:         1

  @Assertion: 6.1.2.4(16)
              Meanwhile, a static function must have a function body.

  @Description: Check that a static function with parameters
                and with the Nothing return type can not omit the body

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    static func a(x: String, y: String): Nothing
}

main() {
}