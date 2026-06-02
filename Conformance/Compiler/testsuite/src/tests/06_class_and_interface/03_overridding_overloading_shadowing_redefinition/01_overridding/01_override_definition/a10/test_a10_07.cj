/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a10_07

  @Level:         1

  @Assertion: 6.3.1.1(10)
              Static functions cannot cover instance functions.

  @Description: Check that a class can not define a static function
                with the same name and signature as an instance abstract function
                in an interface while using the 'override' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    func f(): Unit
}

abstract class A <: I {
    public override static func f() {}
}

main() {
}