/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

internal import std.collection.*
internal import std.random.*
internal import std.unittest.prop_test.*

let random = Random(42)

// this mostly tests that the types are correct and that the values are actually produced
func smokeTest<T>() where T <: Arbitrary<T> {
    let unitGen = T.arbitrary(random)
    for (_ in 0..5) {
        let _: T = unitGen.next()
    }
}

// this is very sketchy: it tries to test that generators actually produce different values
// unfortunately, there is not much more we can do with this probability-based generators
func samenessTest<T>() where T <: Arbitrary<T> & Equatable<T> {
    let unitGen = T.arbitrary(random)
    let resultArr = Array<T>(10) {_ => unitGen.next()}
    for (e1 in resultArr) {
        for (e2 in resultArr) {
            if (e1 != e2) {
                return
            }
        }
    }
    throw Exception()
}

main() {
    smokeTest<Unit>()
    smokeTest<Bool>()
    smokeTest<Int8>()
    smokeTest<Int16>()
    smokeTest<Int32>()
    smokeTest<Int64>()
    smokeTest<IntNative>()
    smokeTest<UInt8>()
    smokeTest<UInt16>()
    smokeTest<UInt32>()
    smokeTest<UInt64>()
    smokeTest<UIntNative>()
    smokeTest<Float16>()
    smokeTest<Float32>()
    smokeTest<Float64>()
    smokeTest<Rune>()
    smokeTest<String>()
    smokeTest<?String>()
    smokeTest<Array<String>>()
    smokeTest<ArrayList<String>>()
    smokeTest<HashMap<Int64, Bool>>()
    smokeTest<HashSet<String>>()
    smokeTest<Ordering>()
    smokeTest<TupleWrapper2<Int64, String>>()
    smokeTest<TupleWrapper3<Int64, String, Rune>>()
    smokeTest<TupleWrapper4<Int64, String, Rune, Float16>>()
    smokeTest<TupleWrapper5<Int64, String, Rune, Float16, Bool>>()

    samenessTest<Bool>()
    samenessTest<Int8>()
    samenessTest<Int16>()
    samenessTest<Int32>()
    samenessTest<Int64>()
    samenessTest<IntNative>()
    samenessTest<UInt8>()
    samenessTest<UInt16>()
    samenessTest<UInt32>()
    samenessTest<UInt64>()
    samenessTest<UIntNative>()
    samenessTest<Float16>()
    samenessTest<Float32>()
    samenessTest<Float64>()
    samenessTest<Rune>()
    samenessTest<String>()
    samenessTest<?String>()
    samenessTest<Array<String>>()
    samenessTest<ArrayList<String>>()
    samenessTest<HashMap<Int64, Bool>>()
    samenessTest<HashSet<String>>()
    samenessTest<Ordering>()
    samenessTest<TupleWrapper2<Int64, String>>()
    samenessTest<TupleWrapper3<Int64, String, Rune>>()
    samenessTest<TupleWrapper4<Int64, String, Rune, Float16>>()
    samenessTest<TupleWrapper5<Int64, String, Rune, Float16, Bool>>()
}
