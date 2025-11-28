/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler -Woff all %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.reflect.*

public class C1 {
    public C1(public var val: Int64) {}

    public init() {
        this.val = 0
    }
}

public enum E {
    | M1
    | M2(Int64)
    | M2(Int64, Int64)
    | M3(Int64, String)
    | M4(C1)
    | M5(E)

    public func foo(): Unit {
        println("foo")
    }
}

public enum E2 {
    | N1
    | N2(Int64)
}

@Test
class EnumTypeInfoTest {
    @TestCase
    func testOfInstance() {
        let info1 = EnumTypeInfo.of(E.M1)
        @Expect(info1.name, "E")
        @Expect(info1.qualifiedName, "default.E")

        let info2 = EnumTypeInfo.of(E.M2(0))
        @Expect(info2.name, "E")
        @Expect(info2.qualifiedName, "default.E")

        let info3 = EnumTypeInfo.of(E.M3(0, "abc"))
        @Expect(info3.name, "E")
        @Expect(info3.qualifiedName, "default.E")

        let info4 = EnumTypeInfo.of(E.M4(C1))
        @Expect(info4.name, "E")
        @Expect(info4.qualifiedName, "default.E")

        let info5 = EnumTypeInfo.of(E.M5(E.M4(C1())))
        @Expect(info5.name, "E")
        @Expect(info5.qualifiedName, "default.E")
    }

    @TestCase
    func testGet() {
        let e = EnumTypeInfo.get("default.E")
        @Expect(e.name, "E")
        let e1 = EnumTypeInfo.get("default.E.M1")
        @Expect(e1.name, "E")
        let e2 = EnumTypeInfo.get("default.E.M2<Int64>")
        @Expect(e2.name, "E")
        let e3 = EnumTypeInfo.get("default.E.M3<Int64, String>")
        @Expect(e3.name, "E")
        let e4 = EnumTypeInfo.get("default.E.M4<default.C1>")
        @Expect(e4.name, "E")
        let e5 = EnumTypeInfo.get("default.E.M5<default.E.M1>")
        @Expect(e5.name, "E")
    }

    @TestCase
    func testOfT() {
        let e1 = EnumTypeInfo.of<E>()
        @Expect(e1.name, "E")
    }

    @TestCase
    func testConstruct() {
        let e = EnumTypeInfo.get("default.E")

        let inst1 = e.construct("M1", []) as E
        @Expect(inst1, Some(E.M1))

        let inst2 = e.construct("M2<Int64>", [0]) as E
        @Expect(inst2, Some(E.M2(0)))

        let inst3 = e.construct("M3<Int64, String>", [0, "abc"]) as E
        @Expect(inst3, Some(E.M3(0, "abc")))

        let inst4 = e.construct("M4<default.C1>", [C1]) as E
        @Expect(inst4, Some(E.M4(C1())))

        let inst5 = e.construct("M5<default.E.M1>", [E.M1]) as E
        @Expect(inst5, Some(E.M5(E.M1)))
    }

    @TestCase
    func testConstructInvalid() {
        let e = EnumTypeInfo.get("default.E")

        @Expect(@AssertThrows[InvocationTargetException](e.construct("M2<Int64>", [])).message.contains("Invalid number of arguments"))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M3<Int64, String>", [0]).message.contains("Invalid number of arguments")))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M4<default.C1>", []).message.contains("Invalid number of arguments")))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M5<default.E.M1>", []).message.contains("Invalid number of arguments")))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M2<Int64>", ["abc"]).message.contains("Argument type mismatch")))

        @Expect(@AssertThrows[InvocationTargetException](e.construct("M3<Int64, String>", [0, 123]).message.contains("Argument type mismatch")))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M4<default.C1>", [E.M1]).message.contains("Argument type mismatch")))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M5<default.E.M1>", [C1]).message.contains("Argument type mismatch")))
    }

    @TestCase
    func testDestruct() {
        let e = EnumTypeInfo.get("default.E")
        var (info, value) = e.destruct(E.M1)
        @Expect(info.name, "E.M1")
        @Expect(value.size, 0)

        (info, value) = e.destruct(E.M2(42))
        @Expect(info.name, "E.M2<Int64>")
        @Expect(value.size, 1)
        @Expect(value[0] as Int64, Some(42))

        (info, value) = e.destruct(E.M3(42, "abc"))
        @Expect(info.name, "E.M3<Int64, String>")
        @Expect(value.size, 2)
        @Expect(value[0] as Int64, Some(42))
        @Expect(value[1] as String, Some("abc"))

        (info, value) = e.destruct(E.M4(C1(42)))
        @Expect(info.name, "E.M4<default.C1>")
        @Expect(value.size, 1)
        @Expect(value[0] as C1, Some(C1(42)))

        (info, value) = e.destruct(E.M5(E.M2(42)))
        @Expect(info.name, "E.M5<default.E>")
        @Expect(value.size, 1)
        @Expect(value[0] as E, Some(E.M2(42)))
    }

    @TestCase
    func testDestructInvalid() {
        let e = EnumTypeInfo.get("default.E")

        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E.M2<Int64>(42))).message.contains("Invalid number of arguments"))
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E.M3<Int64, String>(42, "abc"))).message.contains("Invalid number of arguments"))
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E.M4<C1>(C1(42)))).message.contains("Invalid number of arguments"))
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E.M5(E.M1))).message.contains("Invalid number of arguments"))
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E.M2<Int64>(42, 123))).message.contains("Argument type mismatch"))

        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E.M3<Int64, String>(42, 123))).message.contains("Argument type mismatch"))
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E.M4<C1>(C1(42)))).message.contains("Argument type mismatch"))
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E.M5(E.M1))).message.contains("Argument type mismatch"))
    }

    /* func getConstructor(constructor: String, argsCount!: Int64 = 0): EnumConstructInfo */
    @TestCase
    func testGetConstructor() {
        let e = EnumTypeInfo.get("default.E")
        let c1 = e.getConstructor("M1")
        @Expect(c1.name, "M1")

        var c2 = e.getConstructor("M2", 1)
        @Expect(c2.name, "default.E.M2<Int64>")

        c2 = e.getConstructor("M2", 2)
        @Expect(c2.name, "default.E.M2<Int64, Int64>")

        let c3 = e.getConstructor("M3", 2)
        @Expect(c3.name, "default.E.M3<Int64, String>")

        let c4 = e.getConstructor("M4", 1)
        @Expect(c4.name, "default.E.M4<default.C1>")

        let c5 = e.getConstructor("M5", 1)
        @Expect(c5.name, "default.E.M5<default.E>")
    }
}
