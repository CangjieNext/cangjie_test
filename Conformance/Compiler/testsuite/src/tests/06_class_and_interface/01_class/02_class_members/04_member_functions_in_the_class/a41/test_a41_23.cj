/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a41_23

  @Level:         1

  @Assertion: 6.1.2.4(41)
              The instance members of the class cannot be accessed in the static member function.

  @Description: Check that a public generic instance function can not be accessed
                in a static non-generic function

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class Test {
    public func x<T>() {}
    static func f() {
        x<Unit>()
    }
}

main() {
}