/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a06_20

  @Level:         1

  @Assertion: 6.2.3.1(6)
              If a child interface inherits multiple parent interfaces
              that have default implementations of the same signature member,
              the child interface must provide its own version of the new default implementation
              or it will compile with an error.

  @Description: Check that if two parent interfaces
                have the same static function with a default implementation
                the child interface can not declare it with the 'redef' modifier
                and without a default implementation

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I1 {
    static func f() {}
}

interface I2 {
    static func f() {}
}

interface J <: I1 & I2 {
    redef static func f(): Unit
}

main() {
}