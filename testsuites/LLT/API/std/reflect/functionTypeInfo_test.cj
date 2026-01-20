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

func fn0(): Int64 {
    42
}

func fn2(a: Int64, b: String): Bool {
    a > 0 && b.size > 0
}

func fnTupleArg(t: (Int64, String)): String {
    t[1]
}

func fnTupleRet(x: Int64): (Int64, String) {
    (x, "abc")
}

struct S {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

class C {
    public var v: Int64 = 0
    public init(val: Int64) {
        this.v = val
    }
}

func fnStructClass(a: S, b: C): Int64 {
    a.v + b.v
}

enum EApply {
    | A
    | B(Int64)
}

func fnEnumReturn(x: Int64): EApply {
    if (x > 0) {
        EApply.B(x)
    } else {
        EApply.A
    }
}

func fnArrayReturn(a: Int64, b: Int64): Array<Int64> {
    [a, b]
}

func fnThrow(): Int64 {
    throw IllegalArgumentException("boom")
}

func fnUnit(): Unit {
    ()
}

@Test
class FunctionTypeInfoTest {
    @TestCase
    func testOfInstance() {
        let f0: () -> Int64 = fn0
        let info0 = FunctionTypeInfo.of(f0)
        @Expect(info0.parameters.size, 0)
        @Expect(info0.returnType.name, "Int64")

        let f2: (Int64, String) -> Bool = fn2
        let info2 = FunctionTypeInfo.of(f2)
        @Expect(info2.parameters.size, 2)
        @Expect(info2.parameters[0].name, "Int64")
        @Expect(info2.parameters[1].name, "String")
        @Expect(info2.returnType.name, "Bool")
    }

    @TestCase
    func testOfType() {
        let info = FunctionTypeInfo.of<(Int64, String) -> Bool>()
        @Expect(info.parameters.size, 2)
        @Expect(info.parameters[0].name, "Int64")
        @Expect(info.parameters[1].name, "String")
        @Expect(info.returnType.name, "Bool")
    }

    @TestCase
    func testOfInstanceForClosure() {
        let captured: Int64 = 10
        let f: (Int64) -> Int64 = { x: Int64 => x + captured }
        let info = FunctionTypeInfo.of(f)
        @Expect(info.parameters.size, 1)
        @Expect(info.parameters[0].name, "Int64")
        @Expect(info.returnType.name, "Int64")
    }

    @TestCase
    func testTupleParamTypeInfo() {
        let f: ((Int64, String)) -> String = fnTupleArg
        let info = FunctionTypeInfo.of(f)
        @Expect(info.parameters.size, 1)
        match (info.parameters[0]) {
            case t: TupleTypeInfo =>
                let elems = t.elements
                @Expect(elems.size, 2)
                @Expect(elems[0].name, "Int64")
                @Expect(elems[1].name, "String")
            case _ => @Assert(false)
        }
        @Expect(info.returnType.name, "String")
    }

    @TestCase
    func testTupleReturnTypeInfo() {
        let f: (Int64) -> (Int64, String) = fnTupleRet
        let info = FunctionTypeInfo.of(f)
        @Expect(info.parameters.size, 1)
        @Expect(info.parameters[0].name, "Int64")
        match (info.returnType) {
            case t: TupleTypeInfo =>
                let elems = t.elements
                @Expect(elems.size, 2)
                @Expect(elems[0].name, "Int64")
                @Expect(elems[1].name, "String")
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testCachingForParametersAndReturnType() {
        let f2: (Int64, String) -> Bool = fn2
        let info = FunctionTypeInfo.of(f2)
        let p1 = info.parameters
        let p2 = info.parameters
        @Expect(p1.size, 2)
        @Expect(p2.size, 2)
        @Expect(p1[0] == p2[0])
        @Expect(p1[1] == p2[1])
        @Expect(info.returnType == info.returnType)
    }

    @TestCase
    func testApply() {
        let f0: () -> Int64 = fn0
        let info0 = FunctionTypeInfo.of(f0)
        @Expect(info0.apply(f0, []) as Int64, Some(42))

        let f2: (Int64, String) -> Bool = fn2
        let info2 = FunctionTypeInfo.of(f2)
        @Expect(info2.apply(f2, [1, "a"]) as Bool, Some(true))
        @Expect(info2.apply(f2, [-1, "a"]) as Bool, Some(false))
    }

    @TestCase
    func testApplyClosure() {
        let captured: Int64 = 10
        let f: (Int64) -> Int64 = { x: Int64 => x + captured }
        let info = FunctionTypeInfo.of(f)
        @Expect(info.apply(f, [2]) as Int64, Some(12))
    }

    @TestCase
    func testApplyTupleParam() {
        let f: ((Int64, String)) -> String = fnTupleArg
        let info = FunctionTypeInfo.of(f)
        @Expect(info.apply(f, [(1, "ok")]) as String, Some("ok"))
    }

    @TestCase
    func testApplyTupleReturn() {
        let f: (Int64) -> (Int64, String) = fnTupleRet
        let info = FunctionTypeInfo.of(f)
        let tup = (info.apply(f, [3]) as (Int64, String)).getOrThrow()
        @Expect(tup[0], 3)
        @Expect(tup[1], "abc")
    }

    @TestCase
    func testApplyStructAndClassArgs() {
        let f: (S, C) -> Int64 = fnStructClass
        let info = FunctionTypeInfo.of(f)
        @Expect(info.apply(f, [S(1), C(2)]) as Int64, Some(3))
    }

    @TestCase
    func testApplyEnumReturn() {
        let f: (Int64) -> EApply = fnEnumReturn
        let info = FunctionTypeInfo.of(f)
        let r1 = (info.apply(f, [1]) as EApply).getOrThrow()
        match (r1) {
            case EApply.B(v) => @Expect(v, 1)
            case _ => @Assert(false)
        }
        let r2 = (info.apply(f, [-1]) as EApply).getOrThrow()
        match (r2) {
            case EApply.A => @Assert(true)
            case _ => @Assert(false)
        }
    }

    @TestCase
    func testApplyArrayReturn() {
        let f: (Int64, Int64) -> Array<Int64> = fnArrayReturn
        let info = FunctionTypeInfo.of(f)
        let arr = (info.apply(f, [2, 3]) as Array<Int64>).getOrThrow()
        @Expect(arr.size, 2)
        @Expect(arr[0], 2)
        @Expect(arr[1], 3)
    }

    @TestCase
    func testApplyThrows() {
        let f: () -> Int64 = fnThrow
        let info = FunctionTypeInfo.of(f)
        @ExpectThrows[Exception](info.apply(f, []))
    }

    @TestCase
    func testUnitReturnType() {
        let f: () -> Unit = fnUnit
        let info = FunctionTypeInfo.of(f)
        @Expect(info.parameters.size, 0)
        @Expect(info.returnType.name, "Unit")
    }
}

@Test
class FunctionTypeInfoNegativeTest {
    @TestCase
    func testOfNonFunctionType() {
        var e = @ExpectThrows[IllegalTypeException](FunctionTypeInfo.of(1)).getOrThrow()
        @Expect(e.message.contains("function type instance"))
        e = @ExpectThrows[IllegalTypeException](FunctionTypeInfo.of<Int64>()).getOrThrow()
        @Expect(e.message.contains("function type for `T`"))
    }

    @TestCase
    func testApplyWithInvalidArgsCount() {
        let f2: (Int64, String) -> Bool = fn2
        let info = FunctionTypeInfo.of(f2)
        let e = @ExpectThrows[IllegalArgumentException](info.apply(f2, [1])).getOrThrow()
        @Expect(e.message.contains("comply with the required quantity"))
    }

    @TestCase
    func testApplyWithInvalidArgsCountZeroArgs() {
        let f0: () -> Int64 = fn0
        let info = FunctionTypeInfo.of(f0)
        let e = @ExpectThrows[IllegalArgumentException](info.apply(f0, [1])).getOrThrow()
        @Expect(e.message.contains("comply with the required quantity"))
    }

    @TestCase
    func testApplyWithTooManyArgs() {
        let f2: (Int64, String) -> Bool = fn2
        let info = FunctionTypeInfo.of(f2)
        let e = @ExpectThrows[IllegalArgumentException](info.apply(f2, [1, "a", 3])).getOrThrow()
        @Expect(e.message.contains("comply with the required quantity"))
    }

    @TestCase
    func testApplyWithInvalidInstance() {
        let f0: () -> Int64 = fn0
        let f2: (Int64, String) -> Bool = fn2
        let info0 = FunctionTypeInfo.of(f0)
        let e = @ExpectThrows[IllegalTypeException](info0.apply(f2, [1, "a"])).getOrThrow()
        @Expect(e.message.contains("Expected function type"))
    }

    @TestCase
    func testApplyWithEnumParam() {
        let f: (EApply) -> Int64 = {e: EApply => 
            match (e) {
                case EApply.A => 0
                case EApply.B(v) => v
            }
        }
        let info = FunctionTypeInfo.of(f)
        var ret = info.apply(f, [EApply.A])
        @Expect(ret as Int64, Some(0))
        ret = info.apply(f, [EApply.B(42)])
        @Expect(ret as Int64, Some(42))
    }

    @TestCase
    func testApplyWithTupleParam() {
        let f: ((Int64, Int64)) -> Int64 = { t: (Int64, Int64) => t[0] + t[1] }
        let info = FunctionTypeInfo.of(f)
        let ret = info.apply(f, [(1, 2)])
        @Expect(ret as Int64, Some(3))
    }

    @TestCase
    func testApplyWithFunctionParam() {
        let f: ((Int64) -> Int64) -> Int64 = { funcParam: (Int64) -> Int64 => funcParam(10) }
        let info = FunctionTypeInfo.of(f)
        let ret = info.apply(f, [{ x: Int64 => x * 2 }])
        @Expect(ret as Int64, Some(20))
    }
}
