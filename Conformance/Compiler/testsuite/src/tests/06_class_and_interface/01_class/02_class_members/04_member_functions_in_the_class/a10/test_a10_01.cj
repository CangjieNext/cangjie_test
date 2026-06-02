/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a10_01

  @Level:         1

  @Assertion: 6.1.2.4(10)
              Non-abstract member functions are functions with a function body.

  @Description: Check that instance functions defined in a class can have a body

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006077

*/

import utils.assert.Assert

struct S {
    S(let x: Int64) {}
}

enum E {
    A(Int64) | B(Bool)
}

class Test {
    public func f1(x: Int8) {
        Assert.equals(1i8, x)
    }
    public func f2(x: Int16) {
        Assert.equals(2i16, x)
    }
    public func f3(x: Int32) {
        Assert.equals(3i32, x)
    }
    public func f4(x: Int64) {
        Assert.equals(4, x)
    }
    public func f5(x: UInt8) {
        Assert.equals(5u8, x)
    }
    public func f6(x: UInt16) {
        Assert.equals(6u16, x)
    }
    public func f7(x: UInt32) {
        Assert.equals(7u32, x)
    }
    public func f8(x: UInt64) {
        Assert.equals(8u64, x)
    }
    public func f9(x: Float16) {
        Assert.approxEquals(1.0f16, x)
    }
    public func f10(x: Float32) {
        Assert.approxEquals(2.0f32, x)
    }
    public func f11(x: Float64) {
        Assert.approxEquals(3.0f64, x)
    }
    public func f12(x: Rune) {
        Assert.equals(r'n', x)
    }
    public func f13(x: Bool) {
        Assert.equals(false, x)
    }
    public func f14(x: Unit) {
        Assert.isTrue(x is Unit)
    }
    public func f15(x: String) {
        Assert.equals("[]", x)
    }
    public func f16(x: (Int64, Int64)) {
        Assert.equals(100, x[0])
        Assert.equals(-100, x[1])
    }
    public func f17(x: (String, String, String)) {
        Assert.equals("\n", x[0])
        Assert.equals("\t", x[1])
        Assert.equals("\\", x[2])
    }
    public func f18(x: (Int64, Bool, (String, Rune))) {
        Assert.equals(8, x[0])
        Assert.equals(false, x[1])
        Assert.equals("oo", x[2][0])
        Assert.equals(r'o', x[2][1])
    }
    public func f19(x: Range<Int64>) {
        Assert.equals(1..17:2, x)
    }
    public func f20(x: () -> Unit) {
        Assert.isTrue(x() is Unit)
    }
    public func f21(x: (Int64) -> Unit) {
        Assert.isTrue(x(1) is Unit)
    }
    public func f22(x: () -> Int64) {
        Assert.equals(-100, x())
    }
    public func f23(x: (Float64) -> Int64) {
        Assert.equals(1010, x(10.1e2))
    }
    public func f24(x: S) {
        Assert.equals(90, x.x)
    }
    public func f25(x: E) {
        let t = match(x) {
            case E.A(y) => y
            case _ => 0
        }
        Assert.equals(66, t)
    }
    public func f26(x: VArray<Int64, $3>) {
        Assert.equals(0, x[0])
        Assert.equals(0, x[1])
        Assert.equals(0, x[2])
    }
    public func f27(x: Array<Rune>) {
        Assert.equals([r'p', r'p', r'p'], x)
    }
    public func f28(x: Test) {
        Assert.isTrue(x is Test)
    }

    public func f29(): Int8 {
        return 1i8
    }
    public func f30(): Int16 {
        return 2i16
    }
    public func f31(): Int32 {
        return 3i32
    }
    public func f32(): Int64 {
        return 4
    }
    public func f33(): UInt8 {
        return 5u8
    }
    public func f34(): UInt16 {
        return 6u16
    }
    public func f35(): UInt32 {
        return 7u32
    }
    public func f36(): UInt64 {
        return 8u64
    }
    public func f37(): Float16 {
        return 0.1f16
    }
    public func f38(): Float32 {
        return 0.01f32
    }
    public func f39(): Float64 {
        return 0.001
    }
    public func f40(): Rune {
        return r'c'
    }
    public func f41(): Bool {
        return true
    }
    public func f42(): Unit {}
    public func f43(): String {
        return "str"
    }
    public func f44(): (Int64, Int64) {
        return (9, 5)
    }
    public func f45(): (String, String, String) {
        return ("", "iui", "vvvv")
    }
    public func f46(): (Int64, Bool, (String, Rune)) {
        return (10, true, ("b", r'e'))
    }
    public func f47(): Range<Int64> {
        return 1..100:3
    }
    public func f48(): () -> Unit {
        return { => () }
    }
    public func f49(): (Int64) -> Unit {
        return { x: Int64 => () }
    }
    public func f50(): () -> Int64 {
        return { => 97 }
    }
    public func f51(): (Float64) -> Int64 {
        return { x: Float64 => Int64(x) }
    }
    public func f52(): S {
        return S(14)
    }
    public func f53(): E {
        return E.B(false)
    }
    public func f54(): VArray<Int64, $3> {
        return [3, 3, 3]
    }
    public func f55(): Array<Rune> {
        return [r'b', r'b']
    }
    public func f56(): Test {
        return this
    }
}

main() {
    let test = Test()

    test.f1(1i8)
    test.f2(2i16)
    test.f3(3i32)
    test.f4(4)
    test.f5(5u8)
    test.f6(6u16)
    test.f7(7u32)
    test.f8(8u64)
    test.f9(1.0f16)
    test.f10(2.0f32)
    test.f11(3.0)
    test.f12(r'n')
    test.f13(false)
    test.f14(())
    test.f15("[]")
    test.f16((100, -100))
    test.f17(("\n", "\t", "\\"))
    test.f18((8, false, ("oo", r'o')))
    test.f19(1..17:2)
    test.f20({ => ()})
    test.f21({x: Int64 => ()})
    test.f22({ => -100 })
    test.f23({x: Float64 => Int64(x)})
    test.f24(S(90))
    test.f25(E.A(66))
    test.f26([0, 0, 0])
    test.f27([r'p', r'p', r'p'])
    test.f28(test)

    let x29 = test.f29()
    Assert.equals(1i8, x29)
    let x30 = test.f30()
    Assert.equals(2i16, x30)
    let x31 = test.f31()
    Assert.equals(3i32, x31)
    let x32 = test.f32()
    Assert.equals(4, x32)
    let x33 = test.f33()
    Assert.equals(5u8, x33)
    let x34 = test.f34()
    Assert.equals(6u16, x34)
    let x35 = test.f35()
    Assert.equals(7u32, x35)
    let x36 = test.f36()
    Assert.equals(8u64, x36)
    let x37 = test.f37()
    Assert.approxEquals(.1f16, x37)
    let x38 = test.f38()
    Assert.approxEquals(.01f32, x38)
    let x39 = test.f39()
    Assert.approxEquals(.001, x39)
    let x40 = test.f40()
    Assert.equals(r'c', x40)
    let x41 = test.f41()
    Assert.equals(true, x41)
    let x42 = test.f42()
    Assert.isTrue(x42 is Unit)
    let x43 = test.f43()
    Assert.equals("str", x43)
    let x44 = test.f44()
    Assert.equals(9, x44[0])
    Assert.equals(5, x44[1])
    let x45 = test.f45()
    Assert.equals("", x45[0])
    Assert.equals("iui", x45[1])
    Assert.equals("vvvv", x45[2])
    let x46 = test.f46()
    Assert.equals(10, x46[0])
    Assert.equals(true, x46[1])
    Assert.equals("b", x46[2][0])
    Assert.equals(r'e', x46[2][1])
    let x47 = test.f47()
    Assert.equals(1..100:3, x47)
    let x48 = test.f48()
    Assert.isTrue(x48() is Unit)
    let x49 = test.f49()
    Assert.isTrue(x49(1) is Unit)
    let x50 = test.f50()
    Assert.equals(97, x50())
    let x51 = test.f51()
    Assert.equals(12, x51(12.000331))
    let x52 = test.f52()
    Assert.equals(14, x52.x)
    let x53 = test.f53()
    let t = match(x53) {
        case B(y) => y
        case _ => true
    }
    Assert.equals(false, t)
    let x54 = test.f54()
    Assert.equals(3, x54[0])
    Assert.equals(3, x54[1])
    Assert.equals(3, x54[2])
    let x55 = test.f55()
    Assert.equals([r'b', r'b'], x55)
    let x56 = test.f56()
    Assert.isTrue(x56 is Test)
}