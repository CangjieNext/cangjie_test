/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a05_02

  @Level:         1

  @Assertion: 6.2.3.1(5)
              Examples are as follows.
              interface I1 {
                func f1(): Unit {}
                static func f2(): Unit {}
              }
              interface I2 <: I1 {
                func f1(): Unit // error, 'f1' must has a new implementation
                static func f2(): Unit // error, 'f2' must has a new implementation
              }
              interface I3 <: I1 {
                override func f1(): Unit {} // ok
                redef static func f2(): Unit {} // ok
              }
              interface I4 <: I1 {
                func f1(): Unit {} // ok
                static func f2(): Unit {} // ok
              }

  @Description: Check the first negative case from the example

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I1 {
    func f1(): Unit {}
    static func f2(): Unit {}
}
interface I2 <: I1 {
    func f1(): Unit // error, 'f1' must has a new implementation
}
interface I3 <: I1 {
    override func f1(): Unit {} // ok
    redef static func f2(): Unit {} // ok
}
interface I4 <: I1 {
    func f1(): Unit {} // ok
    static func f2(): Unit {} // ok
}

main() {
}