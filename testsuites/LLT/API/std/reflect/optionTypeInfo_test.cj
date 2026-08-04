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

open class OptionBase {
    public var value: Int64

    public init(value: Int64) {
        this.value = value
    }
}

class OptionSub <: OptionBase {
    public init(value: Int64) {
        super(value)
    }
}

struct OptionStruct {
    public var value: Int64

    public init(value: Int64) {
        this.value = value
    }
}

@Test
class OptionTypeInfoTest {
    @TestCase
    func testOfTypeAndInstance(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        @Expect(info.name, "Option<Int64>")
        @Expect(info.qualifiedName, "Option<Int64>")
        @Expect(info.valueType, TypeInfo.of<Int64>())

        let some: Option<Int64> = Some(1)
        let none: Option<Int64> = None
        @Expect(OptionTypeInfo.of(some), info)
        @Expect(OptionTypeInfo.of(none), info)
        @Expect(TypeInfo.of(some) is OptionTypeInfo)
        @Expect(TypeInfo.of(none) is OptionTypeInfo)
    }

    @TestCase
    func testGetByQualifiedName(): Unit {
        let info = OptionTypeInfo.get("Option<String>")
        @Expect(info, OptionTypeInfo.of<Option<String>>())
        @Expect(info.valueType, TypeInfo.of<String>())

        let stdCoreInfo = OptionTypeInfo.get("std.core.Option<std.core.String>")
        @Expect(stdCoreInfo, info)
    }

    @TestCase
    func testConstructSomeAndNone(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        let some = (info.constructSome(42) as Option<Int64>).getOrThrow()
        @Expect(some.getOrThrow(), 42)
        @Expect(info.isSome(some), true)
        @Expect(info.isNone(some), false)
        @Expect(info.getValue(some) as Int64, Some(42))

        let none = (info.constructNone() as Option<Int64>).getOrThrow()
        @Expect(none.isNone(), true)
        @Expect(info.isSome(none), false)
        @Expect(info.isNone(none), true)
        @Expect(info.getValue(none).isNone(), true)
    }

    @TestCase
    func testConstructSomeAcceptsSubtype(): Unit {
        let info = OptionTypeInfo.of<Option<OptionBase>>()
        let some = (info.constructSome(OptionSub(7)) as Option<OptionBase>).getOrThrow()
        let value = some.getOrThrow()
        @Expect(value is OptionSub)
        @Expect(value.value, 7)
        @Expect(info.getValue(some).isSome(), true)
    }

    @TestCase
    func testNestedOption(): Unit {
        let info = OptionTypeInfo.of<Option<Option<String>>>()
        match (info.valueType) {
            case nested: OptionTypeInfo =>
                @Expect(nested.valueType, TypeInfo.of<String>())
            case _ => @Assert(false)
        }

        let inner: Option<String> = Some("ok")
        let some = (info.constructSome(inner) as Option<Option<String>>).getOrThrow()
        @Expect(info.isSome(some), true)
        let value = (info.getValue(some).getOrThrow() as Option<String>).getOrThrow()
        @Expect(value.getOrThrow(), "ok")

        let none = (info.constructSome(Option<String>.None) as Option<Option<String>>).getOrThrow()
        let noneValue = (info.getValue(none).getOrThrow() as Option<String>).getOrThrow()
        @Expect(noneValue.isNone(), true)
    }

    @TestCase
    func testOptionWithTupleValue(): Unit {
        let info = OptionTypeInfo.of<Option<(Int64, String)>>()
        match (info.valueType) {
            case tupleInfo: TupleTypeInfo =>
                @Expect(tupleInfo.elements.size, 2)
                @Expect(tupleInfo.elements[0], TypeInfo.of<Int64>())
                @Expect(tupleInfo.elements[1], TypeInfo.of<String>())
            case _ => @Assert(false)
        }

        let some = (info.constructSome((1, "one")) as Option<(Int64, String)>).getOrThrow()
        let tupleValue = (info.getValue(some).getOrThrow() as (Int64, String)).getOrThrow()
        @Expect(tupleValue[0], 1)
        @Expect(tupleValue[1], "one")
    }

    @TestCase
    func testOptionWithStructValue(): Unit {
        let info = OptionTypeInfo.of<Option<OptionStruct>>()
        @Expect(info.valueType, TypeInfo.of<OptionStruct>())
        let some = (info.constructSome(OptionStruct(9)) as Option<OptionStruct>).getOrThrow()
        @Expect(some.getOrThrow().value, 9)
    }
}

@Test
class OptionTypeInfoNegativeTest {
    @TestCase
    func testOfNonOptionType(): Unit {
        let e1 = @ExpectThrows[IllegalTypeException](OptionTypeInfo.of(1)).getOrThrow()
        @Expect(e1.message.contains("must be an Option type instance"))

        let e2 = @ExpectThrows[IllegalTypeException](OptionTypeInfo.of<Int64>()).getOrThrow()
        @Expect(e2.message.contains("must be an Option type"))
    }

    @TestCase
    func testGetNonOptionType(): Unit {
        let e = @ExpectThrows[IllegalTypeException](OptionTypeInfo.get("Int64")).getOrThrow()
        @Expect(e.message.contains("Expected Option type"))
    }

    @TestCase
    func testConstructSomeRejectsWrongValueType(): Unit {
        let info = OptionTypeInfo.of<Option<String>>()
        let e = @ExpectThrows[IllegalTypeException](info.constructSome(1)).getOrThrow()
        @Expect(e.message.contains("Option Some value type mismatch"))
        @Expect(e.message.contains("expected String"))
    }

    @TestCase
    func testHelpersRejectDifferentOptionType(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        let bad: Option<String> = Some("bad")
        let e = @ExpectThrows[IllegalTypeException](info.isSome(bad)).getOrThrow()
        @Expect(e.message.contains("Failed to destruct enum"))
        @Expect(e.message.contains("expected an instance of `Option<Int64>`"))
    }
}
