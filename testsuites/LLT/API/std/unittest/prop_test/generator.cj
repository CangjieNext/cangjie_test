/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

internal import std.unittest.prop_test.*
internal import std.random.*

let random = Random(42)

func takeArray<T>(size: Int64, gen: Generator<T>): Array<T> {
    Array(size) {_ => gen.next()}
}

func testSimpleGenerators() {
    let allThrees = Generators.single<Int64>(3)
    if (takeArray(3, allThrees) != [3, 3, 3]) {
        throw Exception()
    }
    let i = Box(0)
    let succ = Generators.generate<Int64> {
        i.value++;
        i.value
    }
    if (takeArray(3, succ) != [1, 2, 3]) {
        throw Exception()
    }
    let iter = Generators.iterable(random, [1, 2, 3])
    for (e in takeArray(20, iter)) {
        match (e) {
            case 1 | 2 | 3 => ()
            case _ => throw Exception()
        }
    }

    let allOnes = Generators.single<Int64>(1)
    let allTwos = Generators.single<Int64>(2)

    // it is really complex to actually test weighted generator, we
    // just check it doesn't misbehave here
    let wei = Generators.weighted<Int64>(random, [(1, allOnes), (1, allTwos), (1, allThrees)])
    for (e in takeArray(20, wei)) {
        match (e) {
            case 1 | 2 | 3 => ()
            case _ => throw Exception()
        }
    }
    let pick = Generators.pick<Int64>(random, [allOnes, allTwos, allThrees])
    for (e in takeArray(20, pick)) {
        match (e) {
            case 1 | 2 | 3 => ()
            case _ => throw Exception()
        }
    }
}

func testLookupGenerators() {
    let _ = Generators.lookup<String>(random)
    let boolStringGen = Generators.mapped<Bool, String>(random) {it => it.toString()}
    for (e in takeArray(20, boolStringGen)) {
        match (e) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
    }

    let boolStringGen2 = Generators.mapped(random) {a: Bool, b: Bool => "${a}|${b}"}
    for (e in takeArray(20, boolStringGen2)) {
        let cc = e.split("|")
        if (cc.size != 2) {
            throw Exception()
        }
        match (cc[0]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
        match (cc[1]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
    }

    let boolStringGen3 = Generators.mapped(random) {a: Bool, b: Bool, c: Bool => "${a}|${b}|${c}"}
    for (e in takeArray(20, boolStringGen3)) {
        let cc = e.split("|")
        if (cc.size != 3) {
            throw Exception()
        }
        match (cc[0]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
        match (cc[1]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
        match (cc[2]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
    }

    let boolStringGen4 = Generators.mapped(random) {a: Bool, b: Bool, c: Bool, d: Bool => "${a}|${b}|${c}|${d}"}
    for (e in takeArray(20, boolStringGen4)) {
        let cc = e.split("|")
        if (cc.size != 4) {
            throw Exception()
        }
        match (cc[0]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
        match (cc[1]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
        match (cc[2]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
        match (cc[3]) {
            case "true" | "false" => ()
            case _ => throw Exception()
        }
    }
}

main() {
    testSimpleGenerators()
    testLookupGenerators()
}
