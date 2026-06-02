/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.deriving.*
import std.unittest.*
import std.unittest.prop_test.*
import std.unittest.testmacro.*
import std.random.Random

@Derive[Arbitrary]
struct EmptyStruct {
    EmptyStruct() {}
}

@Derive[Arbitrary]
class EmptyClass {
    EmptyClass() {}
}

@Derive[std.unittest.prop_test.Arbitrary]
struct S1 {
    S1(
        a: Int64,
        b: Option<Bool>,
        protected var c: Int32,
        protected let d: UInt16,
        var e!: Option<Int32>,
        let f!: Bool,
        public var g!: Option<Option<Bool>>,
        public let h!: Bool = true
    ) {}
}

@Derive[std.unittest.prop_test.Arbitrary]
class C1 {
    C1(
        a: Int64,
        b: Option<Bool>,
        protected var c: Int32,
        protected let d: UInt16,
        var e!: Option<Int32>,
        let f!: Bool,
        public var g!: Option<Option<Bool>>,
        public let h!: Bool = true
    ) {}
}

@Derive[std.unittest.prop_test.Arbitrary]
enum E1 {
    | A
    | B(Int32)
    | C(Int64, Bool)
    | D(Option<Bool>, Bool, Int32, UInt8, Rune, Int64)
    | D(Bool)
}

@Test
class ArbitraryTest {
    @TestCase
    func testDefaultCtor() {
        @Assert(EmptyStruct.arbitrary(Random()).next() is EmptyStruct)
        @Assert(EmptyClass.arbitrary(Random()).next() is EmptyClass)
    }

    @TestCase
    func testConstructor() {
        @Assert(S1.arbitrary(Random()).next() is S1)
        @Assert(C1.arbitrary(Random()).next() is C1)
        @Assert(E1.arbitrary(Random()).next() is E1)
    }
}
