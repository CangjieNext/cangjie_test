/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a06_02

  @Level:         1

  @Assertion: 6.2.2.1(6)
              The following are examples of errors.
              interface MyInterface {
                public func f1(): Unit // Access modifiers cannot be used
                private static func f2(): Unit // Access modifiers cannot be used
              }

  @Description: Check the first negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface MyInterface {
    private static func f2(): Unit // Access modifiers cannot be used
}

main() {
}