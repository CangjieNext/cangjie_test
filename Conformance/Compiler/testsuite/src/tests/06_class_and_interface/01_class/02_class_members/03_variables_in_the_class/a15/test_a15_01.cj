/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a15_01

  @Level:         1

  @Assertion: 6.1.2.3(15)
              static can be used together with private, protected or public.

  @Description: Check that the 'static' modifier can be used together with access modifiers

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class A {
    static public var spub_v = 11
    public static var pubs_v = false

    static public let spub_l = 'a'
    public static let pubs_l = "IiiIIii"

    static protected var sprot_v = { => 'x'}
    protected static var prots_v = [1, 2, 3, 1]

    static protected let sprot_l = (false, 'm')
    protected static let prots_l = -2..2:1

    static private var spriv_v = 1.5e-16
    private static var privs_v = 0b10101u8

    static private let spriv_l = .0000001f32
    private static let privs_l = 0xfffffu64

    static func test() {
        Assert.equals(11, A.spub_v)
        Assert.equals(false, A.pubs_v)

        Assert.equals('a', A.spub_l)
        Assert.equals("IiiIIii", A.pubs_l)

        Assert.equals('x', A.sprot_v())
        Assert.equals([1, 2, 3, 1], A.prots_v)

        Assert.equals(false, A.sprot_l[0])
        Assert.equals('m', A.sprot_l[1])
        Assert.equals(-2..2:1, A.prots_l)

        Assert.approxEquals(1.5e-16, A.spriv_v)
        Assert.equals(0b10101u8, A.privs_v)

        Assert.approxEquals(.0000001f32, A.spriv_l)
        Assert.equals(0xfffffu64, A.privs_l)
    }
}

main() {
    A.test()
}