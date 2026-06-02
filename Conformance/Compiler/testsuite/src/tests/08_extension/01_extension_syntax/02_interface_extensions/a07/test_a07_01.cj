/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a07_01

  @Level:         1

  @Assertion:   8.1.2(7)
                interface I1 {
                  func f1(): Unit
                }
                interface I2 {
                  func f2(): Unit
                }
                interface I3 {
                  func f3(): Unit
                }
                class Foo {}
                extend Foo <: I1 & I2 & I3 {
                  public func f1() {}
                  public func f2() {}
                  public func f3() {}
                }

  @Description: Checks that sample is compiled w/o errors.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single


*/

interface I1 {
    func f1(): Unit
}

interface I2 {
    func f2(): Unit
}

interface I3 {
    func f3(): Unit
}

class Foo {}

extend Foo <: I1 & I2 & I3 {
    public func f1() {}
    public func f2() {}
    public func f3() {}
}

main() { }
