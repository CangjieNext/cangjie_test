/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test API:
 *      OptionTypeInfo <: TypeInfo (not EnumTypeInfo)
 *          public prop payloadType: TypeInfo
 *          public static func of(instance: Any): OptionTypeInfo
 *          public static func of<T>(): OptionTypeInfo
 *          public static func get(qualifiedName: String): OptionTypeInfo
 *          public func constructSome(payload: Any): Any
 *          public func constructNone(): Any
 *          public func isSome(instance: Any): Bool
 *          public func isNone(instance: Any): Bool
 *          public func getPayload(instance: Any): Option<Any>
 *      EnumTypeInfo / EnumConstructorInfo: retain the enum view of Option<T>.
 *      Nested Some(None) must remain distinct from an outer None.
 *      Positive Option cases require compiler-emitted enum constructor metadata.
 *      Without that metadata TypeInfo must retain EnumTypeInfo, not a partial OptionTypeInfo.
 */

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

enum OptionLookalike<T> {
    Some(T) | None
}

@Test
class OptionTypeInfoTest {
    @TestCase
    func testOfTypeAndInstance(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        @Expect(info.name, "Option<Int64>")
        @Expect(info.qualifiedName, "Option<Int64>")
        @Expect(info.payloadType, TypeInfo.of<Int64>())

        let some: Option<Int64> = Some(1)
        let none: Option<Int64> = None
        @Expect(OptionTypeInfo.of(some), info)
        @Expect(OptionTypeInfo.of(none), info)
        let typeInfo = TypeInfo.of<Option<Int64>>()
        @Expect(typeInfo is OptionTypeInfo)
        @Expect(!(typeInfo is EnumTypeInfo))
        @Expect(TypeInfo.of(some) is OptionTypeInfo)
        @Expect(TypeInfo.of(none) is OptionTypeInfo)
    }

    @TestCase
    func testGetByQualifiedName(): Unit {
        let info = OptionTypeInfo.get("Option<String>")
        @Expect(info, OptionTypeInfo.of<Option<String>>())
        @Expect(info.payloadType, TypeInfo.of<String>())
        @Expect(OptionTypeInfo.get("std.core.Option<std.core.String>"), info)
        @Expect(TypeInfo.get(info.qualifiedName) is OptionTypeInfo)
    }

    @TestCase
    func testConstructSomeAndNone(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        let some = (info.constructSome(42i64) as Option<Int64>).getOrThrow()
        @Expect(some.getOrThrow(), 42)
        @Expect(info.isSome(some), true)
        @Expect(info.isNone(some), false)
        @Expect((info.getPayload(some).getOrThrow() as Int64).getOrThrow(), 42)

        let none = (info.constructNone() as Option<Int64>).getOrThrow()
        @Expect(none.isNone(), true)
        @Expect(info.isSome(none), false)
        @Expect(info.isNone(none), true)
        @Expect(info.getPayload(none).isNone(), true)
    }

    @TestCase
    func testReferencePayload(): Unit {
        let info = OptionTypeInfo.of<Option<String>>()
        let some = (info.constructSome("payload") as Option<String>).getOrThrow()
        @Expect(some.getOrThrow(), "payload")
        @Expect((info.getPayload(some).getOrThrow() as String).getOrThrow(), "payload")
        @Expect((info.constructNone() as Option<String>).getOrThrow().isNone(), true)
    }

    @TestCase
    func testConstructSomeAcceptsSubtype(): Unit {
        let info = OptionTypeInfo.of<Option<OptionBase>>()
        let some = (info.constructSome(OptionSub(7)) as Option<OptionBase>).getOrThrow()
        let payload = (info.getPayload(some).getOrThrow() as OptionSub).getOrThrow()
        @Expect(some.getOrThrow() is OptionSub)
        @Expect(payload.value, 7)
    }

    @TestCase
    func testNestedOptionSomePayload(): Unit {
        let info = OptionTypeInfo.of<Option<Option<String>>>()
        let innerInfo = (info.payloadType as OptionTypeInfo).getOrThrow()
        @Expect(innerInfo.payloadType, TypeInfo.of<String>())
        let inner: Option<String> = Some("ok")
        let some = (info.constructSome(inner) as Option<Option<String>>).getOrThrow()
        let payload = (info.getPayload(some).getOrThrow() as Option<String>).getOrThrow()
        @Expect(payload.getOrThrow(), "ok")
        @Expect(some.getOrThrow(), inner)
    }

    @TestCase
    func testNestedOptionPreservesNonePayload(): Unit {
        let info = OptionTypeInfo.of<Option<Option<String>>>()
        let some = (info.constructSome(Option<String>.None) as Option<Option<String>>).getOrThrow()
        @Expect(info.isSome(some), true)
        @Expect(info.isNone(some), false)
        let payload = info.getPayload(some)
        @Expect(payload.isSome(), true)
        @Expect((payload.getOrThrow() as Option<String>).getOrThrow().isNone(), true)
        @Expect(some.getOrThrow().isNone(), true)

        let none = (info.constructNone() as Option<Option<String>>).getOrThrow()
        @Expect(none.isNone(), true)
        @Expect(info.isSome(none), false)
        @Expect(info.getPayload(none).isNone(), true)
    }

    @TestCase
    func testTuplePayload(): Unit {
        let info = OptionTypeInfo.of<Option<(Int64, String)>>()
        let tupleInfo = (info.payloadType as TupleTypeInfo).getOrThrow()
        @Expect(tupleInfo.elements[0], TypeInfo.of<Int64>())
        @Expect(tupleInfo.elements[1], TypeInfo.of<String>())
        let some = (info.constructSome((1, "one")) as Option<(Int64, String)>).getOrThrow()
        let payload = (info.getPayload(some).getOrThrow() as (Int64, String)).getOrThrow()
        @Expect(payload[0], 1)
        @Expect(payload[1], "one")
        @Expect(some.getOrThrow()[0], 1)
        @Expect(some.getOrThrow()[1], "one")
    }

    @TestCase
    func testStructPayload(): Unit {
        let info = OptionTypeInfo.of<Option<OptionStruct>>()
        @Expect(info.payloadType, TypeInfo.of<OptionStruct>())
        let some = (info.constructSome(OptionStruct(9)) as Option<OptionStruct>).getOrThrow()
        @Expect(some.getOrThrow().value, 9)
        @Expect((info.getPayload(some).getOrThrow() as OptionStruct).getOrThrow().value, 9)
    }

    @TestCase
    func testUnitPayloadIsNotNone(): Unit {
        let info = OptionTypeInfo.of<Option<Unit>>()
        let some = (info.constructSome(()) as Option<Unit>).getOrThrow()
        @Expect(some.isSome(), true)
        @Expect(info.isSome(some), true)
        @Expect(info.isNone(some), false)
        @Expect(info.getPayload(some).isSome(), true)
        @Expect(TypeInfo.of(info.getPayload(some).getOrThrow()), TypeInfo.of<Unit>())
    }

    @TestCase
    func testEnumViewLookupAndConstruction(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        let some = info.constructSome(7i64)
        let none = info.constructNone()
        let enumInfo = EnumTypeInfo.of<Option<Int64>>()
        @Expect(EnumTypeInfo.of(some), enumInfo)
        @Expect(EnumTypeInfo.of(none), enumInfo)
        @Expect(EnumTypeInfo.get(info.qualifiedName), enumInfo)
        @Expect(EnumTypeInfo.get("std.core.Option<std.core.Int64>"), enumInfo)
        let enumSome = enumInfo.construct("Some(Int64)", [9i64])
        let enumNone = enumInfo.construct("None", [])
        @Expect((enumSome as Option<Int64>).getOrThrow(), Option<Int64>.Some(9))
        @Expect((enumNone as Option<Int64>).getOrThrow().isNone(), true)
        @Expect((info.getPayload(enumSome).getOrThrow() as Int64).getOrThrow(), 9)
        @Expect(info.isNone(enumNone), true)
    }

    @TestCase
    func testEnumConstructorsRetainDeclaringType(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        let enumInfo = EnumTypeInfo.of<Option<Int64>>()
        let someCtor = enumInfo.getConstructor("Some", argsCount: 1)
        let noneCtor = enumInfo.getConstructor("None")
        @Expect(someCtor.enumTypeInfo, enumInfo)
        @Expect(noneCtor.enumTypeInfo, enumInfo)
        @Expect(someCtor.parameters[0], info.payloadType)
        @Expect(EnumConstructorInfo.of(info.constructSome(3i64)), someCtor)
        @Expect(EnumConstructorInfo.of(info.constructNone()), noneCtor)
        @Expect(EnumConstructorInfo.get(someCtor.qualifiedName), someCtor)
        let constructed = someCtor.apply([11i64])
        @Expect((constructed as Option<Int64>).getOrThrow(), Option<Int64>.Some(11))
        @Expect((someCtor.getAssociatedValues(constructed)[0] as Int64).getOrThrow(), 11)
        let (ctor, values) = enumInfo.destruct(constructed)
        @Expect(ctor, someCtor)
        @Expect((values[0] as Int64).getOrThrow(), 11)
        let (emptyCtor, emptyValues) = enumInfo.destruct(noneCtor.apply([]))
        @Expect(emptyCtor, noneCtor)
        @Expect(emptyValues.isEmpty(), true)
    }
}

@Test
class OptionTypeInfoNegativeTest {
    @TestCase
    func testMissingConstructorMetadataFallback(): Unit {
        let enumInfo = EnumTypeInfo.of<Option<Int64>>()
        let typeInfo = TypeInfo.of<Option<Int64>>()
        if (enumInfo.constructors.isEmpty()) {
            @Expect(typeInfo is EnumTypeInfo)
            @Expect(!(typeInfo is OptionTypeInfo))
            @ExpectThrows[IllegalTypeException](OptionTypeInfo.of<Option<Int64>>())
            @ExpectThrows[IllegalTypeException](OptionTypeInfo.of(Option<Int64>.Some(1)))
            @ExpectThrows[IllegalTypeException](OptionTypeInfo.of(Option<Int64>.None))
        } else {
            @Expect(typeInfo is OptionTypeInfo)
            @Expect(OptionTypeInfo.of<Option<Int64>>().payloadType, TypeInfo.of<Int64>())
        }
    }

    @TestCase
    func testOfNonOptionType(): Unit {
        @ExpectThrows[IllegalTypeException](OptionTypeInfo.of(1))
        @ExpectThrows[IllegalTypeException](OptionTypeInfo.of<Int64>())
        @ExpectThrows[IllegalTypeException](OptionTypeInfo.get("Int64"))
    }

    @TestCase
    func testRejectsLookalikeEnum(): Unit {
        let value = OptionLookalike<Int64>.Some(1)
        let typeInfo = TypeInfo.of<OptionLookalike<Int64>>()
        @Expect(typeInfo is EnumTypeInfo)
        @Expect(!(typeInfo is OptionTypeInfo))
        @ExpectThrows[IllegalTypeException](OptionTypeInfo.of<OptionLookalike<Int64>>())
        @ExpectThrows[IllegalTypeException](OptionTypeInfo.of(value))
        @ExpectThrows[IllegalTypeException](OptionTypeInfo.get(typeInfo.qualifiedName))
        let enumInfo = EnumTypeInfo.of(value)
        let payload = enumInfo.getConstructor("Some", argsCount: 1).getAssociatedValues(value)[0]
        @Expect((payload as Int64).getOrThrow(), 1)
    }

    @TestCase
    func testConstructSomeRejectsWrongPayloadType(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        @ExpectThrows[IllegalTypeException](info.constructSome("wrong"))
        @ExpectThrows[IllegalTypeException](info.constructSome(1i32))
        @ExpectThrows[IllegalTypeException](info.constructSome(Option<Int64>.Some(1)))
    }

    @TestCase
    func testHelpersRejectDifferentOptionType(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        let badSome: Option<String> = Some("bad")
        let badNone: Option<String> = None
        @ExpectThrows[IllegalTypeException](info.isSome(badSome))
        @ExpectThrows[IllegalTypeException](info.isSome(badNone))
        @ExpectThrows[IllegalTypeException](info.isNone(badSome))
        @ExpectThrows[IllegalTypeException](info.isNone(badNone))
        @ExpectThrows[IllegalTypeException](info.getPayload(badSome))
        @ExpectThrows[IllegalTypeException](info.getPayload(badNone))
    }

    @TestCase
    func testHelpersRejectNonOptionInstance(): Unit {
        let info = OptionTypeInfo.of<Option<Int64>>()
        @ExpectThrows[IllegalTypeException](info.isSome(1))
        @ExpectThrows[IllegalTypeException](info.isNone(1))
        @ExpectThrows[IllegalTypeException](info.getPayload(1))
    }
}
