/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a02_01

  @Level:         1

  @Assertion: 6.1.2.4(2)
              Functions in classes are classified into instance member functions, static member functions.

  @Description: Check that functions in classes could be static members or instance members:
                static members are accessible through the class name and instance members
                are accessible through an instance object.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class Test {
    public func f1() {
        return 1
    }
    public func f2<T>(x: Int64) {
        return 2
    }
    protected func f3(x: String) {
        return 3
    }
    protected func f4<T>(x: Bool) {
        return 4
    }
    private func f5(x: Rune) {
        return 5
    }
    private func f6<T>(x: (Rune, Bool)) {
        return 6
    }
    func f7(x: () -> Int64) {
        return 7
    }
    func f8<T>(x: Float64) {
        return 8
    }
    public open func f9(x: Unit) {
        return 9
    }

    static public func f10(x: Array<Bool>) {
        return 10
    }
    static public func f11<T>(x: UInt64) {
        return 11
    }
    static protected func f12(x: Range<Int8>) {
        return 12
    }
    static protected func f13<T>(x: UInt32) {
        return 13
    }
    static private func f14(x: Bool) {
        return 14
    }
    static private func f15<T>(x: UInt16) {
        return 15
    }
    static func f16(x: String) {
        return 16
    }
    static func f17<T>(x: UInt8) {
        return 17
    }
    
    static func test() {
        let obj = Test()
        Assert.equals(1, obj.f1())
        Assert.equals(2, obj.f2<Any>(14))
        Assert.equals(3, obj.f3("String"))
        Assert.equals(4, obj.f4<Bool>(false))
        Assert.equals(5, obj.f5(r';'))
        Assert.equals(6, obj.f6<String>((r'c', true)))
        Assert.equals(7, obj.f7(obj.f1))
        Assert.equals(8, obj.f8<Rune>(1.00001))
        Assert.equals(9, obj.f9(()))

        Assert.equals(10, Test.f10([false, false, true, false]))
        Assert.equals(11, Test.f11<Test>(14u64))
        Assert.equals(12, Test.f12(1i8..10i8:1))
        Assert.equals(13, Test.f13<Float32>(1u32))
        Assert.equals(14, Test.f14(false))
        Assert.equals(15, Test.f15<Int8>(0u16))
        Assert.equals(16, Test.f16("NnNNnnnNNNnnNN"))
        Assert.equals(17, Test.f17<Array<Unit>>(125u8))
    }
}

main() {
    Test.test()
}