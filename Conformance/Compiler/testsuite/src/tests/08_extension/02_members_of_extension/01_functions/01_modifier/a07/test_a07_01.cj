/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a07_01

  @Level:         1

  @Assertion:   8.2.1.1(7)
                class Foo {}

                extend Foo {
                    static func f() {}
                }

  @Description: Checks the given example.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

class Foo {}

extend Foo {
    static func f() {}
}

main() {
    return 0
}
