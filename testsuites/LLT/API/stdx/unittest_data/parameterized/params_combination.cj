/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./test_data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.any
import std.collection.map
import std.collection.ArrayList
import stdx.unittest.data.*

class IterableDataStrategy<T> <: DataStrategy<T> & DataProvider<T> {
    IterableDataStrategy(let data: Array<T>) {}

    public func provider(configuration: Configuration): DataProvider<T> {
        this
    }

    public func provide(): Iterable<T> {
        data |> map<T, T> {it => it}
    }

    public prop isInfinite: Bool {
        get() {
            false
        }
    }
}

let testInput = [1, 2]

@Test
class Param1Test {
    var toBePassed1 = ArrayList<Int64>()

    protected func beforeEach() {
        toBePassed1 = ArrayList(testInput)
    }

    protected func afterEach() {
        if (!toBePassed1.isEmpty()) {
            throw IllegalStateException("not all parameters consumed!")
        }
    }

    @TestCase[input in IterableDataStrategy(testInput)]
    func testParam1(input: Int64) {
        @Assert(toBePassed1.contains(input))
        toBePassed1.removeIf {it: Int64 => it == input}
    }

    @TestCase[input in json("test_data/nums.json")]
    func testJsonParam1(input: Int64) {
        @Assert(toBePassed1.contains(input))
        toBePassed1.removeIf {it: Int64 => it == input}
    }

    @TestCase[input in testInput]
    func testArrayParam1(input: Int64) {
        @Assert(toBePassed1.contains(input))
        toBePassed1.removeIf {it: Int64 => it == input}
    }
}

@Test
class Params2Test {
    var toBePassed2 = ArrayList<(Int64, Int64)>()

    protected func beforeEach() {
        toBePassed2 = ArrayList()
        let t = testInput
        for (i in 0..testInput.size) {
            for (j in 0..testInput.size) {
                toBePassed2.add((t[i], t[j]))
            }
        }
    }

    protected func afterEach() {
        if (!toBePassed2.isEmpty()) {
            throw IllegalStateException("not all parameters consumed!")
        }
    }

    @TestCase[a in IterableDataStrategy(testInput), b in IterableDataStrategy(testInput)]
    func testParams2(a: Int64, b: Int64) {
        @Assert(toBePassed2.contains1((a, b)))
        toBePassed2.removeIf {it: (Int64, Int64) => it == (a, b)}
    }

    @TestCase[a in json("test_data/nums.json"), b in json("test_data/nums.json")]
    func testJsonParams2(a: Int64, b: Int64) {
        @Assert(toBePassed2.contains1((a, b)))
        toBePassed2.removeIf {it: (Int64, Int64) => it == (a, b)}
    }

    @TestCase[a in testInput, b in testInput]
    func testArrayParams2(a: Int64, b: Int64) {
        @Assert(toBePassed2.contains1((a, b)))
        toBePassed2.removeIf {it: (Int64, Int64) => it == (a, b)}
    }
}

@Test
class Params3Test {
    var toBePassed3 = ArrayList<(Int64, Int64, Int64)>()

    protected func beforeEach() {
        toBePassed3 = ArrayList()
        let t = testInput
        for (i in 0..testInput.size) {
            for (j in 0..testInput.size) {
                for (k in 0..testInput.size) {
                    toBePassed3.add((t[i], t[j], t[k]))
                }
            }
        }
    }

    protected func afterEach() {
        if (!toBePassed3.isEmpty()) {
            throw IllegalStateException("not all parameters consumed!")
        }
    }

    @TestCase[a in IterableDataStrategy(testInput), b in IterableDataStrategy(testInput), c in IterableDataStrategy(testInput)]
    func testParams3(a: Int64, b: Int64, c: Int64) {
        @Assert(toBePassed3.contains1((a, b, c)))
        toBePassed3.removeIf {it: (Int64, Int64, Int64) => it == (a, b, c)}
    }

    /* it's not required to test json/array at params count >= 3, because:
     * it's longer
     * json behaviour is the same as custom iterable data provider
     * array behaviour at more params count is the same as at 2 params
     */
}

@Test
class Params4Test {
    var toBePassed4 = ArrayList<(Int64, Int64, Int64, Int64)>()

    protected func beforeEach() {
        toBePassed4 = ArrayList()
        let t = testInput
        for (i in 0..testInput.size) {
            for (j in 0..testInput.size) {
                for (k in 0..testInput.size) {
                    for (l in 0..testInput.size) {
                        toBePassed4.add((t[i], t[j], t[k], t[l]))
                    }
                }
            }
        }
    }

    protected func afterEach() {
        if (!toBePassed4.isEmpty()) {
            throw IllegalStateException("not all parameters consumed!")
        }
    }

    @TestCase[a in IterableDataStrategy(testInput), b in IterableDataStrategy(testInput), c in IterableDataStrategy(testInput), d in IterableDataStrategy(testInput)]
    func testParams4(a: Int64, b: Int64, c: Int64, d: Int64) {
        @Assert(toBePassed4.contains1((a, b, c, d)))
        toBePassed4.removeIf {it: (Int64, Int64, Int64, Int64) => it == (a, b, c, d)}
    }
}

@Test
class Params5Test {
    var toBePassed5 = ArrayList<(Int64, Int64, Int64, Int64, Int64)>()

    protected func beforeEach() {
        toBePassed5 = ArrayList()
        let t = testInput
        for (i in 0..testInput.size) {
            for (j in 0..testInput.size) {
                for (k in 0..testInput.size) {
                    for (l in 0..testInput.size) {
                        for (m in 0..testInput.size) {
                            toBePassed5.add((t[i], t[j], t[k], t[l], t[m]))
                        }
                    }
                }
            }
        }
    }

    protected func afterEach() {
        if (!toBePassed5.isEmpty()) {
            throw IllegalStateException("not all parameters consumed!")
        }
    }

    @TestCase[a in IterableDataStrategy(testInput), b in IterableDataStrategy(testInput), c in IterableDataStrategy(testInput), d in IterableDataStrategy(testInput), e in IterableDataStrategy(testInput)]
    func testParams5(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
        @Assert(toBePassed5.contains1((a, b, c, d, e)))
        toBePassed5.removeIf {it: (Int64, Int64, Int64, Int64, Int64) => it == (a, b, c, d, e)}
    }
}

extend ArrayList<(Int64, Int64)> {
    public func contains1(element: (Int64, Int64)): Bool {
        this |> map<(Int64, Int64), (Int64, Int64)> {it => it} |>
            any<(Int64, Int64)> {
            it => it[0] == element[0] && it[1] == element[1]
        }
    }
}

extend ArrayList<(Int64, Int64, Int64)> {
    public func contains1(element: (Int64, Int64, Int64)): Bool {
        this |> map<(Int64, Int64, Int64), (Int64, Int64, Int64)> {it => it} |>
            any<(Int64, Int64, Int64)> {
            it => it[0] == element[0] && it[1] == element[1] && it[2] == element[2]
        }
    }
}

extend ArrayList<(Int64, Int64, Int64, Int64)> {
    public func contains1(element: (Int64, Int64, Int64, Int64)): Bool {
        this |> map<(Int64, Int64, Int64, Int64), (Int64, Int64, Int64, Int64)> {it => it} |>
            any<(Int64, Int64, Int64, Int64)> {
            it => it[0] == element[0] && it[1] == element[1] && it[2] == element[2] && it[3] == element[3]
        }
    }
}

extend ArrayList<(Int64, Int64, Int64, Int64, Int64)> {
    public func contains1(element: (Int64, Int64, Int64, Int64, Int64)): Bool {
        this |> map<(Int64, Int64, Int64, Int64, Int64), (Int64, Int64, Int64, Int64, Int64)> {it => it} |>
            any<(Int64, Int64, Int64, Int64, Int64)> {
            it => it[0] == element[0] && it[1] == element[1] && it[2] == element[2] && it[3] == element[3] && it[4] ==
                element[4]
        }
    }
}
