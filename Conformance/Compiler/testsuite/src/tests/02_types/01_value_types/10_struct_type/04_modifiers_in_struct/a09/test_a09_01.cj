/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a09_01

  @Level:         1
  @Assertion:       2.1.10.4(9) Members modified with static are static members, and static members are members of type
                    struct, not members of struct instances.

  @Description:     Check that static members can be accessed without creating an instance.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue: 0006124

*/

import utils.assert.Assert

struct S {
    static let statV: Int64 = 6
    static prop statP: Int64 {
        get() { 7 }
    }
    static func statF() { 8 }
    static func statT<T>() { 0 }

    // Now it's impossible to instantiate the struct.
    private init() {}

    static func test() {
        Assert.equals(6, S.statV)
        Assert.equals(7, S.statP)
        Assert.equals(8, S.statF())
        Assert.equals(0, S.statT<Nothing>())
    }
}

main() {
    Assert.equals(6, S.statV)
    Assert.equals(7, S.statP)
    Assert.equals(8, S.statF())
    Assert.equals(0, S.statT<Nothing>())
    S.test()
}
