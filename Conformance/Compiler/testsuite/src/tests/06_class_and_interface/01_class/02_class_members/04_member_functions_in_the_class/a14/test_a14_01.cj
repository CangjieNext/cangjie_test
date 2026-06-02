/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a14_01

  @Level:         1

  @Assertion: 6.1.2.4(14)
              Static member functions are declared with the static keyword,
              it does not belong to an instance, but to the type it is in.

  @Description: Check that if member functions are declared with the 'static' keyword
                the are accessible through the type

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    static func f1() {
        return 1
    }
    static func f2(x: Int64) {
        return 2
    }
    static func f3<T>() {
        return 3
    }
    static func f4<T>(x: Bool) {
        return 4
    }

    public static func f5() {
        return 5
    }
    public static func f6(x: Float64) {
        return 6
    }
    public static func f7<T>() {
        return 7
    }
    public static func f8<T>(x: String) {
        return 8
    }

    protected static func f9() {
        return 9
    }
    protected static func f10(x: Rune) {
        return 10
    }
    protected static func f11<T>() {
        return 11
    }
    protected static func f12<T>(x: Unit) {
        return 12
    }

    private static func f13() {
        return 13
    }
    private static func f14(x: Object) {
        return 14
    }
    private static func f15<T>() {
        return 15
    }
    private static func f16<T>(x: (String, UInt64)) {
        return 16
    }

    func test() {
        Assert.equals(1, Test.f1())
        Assert.equals(2, Test.f2(900))
        Assert.equals(3, Test.f3<Bool>())
        Assert.equals(4, Test.f4<String>(false))

        Assert.equals(5, Test.f5())
        Assert.equals(6, Test.f6(1.13e-4))
        Assert.equals(7, Test.f7<Int16>())
        Assert.equals(8, Test.f8<IntNative>("[[[[[["))

        Assert.equals(9,  Test.f9())
        Assert.equals(10, Test.f10(r's'))
        Assert.equals(11, Test.f11<Array<Rune>>())
        Assert.equals(12, Test.f12<Rune>(()))

        Assert.equals(13, Test.f13())
        Assert.equals(14, Test.f14(Object()))
        Assert.equals(15, Test.f15<Float16>())
        Assert.equals(16, Test.f16<Range<UInt32>>(("", 0u64)))
    }
}

main() {
    Test().test()
}