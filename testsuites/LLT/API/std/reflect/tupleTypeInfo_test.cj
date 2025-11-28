/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*
import std.unittest.*
import std.unittest.testmacro.*

class C {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

struct S {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

@Test
class EnumTypeInfoTest {
    @TestCase
    func testOfInstance() {
        let info = TupleTypeInfo.of((1, "abc", true))
        @Expect(info.name, "(Int64, String, Bool)")
        @Expect(info.qualifiedName, "default.(Int64, String, Bool)")
        let elements = info.elements
        @Expect(elements.size, 3)
        @Expect(elements[0].name, "Int64")
        @Expect(elements[1].name, "String")
        @Expect(elements[2].name, "Bool")
    }

    @TestCase
    func testOfType() {
        let info = TupleTypeInfo.of<(Int64, String, Bool)>()
        @Expect(info.name, "(Int64, String, Bool)")
        @Expect(info.qualifiedName, "default.(Int64, String, Bool)")
        let elements = info.elements
        @Expect(elements.size, 3)
        @Expect(elements[0].name, "Int64")
        @Expect(elements[1].name, "String")
        @Expect(elements[2].name, "Bool")
    }

    @TestCase
    func testConstruct() {
        let tp = (1, S(0), C(1))
        let info = TupleTypeInfo.of(tp)
        let constructed = (info.construct([42, S(99), C(100)]) as (Int64, S, C)).getOrThrow()
        @Expect(constructed[0], 42)
        @Expect(constructed[1].v, 99)
        @Expect(constructed[2].v, 100)
    }

    @TestCase
    func testDestruct() {
        let tp = (1, S(0), C(1))
        let info = TupleTypeInfo.of(tp)
        let destructed = info.destruct(tp)
        @Expect(destructed.size, 3)
        @Expect(destructed[0] as Int64, Some(1))
        @Expect((destructed[1] as S)?.v, Some(0))
        @Expect((destructed[2] as C)?.v, Some(1))
    }
}

@Test
class EnumTypeInfoNegativeTest {
    @TestCase
    func testOfNonTupleType() {
        var e = @ExpectThrows[IllegalTypeException](TupleTypeInfo.of(1)).getOrThrow()
        @Expect(e.message.contains("is not a tuple type"))
        e = @ExpectThrows[IllegalTypeException](TupleTypeInfo.of<Int64>()).getOrThrow()
        @Expect(e.message.contains("is not a tuple type"))
    }

    @TestCase
    func testConstructWithInvalidArgs() {
        let info = TupleTypeInfo.of<(Int64, String)>()
        let e = @ExpectThrows[IllegalArgumentException](info.construct([42])).getOrThrow()
        @Expect(e.message.contains("number of arguments does not match"))  
    }

    @TestCase
    func testConstructWithInvalidArgType() {
        let info = TupleTypeInfo.of<(Int64, String)>()
        let e = @ExpectThrows[IllegalTypeException](info.construct([42, 3.14])).getOrThrow()
        @Expect(e.message.contains("type of argument at index `1` does not match"))  
    }

    @TestCase
    func testDestructWithInvalidInstance() {
        let info = TupleTypeInfo.of<(Int64, String)>()
        let e = @ExpectThrows[IllegalTypeException](info.destruct((42, 3.14))).getOrThrow()
        @Expect(e.message.contains("type of parameter `instance` does not match"))
    }
}