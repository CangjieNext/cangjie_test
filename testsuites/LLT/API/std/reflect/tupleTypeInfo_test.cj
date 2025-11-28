/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
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


open class Base {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

class Sub <: Base {
    public init(val: Int64) {
        super(val)
    }
}

interface I {
    public func id(): Int64
}

class Impl <: I {
    public func id(): Int64 {
        7
    }
}

abstract class Abs {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

class AbsSub <: Abs {
    public init(val: Int64) {
        super(val)
    }
}

struct S {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

struct S1 {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

struct S2 {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

enum E {
    | A
    | B(Int64)
}

func inc(x: Int64): Int64 {
    x + 1
}

@Test
class TupleTypeInfoTest {
    @TestCase
    func testOfInstance() {
        let info = TupleTypeInfo.of((1, "abc", true))
        @Expect(info.name, "Tuple<Int64, String, Bool>")
        @Expect(info.qualifiedName, "Tuple<Int64, String, Bool>")
        let elements = info.elements
        @Expect(elements.size, 3)
        @Expect(elements[0].name, "Int64")
        @Expect(elements[1].name, "String")
        @Expect(elements[2].name, "Bool")
    }

    @TestCase
    func testOfType() {
        let info = TupleTypeInfo.of<(Int64, String, Bool)>()
        @Expect(info.name, "Tuple<Int64, String, Bool>")
        @Expect(info.qualifiedName, "Tuple<Int64, String, Bool>")
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

    @Skip
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

    @TestCase
    func testElementsCaching() {
        let info = TupleTypeInfo.of<(Int64, String, Bool)>()
        let first = info.elements
        let second = info.elements
        @Expect(first.size, 3)
        @Expect(second.size, 3)
        @Expect(first[0] == second[0])
        @Expect(first[1] == second[1])
        @Expect(first[2] == second[2])
    }

    @TestCase
    func testNestedTupleElements() {
        let info = TupleTypeInfo.of<(Int64, (Int64, String), Bool)>()
        let elements = info.elements
        @Expect(elements.size, 3)
        @Expect(elements[0].name, "Int64")
        @Expect(elements[2].name, "Bool")
        match (elements[1]) {
            case t: TupleTypeInfo =>
                let inner = t.elements
                @Expect(inner.size, 2)
                @Expect(inner[0].name, "Int64")
                @Expect(inner[1].name, "String")
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testConstructNestedTuple() {
        let info = TupleTypeInfo.of<(Int64, (Int64, String), Bool)>()
        let constructed = (info.construct([1, (2, "ok"), true]) as (Int64, (Int64, String), Bool)).getOrThrow()
        @Expect(constructed[0], 1)
        @Expect(constructed[1][0], 2)
        @Expect(constructed[1][1], "ok")
        @Expect(constructed[2], true)
    }

    @TestCase
    func testDestructNestedTuple() {
        let tp = (1, (2, "ok"), true)
        let info = TupleTypeInfo.of(tp)
        let destructed = info.destruct(tp)
        @Expect(destructed.size, 3)
        @Expect(destructed[0] as Int64, Some(1))
        let inner = (destructed[1] as (Int64, String)).getOrThrow()
        @Expect(inner[0], 2)
        @Expect(inner[1], "ok")
        @Expect(destructed[2] as Bool, Some(true))
    }

    @TestCase
    func testConstructSubtype() {
        let info = TupleTypeInfo.of<(Base, Int64)>()
        let constructed = (info.construct([Sub(7), 8]) as (Base, Int64)).getOrThrow()
        @Expect(constructed[0] is Sub)
        @Expect((constructed[0] as Base)?.v, Some(7))
        @Expect(constructed[1], 8)
    }

    @TestCase
    func testArrayAndEnumElements() {
        let info = TupleTypeInfo.of<(Array<Int64>, E)>()
        let arr: Array<Int64> = [1, 2, 3]
        let constructed = (info.construct([arr, E.B(9)]) as (Array<Int64>, E)).getOrThrow()
        @Expect(constructed[0].size, 3)
        @Expect(constructed[0][2], 3)
        match (constructed[1]) {
            case E.B(v) => @Expect(v, 9)
            case _ => @Assert(false)
        }
        let destructed = info.destruct(constructed)
        let arrOut = (destructed[0] as Array<Int64>).getOrThrow()
        @Expect(arrOut[0], 1)
        let enumOut = (destructed[1] as E).getOrThrow()
        match (enumOut) {
            case E.B(v) => @Expect(v, 9)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testLargeTuple8() {
        let info = TupleTypeInfo.of<(Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64)>()
        @Expect(info.elements.size, 8)
        let args: Array<Any> = [1, 2, 3, 4, 5, 6, 7, 8]
        let constructed = (info.construct(args) as (Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64))
            .getOrThrow()
        @Expect(constructed[0], 1)
        @Expect(constructed[7], 8)
        let destructed = info.destruct(constructed)
        @Expect(destructed[0] as Int64, Some(1))
        @Expect(destructed[7] as Int64, Some(8))
    }

    @TestCase
    func testLargeTuple16() {
        let info = TupleTypeInfo.of<
            (Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64,
             Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64)
        >()
        @Expect(info.elements.size, 16)
        let args: Array<Any> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
        let constructed = (info.construct(args) as
            (Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64,
             Int64, Int64, Int64, Int64, Int64, Int64, Int64, Int64))
            .getOrThrow()
        @Expect(constructed[0], 1)
        @Expect(constructed[15], 16)
        let destructed = info.destruct(constructed)
        @Expect(destructed[0] as Int64, Some(1))
        @Expect(destructed[15] as Int64, Some(16))
    }

    @TestCase
    func testFunctionElement() {
        let info = TupleTypeInfo.of<(Int64, (Int64) -> Int64)>()
        let fn: (Int64) -> Int64 = inc
        let constructed = (info.construct([1, fn]) as (Int64, (Int64) -> Int64)).getOrThrow()
        @Expect(constructed[0], 1)
        @Expect(constructed[1](2), 3)
        let destructed = info.destruct(constructed)
        let fnOut = (destructed[1] as (Int64) -> Int64).getOrThrow()
        @Expect(fnOut(3), 4)
    }

    @TestCase
    func testInterfaceAndAbstractElements() {
        let info = TupleTypeInfo.of<(I, Abs)>()
        let constructed = (info.construct([Impl(), AbsSub(9)]) as (I, Abs)).getOrThrow()
        @Expect(constructed[0] is Impl)
        @Expect(constructed[1].v, 9)
    }

    @TestCase
    func testOptionElements() {
        let info = TupleTypeInfo.of<(Option<Int64>, ?String)>()
        let constructed = (info.construct([Option<Int64>.Some(7), Option<String>.None])
            as (Option<Int64>, ?String)).getOrThrow()
        @Expect(constructed[0].getOrThrow(), 7)
        @Expect(constructed[1].isNone(), true)
        let destructed = info.destruct(constructed)
        let opt = (destructed[0] as Option<Int64>).getOrThrow()
        @Expect(opt.getOrThrow(), 7)
        let optStr = (destructed[1] as ?String).getOrThrow()
        @Expect(optStr.isNone(), true)
    }

    @Skip // VArray is not support yet
    @TestCase
    func testVArrayElement() {
        let info = TupleTypeInfo.of<(VArray<Int64, $3>, Int64)>()
        let va: VArray<Int64, $3> = [1, 2, 3]
        let constructed = (info.construct([va, 4]) as (VArray<Int64, $3>, Int64)).getOrThrow()
        @Expect(constructed[0][0], 1)
        @Expect(constructed[0][2], 3)
        @Expect(constructed[1], 4)
        let destructed = info.destruct(constructed)
        let vaOut = (destructed[0] as VArray<Int64, $3>).getOrThrow()
        @Expect(vaOut[1], 2)
    }

    @TestCase
    func testCPointerAndCFuncElements() {
        let info = TupleTypeInfo.of<(CPointer<Int8>, CFunc<(CPointer<Int8>) -> Unit>)>()
        let ptr = CPointer<Int8>()
        let cf: CFunc<(CPointer<Int8>) -> Unit> = { p => () }
        let constructed = (info.construct([ptr, cf]) as (CPointer<Int8>, CFunc<(CPointer<Int8>) -> Unit>))
            .getOrThrow()
        let destructed = info.destruct(constructed)
        if (let Some(p) <- (destructed[0] as CPointer<Int8>)) {
            @Assert(true)
            let f = (destructed[1] as CFunc<(CPointer<Int8>) -> Unit>).getOrThrow()
            unsafe { f(p) }
        } else {
            @Assert(false)
        }
    }

    @TestCase
    func testDeepNestedTuple() {
        let tp = (1, (2, ("a", true)), (3, (4, (false, 5))))
        let info = TupleTypeInfo.of(tp)
        let destructed = info.destruct(tp)
        let mid = (destructed[1] as (Int64, (String, Bool))).getOrThrow()
        @Expect(mid[0], 2)
        @Expect(mid[1][0], "a")
        @Expect(mid[1][1], true)
        let tail = (destructed[2] as (Int64, (Int64, (Bool, Int64)))).getOrThrow()
        @Expect(tail[0], 3)
        @Expect(tail[1][0], 4)
        @Expect(tail[1][1][0], false)
        @Expect(tail[1][1][1], 5)
    }
}

@Test
class TupleTypeInfoNegativeTest {
    @TestCase
    func testOfNonTupleType() {
        var e = @ExpectThrows[IllegalTypeException](TupleTypeInfo.of(1)).getOrThrow()
        @Expect(e.message.contains("Expected `instance` to be a tuple type"))
        e = @ExpectThrows[IllegalTypeException](TupleTypeInfo.of<Int64>()).getOrThrow()
        @Expect(e.message.contains("Expected generic type `T` to be a tuple type"))
    }

    @TestCase
    func testConstructWithInvalidArgs() {
        let info = TupleTypeInfo.of<(Int64, String)>()
        let e = @ExpectThrows[IllegalArgumentException](info.construct([42])).getOrThrow()
        @Expect(e.message.contains("Tuple argument count mismatch"))
        @Expect(e.message.contains("expected 2, got 1"))

        let e2 = @ExpectThrows[IllegalArgumentException](info.construct([1, "ok", 2])).getOrThrow()
        @Expect(e2.message.contains("Tuple argument count mismatch"))
        @Expect(e2.message.contains("expected 2, got 3"))
    }

    @TestCase
    func testConstructWithInvalidArgType() {
        let info = TupleTypeInfo.of<(Int64, String)>()
        let e = @ExpectThrows[IllegalTypeException](info.construct([42, 3.14])).getOrThrow()
        @Expect(e.message.contains("Tuple argument type mismatch at index 1"))
        @Expect(e.message.contains("expected String"))
    }

    @TestCase
    func testDestructWithInvalidInstance() {
        let info = TupleTypeInfo.of<(Int64, String)>()
        let e = @ExpectThrows[IllegalTypeException](info.destruct((42, 3.14))).getOrThrow()
        @Expect(e.message.contains("Tuple instance type mismatch"))
        @Expect(e.message.contains("expected Tuple<Int64, String>"))
    }

    @TestCase
    func testUnitIsNotTupleType() {
        let e = @ExpectThrows[IllegalTypeException](TupleTypeInfo.of(())).getOrThrow()
        @Expect(e.message.contains("Expected `instance` to be a tuple type"))
    }

    @TestCase
    func testDestructWithSameShapeDifferentType() {
        let info = TupleTypeInfo.of<(S1, Int64)>()
        let e = @ExpectThrows[IllegalTypeException](info.destruct((S2(1), 2))).getOrThrow()
        @Expect(e.message.contains("Tuple instance type mismatch"))
        @Expect(e.message.contains("expected Tuple<default.S1, Int64>"))
    }
}
