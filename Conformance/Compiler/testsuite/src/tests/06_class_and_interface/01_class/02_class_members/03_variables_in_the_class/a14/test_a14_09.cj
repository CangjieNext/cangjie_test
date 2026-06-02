/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a14_09

  @Level:         1

  @Assertion: 6.1.2.3(14)
              If a variable in a class is modified with static, it is a static variable of the class.

  @Description: Check that an immutable variable modified with the 'static' modifier
                is static and can not be accessed through a class instance

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    static let x = 1

    func test() {
        Test().x
    }
}

main() {
}