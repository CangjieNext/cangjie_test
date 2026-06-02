/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

internal import std.random.*
internal import std.unittest.prop_test.*

func expect(condition: Bool) {
    if (!condition) {
        throw Exception()
    }
}

func testTuple2() {
    let tuple = (2, "Hello")
    let otherTuple = (3, "Hello")
    let wrapper = TupleWrapper2(tuple)

    expect(wrapper == TupleWrapper2(tuple))
    expect(wrapper != TupleWrapper2(otherTuple))
    expect(!(wrapper != TupleWrapper2(tuple)))
    expect(!(wrapper == TupleWrapper2(otherTuple)))
    expect(wrapper.toString() == "(${tuple[0]}, ${tuple[1]})")

    func f(a: Int64, b: String) {
        (a, b)
    }
    expect(wrapper.apply(f) == tuple)
}

func testTuple3() {
    let tuple = (2, "Hello", r'c')
    let otherTuple = (2, "Hello", r'b')
    let wrapper = TupleWrapper3(tuple)

    expect(wrapper == TupleWrapper3(tuple))
    expect(wrapper != TupleWrapper3(otherTuple))
    expect(!(wrapper != TupleWrapper3(tuple)))
    expect(!(wrapper == TupleWrapper3(otherTuple)))
    expect(wrapper.toString() == "(${tuple[0]}, ${tuple[1]}, ${tuple[2]})")

    func f(a: Int64, b: String, c: Rune) {
        (a, b, c)
    }
    expect(wrapper.apply(f) == tuple)
}

func testTuple4() {
    let tuple = (2, "Hello", r'c', 3)
    let otherTuple = (2, "HelloW", r'c', 3)
    let wrapper = TupleWrapper4(tuple)

    expect(wrapper == TupleWrapper4(tuple))
    expect(wrapper != TupleWrapper4(otherTuple))
    expect(!(wrapper != TupleWrapper4(tuple)))
    expect(!(wrapper == TupleWrapper4(otherTuple)))
    expect(wrapper.toString() == "(${tuple[0]}, ${tuple[1]}, ${tuple[2]}, ${tuple[3]})")

    func f(a: Int64, b: String, c: Rune, d: Int64) {
        (a, b, c, d)
    }
    expect(wrapper.apply(f) == tuple)
}

func testTuple5() {
    let tuple = (2, "Hello", r'c', 3, r'a')
    let otherTuple = (2, "HelloW", r'c', 3, r'a')
    let wrapper = TupleWrapper5(tuple)

    expect(wrapper == TupleWrapper5(tuple))
    expect(wrapper != TupleWrapper5(otherTuple))
    expect(!(wrapper != TupleWrapper5(tuple)))
    expect(!(wrapper == TupleWrapper5(otherTuple)))
    expect(wrapper.toString() == "(${tuple[0]}, ${tuple[1]}, ${tuple[2]}, ${tuple[3]}, ${tuple[4]})")

    func f(a: Int64, b: String, c: Rune, d: Int64, e: Rune) {
        (a, b, c, d, e)
    }
    expect(wrapper.apply(f) == tuple)
}

func testFunction() {
    func f() {
        return 2
    }

    let wrapper = Function0Wrapper(f)

    if (f() != 2) {
        throw Exception()
    }
}

main() {
    testTuple2()
    testTuple3()
    testTuple4()
    testTuple5()
    testFunction()
}
