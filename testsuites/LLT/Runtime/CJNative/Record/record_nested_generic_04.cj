// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime record nested generic pass

struct Pair<A, B> {
    var first: A
    var second: B

    init(first: A, second: B) {
        this.first = first
        this.second = second
    }
}

struct Triple<X, Y, Z> {
    var x: X
    var y: Y
    var z: Z

    init(x: X, y: Y, z: Z) {
        this.x = x
        this.y = y
        this.z = z
    }
}

func testPairRecord(): Bool {
    let p = Pair<Int64, String>(42, "hello")
    p.first == 42 && p.second == "hello"
}

func testTripleRecord(): Bool {
    let t = Triple<Int64, String, Bool>(10, "abc", true)
    t.x == 10 && t.y == "abc" && t.z == true
}

func testPairSwap(): Bool {
    let p1 = Pair<Int64, String>(1, "one")
    let p2 = Pair<String, Int64>("count", 100)
    p1.first + p2.second == 101
}

func testNestedTuple(): Bool {
    let inner = Pair<Int64, Bool>(7, true)
    let outer = Pair<String, Pair<Int64, Bool>>("nested", inner)
    outer.first == "nested" && outer.second.first == 7 && outer.second.second == true
}

func testTripleMixed(): Bool {
    let t = Triple<Float64, Int64, String>(3.14, 42, "pi")
    t.x == 3.14 && t.y == 42 && t.z == "pi"
}

main(): Int64 {
    if (!testPairRecord()) {
        return 1
    }
    if (!testTripleRecord()) {
        return 2
    }
    if (!testPairSwap()) {
        return 3
    }
    if (!testNestedTuple()) {
        return 4
    }
    if (!testTripleMixed()) {
        return 5
    }
    println("runtime record nested generic pass")
    0
}
