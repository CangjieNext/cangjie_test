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
 *      EnumTypeInfo
 *          public prop constructors: Collection<EnumConstructorInfo>
 *          public static func get(qualifiedName: String): EnumTypeInfo
 *          public static func of(instance: Any): EnumTypeInfo
 *          public static func of<T>(): EnumTypeInfo
 *          public func construct(constructor: String, args: Array<Any>): Any
 *          public func destruct(instance: Any): (EnumConstructorInfo, ReadOnlyList<Any>)
 *          public func getConstructor(constructor: String, argsCount!: Int64 = 0): EnumConstructorInfo
 *      EnumConstructorInfo
 *          public prop annotations: Collection<Annotation>
 *          public prop enumTypeInfo: EnumTypeInfo
 *          public prop name: String
 *          public prop qualifiedName: String
 *          public prop parameters: ReadOnlyList<TypeInfo>
 *          public static func get(qualifiedName: String): EnumConstructorInfo
 *          public static func of(instance: Any): EnumConstructorInfo
 *          public func apply(args: Array<Any>): Any
 *          public func getAssociatedvalues(instance: Any): ReadOnlyList<Any>
 *          public func findAllAnnotations<T>(): Array<T> where T <: Annotation
 *          public func findAllAnnotation<T>(): ?T where T <: Annotation
 *          public func getAllAnnotations(): Array<Annotation>
 *          public func hashCode(): Int64
 *          public operator func ==(other: EnumConstructorInfo): Bool
 *          public func toString(): String
 */

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

public enum E3 {
    | A
    | B
    | ...
}

public enum E4 {
    | A
    | B
}

public enum E5 {
    | M2(Int64)
}

@Annotation
public class TagA {
    const init() {}
}

@Annotation
public class TagB {
    const init() {}
}

public enum EAnno {
    | @TagA
    A
    | B
    | B(Int64)
    | @TagA
    @TagB
    B(Int64, String)
    | C
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

        let info4 = EnumTypeInfo.of(E.M4(C1()))
        @Expect(info4.name, "E")
        @Expect(info4.qualifiedName, "default.E")

        let info5 = EnumTypeInfo.of(E.M5(E.M4(C1())))
        @Expect(info5.name, "E")
        @Expect(info5.qualifiedName, "default.E")

        let info6 = EnumTypeInfo.of(E3.A)
        @Expect(info6.name, "E3")
        @Expect(info6.qualifiedName, "default.E3")

        let info7 = EnumTypeInfo.of(E4.B)
        @Expect(info7.name, "E4")
        @Expect(info7.qualifiedName, "default.E4")
    }

    @TestCase
    func testTempEnumType() {
        let caseType = TypeInfo.of(E.M1)
        let enumType = EnumTypeInfo.get("default.E")
        @Expect(caseType.isSubtypeOf(enumType))
        @Expect(caseType.qualifiedName, "default.E")
        @Expect(caseType.qualifiedName, enumType.qualifiedName)
        @Expect(caseType.qualifiedName.contains(".0"), false)
    }

    @TestCase
    func testGet() {
        let e = EnumTypeInfo.get("default.E")
        @Expect(e.name, "E")
    }

    @TestCase
    func testGetInvalid() {
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.get("default.C1")).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.get("default.E.M1")).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.get("default.E.M2<Int64>")).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.get("default.E.M3<Int64, String>")).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.get("default.E.M4<default.C1>")).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.get("default.E.M5<default.E.M1>")).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.get("default.NotExist")).getOrThrow()
    }

    @TestCase
    func testOfT() {
        let e1 = EnumTypeInfo.of<E>()
        @Expect(e1.name, "E")
    }

    @TestCase
    func testOfInvalid() {
        try {
            let _: EnumTypeInfo = EnumTypeInfo.of(1)  // must specific type here, otherwise it will call TypeInfo.of(Object): TypeInfo
            @Assert(false)
        } catch(e: IllegalTypeException) {
            @Expect(e.message.contains("must be an Enum type"))
        }
        try {
            let _: EnumTypeInfo = EnumTypeInfo.of(C1())
            @Assert(false)
        } catch(e: IllegalTypeException) {
            @Expect(e.message.contains("must be an Enum type"))
        }
    }

    @TestCase
    func testOfGenericInvalid() {
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.of<Int64>()).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumTypeInfo.of<C1>()).getOrThrow()
    }

    @TestCase
    func testConstruct() {
        let e = EnumTypeInfo.get("default.E")

        let inst1 = (e.construct("M1", []) as E).getOrThrow()
        match (inst1) {
            case E.M1 => @Assert(true)
            case _ => @Assert(false) 
        }

        let inst2 = (e.construct("M2<Int64>", [0]) as E).getOrThrow()
        match (inst2) {
            case E.M2(val) => @Expect(val, 0)
            case _ => @Assert(false) 
        }

        let inst2b = (e.construct("E.M2<Int64>", [1]) as E).getOrThrow()
        match (inst2b) {
            case E.M2(val) => @Expect(val, 1)
            case _ => @Assert(false)
        }

        let inst3 = (e.construct("M3<Int64, String>", [0, "abc"]) as E).getOrThrow()
        match(inst3) {
            case E.M3(v1, v2) =>
                @Expect(v1, 0)
                @Expect(v2, "abc")
           
            case _ => @Assert(false) 
        }
        match (inst3) {
            case E.M3(v1, v2) =>
                @Expect(v1, 0)
                @Expect(v2, "abc")
           
            case _ => @Assert(false) 
        }

        let inst4 = (e.construct("M4<default.C1>", [C1()]) as E).getOrThrow()
        match (inst4) {
            case E.M4(c1) => @Expect(c1.val, 0)
            case _ => @Assert(false) 
        }

        let inst5 = (e.construct("M5<default.E>", [E.M1]) as E).getOrThrow()
        match(inst5) {
            case E.M5(e) => match(e) {
                    case E.M1 => E.M1
                    case _ => @Assert(false)
            }
            case _ => @Assert(false) 
        }

        match (inst5) {
            case E.M5(e) => match(e) {
                    case E.M1 => E.M1
                    case _ => @Assert(false)
            }
            case _ => @Assert(false) 
        }
    }

    @TestCase
    func testConstructInvalid() {
        let e = EnumTypeInfo.get("default.E")

        @Expect(@AssertThrows[InvocationTargetException](e.construct("M2<Int64>", [])).message.contains("Failed to construct enum `default.E` with constructor `M2<Int64>`"))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M3<Int64, String>", [0])).message.contains("Failed to construct enum `default.E` with constructor `M3<Int64, String>`"))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M4<default.C1>", [])).message.contains("Failed to construct enum `default.E` with constructor `M4<default.C1>`"))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M5<default.E>", [])).message.contains("Failed to construct enum `default.E` with constructor `M5<default.E>`"))

        @Expect(@AssertThrows[InvocationTargetException](e.construct("M2<Int64>", ["abc"])).message.contains("Argument index 0 expected"))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M3<Int64, String>", [0, 123])).message.contains("Argument index 1 expected"))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M4<default.C1>", [E.M1])).message.contains("Argument index 0 expected"))
        @Expect(@AssertThrows[InvocationTargetException](e.construct("M5<default.E>", [C1()])).message.contains("Argument index 0 expected"))
    }

    @TestCase
    func testConstructUnknownConstructor() {
        let e = EnumTypeInfo.get("default.E")
        @ExpectThrows[InfoNotFoundException](e.construct("M9", [])).getOrThrow()
        @ExpectThrows[InfoNotFoundException](e.construct("default.E.M2<Int64>", [0])).getOrThrow()
    }

    @TestCase
    func testDestruct() {
        let e = EnumTypeInfo.get("default.E")
        var (info, value) = e.destruct(E.M1)
        @Expect(info.name, "M1")
        @Expect(info.qualifiedName, "default.E.M1")
        @Expect(value.size, 0)

        (info, value) = e.destruct(E.M2(42))
        @Expect(info.name, "M2")
        @Expect(info.qualifiedName, "default.E.M2<Int64>")
        @Expect(value.size, 1)
        @Expect(value[0] as Int64, Some(42))
        @Expect(info == EnumConstructorInfo.of(E.M2(42)))

        (info, value) = e.destruct(E.M3(42, "abc"))
        @Expect(info.name, "M3")
        @Expect(info.qualifiedName, "default.E.M3<Int64, String>")
        @Expect(value.size, 2)
        @Expect(value[0] as Int64, Some(42))
        @Expect(value[1] as String, Some("abc"))

        (info, value) = e.destruct(E.M4(C1(42)))
        @Expect(info.name, "M4")
        @Expect(info.qualifiedName, "default.E.M4<default.C1>")
        @Expect(value.size, 1)
        if (let Some(c1) <- (value[0] as C1)) {
            @Expect(c1.val, 42)
        } else {
            @Assert(false) 
        }

        (info, value) = e.destruct(E.M5(E.M2(42)))
        @Expect(info.name, "M5")
        @Expect(info.qualifiedName, "default.E.M5<default.E>")
        @Expect(value.size, 1)
        match ((value[0] as E).getOrThrow()) {
            case E.M2(val) => @Expect(val, 42)
            case _ => @Assert(false) 
        }
    }

    @TestCase
    func testDestructInvalid() {
        let e = EnumTypeInfo.get("default.E")
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E2.N1)).message.contains("Failed to destruct enum `default.E`: expected an instance of `default.E`"))
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(E2.N2(1))).message.contains("Failed to destruct enum `default.E`: expected an instance of `default.E`"))
        @Expect(@AssertThrows[InvocationTargetException](e.destruct(C1())).message.contains("Failed to destruct enum `default.E`: expected an instance of `default.E`"))
    }

    @TestCase
    func testConstructors() {
        let info = EnumTypeInfo.of<E>()
        let ctors = info.constructors.toArray()
        @Expect(ctors.size, 6)

        let names = Array<String>(ctors.size) { idx => ctors[idx].qualifiedName }
        @Expect(names.contains("default.E.M1"))
        @Expect(names.contains("default.E.M2<Int64>"))
        @Expect(names.contains("default.E.M2<Int64, Int64>"))
        @Expect(names.contains("default.E.M3<Int64, String>"))
        @Expect(names.contains("default.E.M4<default.C1>"))
        @Expect(names.contains("default.E.M5<default.E>"))
    }

    /* func getConstructor(constructor: String, argsCount!: Int64 = 0): EnumConstructInfo */
    @TestCase
    func testGetConstructor() {
        let e = EnumTypeInfo.get("default.E")
        let c1 = e.getConstructor("M1")
        @Expect(c1.name, "M1")
        @Expect(c1.qualifiedName, "default.E.M1")

        var c2 = e.getConstructor("M2", argsCount: 1)
        @Expect(c2.qualifiedName, "default.E.M2<Int64>")

        c2 = e.getConstructor("M2", argsCount: 2)
        @Expect(c2.qualifiedName, "default.E.M2<Int64, Int64>")

        let c3 = e.getConstructor("M3", argsCount: 2)
        @Expect(c3.qualifiedName, "default.E.M3<Int64, String>")

        let c4 = e.getConstructor("M4", argsCount: 1)
        @Expect(c4.qualifiedName, "default.E.M4<default.C1>")

        let c5 = e.getConstructor("M5", argsCount: 1)
        @Expect(c5.qualifiedName, "default.E.M5<default.E>")
    }

    @TestCase
    func testGetConstructorInvalid() {
        let e = EnumTypeInfo.get("default.E")
        @ExpectThrows[InfoNotFoundException](e.getConstructor("M9")).getOrThrow()
        @ExpectThrows[InfoNotFoundException](e.getConstructor("M2")).getOrThrow()
        @ExpectThrows[InfoNotFoundException](e.getConstructor("M2", argsCount: 3)).getOrThrow()
    }
}

@Test
class EnumConstructorInfoTest {
    @TestCase
    func testConstructorsProperty() {
        let info = EnumTypeInfo.of<EAnno>()
        let ctors = info.constructors.toArray()
        @Expect(ctors.size, 5)

        var hasA = false
        var hasB1 = false
        var hasB2 = false
        var hasB3 = false
        var hasC = false
        for (ctor in ctors) {
            if (ctor.qualifiedName.endsWith(".A")) {
                hasA = true
            } else if (ctor.qualifiedName.endsWith(".B")) {
                hasB1 = true
            } else if (ctor.qualifiedName.endsWith(".B<Int64>")) {
                hasB2 = true
            } else if (ctor.qualifiedName.endsWith(".B<Int64, String>")) {
                hasB3 = true
            } else if (ctor.qualifiedName.endsWith(".C")) {
                hasC = true
            }
        }
        @Expect(hasA, true)
        @Expect(hasB1, true)
        @Expect(hasB2, true)
        @Expect(hasB3, true)
        @Expect(hasC, true)
    }

    @Skip
    @TestCase
    func testConstructorInfoProperties() {
        let ctorA = EnumConstructorInfo.get("default.EAnno.A")
        let ctorB = EnumConstructorInfo.get("default.EAnno.B<Int64, String>")
        @Expect(ctorA.enumTypeInfo.qualifiedName, "default.EAnno")
        @Expect(ctorB.enumTypeInfo.qualifiedName, "default.EAnno")
        @Expect(ctorA.parameters.size, 0)
        @Expect(ctorB.parameters.size, 2)
        @Expect(ctorB.parameters[0].name, "Int64")
        @Expect(ctorB.parameters[1].name, "String")
        @Expect(ctorA.name, "A")
        @Expect(ctorB.name, "B")
        @Expect(ctorA.qualifiedName.endsWith(".A"))
        @Expect(ctorB.qualifiedName.endsWith(".B<Int64, String>"))
        @Expect(ctorB.toString(), ctorB.qualifiedName)

        @Expect(ctorA.findAllAnnotations<TagA>().size, 1)
        @Expect(ctorA.findAllAnnotation<TagB>().isNone(), true)
        @Expect(ctorB.findAllAnnotations<TagA>().size, 1)
        @Expect(ctorB.findAllAnnotations<TagB>().size, 1)
        @Expect(ctorB.findAllAnnotation<TagB>().isSome(), true)
        @Expect(ctorB.getAllAnnotations().size, 2)
        @Expect(ctorB.annotations.toArray().size, 2)
    }

    @TestCase
    func testConstructorApplyAndValues() {
        let info = EnumTypeInfo.of<EAnno>()
        let ctorB = info.getConstructor("B", argsCount: 2)
        let inst = (ctorB.apply([1, "ok"]) as EAnno).getOrThrow()
        match (inst) {
            case EAnno.B(v1, v2) =>
                @Expect(v1, 1)
                @Expect(v2, "ok")
            case _ => @Assert(false)
        }

        let values = ctorB.getAssociatedvalues(inst)
        @Expect(values.size, 2)
        @Expect(values[0] as Int64, Some(1))
        @Expect(values[1] as String, Some("ok"))

        let ctorFromInst = EnumConstructorInfo.of(inst)
        let ctorFromGet = EnumConstructorInfo.get("default.EAnno.B<Int64, String>")
        @Expect(ctorFromInst == ctorB)
        @Expect(ctorFromGet == ctorB)
        @Expect(ctorFromInst.hashCode(), ctorB.hashCode())
        @Expect(ctorFromGet.hashCode(), ctorB.hashCode())

        let mismatch = @ExpectThrows[IllegalTypeException](ctorB.getAssociatedvalues(EAnno.A)).getOrThrow()
        @Expect(mismatch.message.contains("does not match"))
    }

    @TestCase
    func testConstructorAssociatedValuesSimple() {
        let ctor = EnumTypeInfo.get("default.E5").getConstructor("M2", argsCount: 1)
        let values = ctor.getAssociatedvalues(E5.M2(7))
        @Expect(values.size, 1)
        @Expect(values[0] as Int64, Some(7))
    }

    @TestCase
    func testConstructorAssociatedValuesNoArgs() {
        let ctorA = EnumConstructorInfo.get("default.EAnno.A")
        let values = ctorA.getAssociatedvalues(EAnno.A)
        @Expect(values.size, 0)
    }

    @Skip
    @TestCase
    func testConstructorAnnotationsEmpty() {
        let ctor = EnumTypeInfo.get("default.E").getConstructor("M1")
        @Expect(ctor.annotations.toArray().size, 0)
        @Expect(ctor.findAllAnnotations<TagA>().size, 0)
        @Expect(ctor.findAllAnnotation<TagA>().isNone(), true)
        @Expect(ctor.getAllAnnotations().size, 0)
    }

    @TestCase
    func testConstructorGetInvalid() {
        @ExpectThrows[InfoNotFoundException](EnumConstructorInfo.get("default.EAnno.D")).getOrThrow()
        @ExpectThrows[InfoNotFoundException](EnumConstructorInfo.get("EAnno")).getOrThrow()
    }

    @TestCase
    func testConstructorOfInvalid() {
        @ExpectThrows[IllegalTypeException](EnumConstructorInfo.of(1)).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumConstructorInfo.of(C1())).getOrThrow()
    }

    @TestCase
    func testConstructorApplyInvalid() {
        let ctorB = EnumConstructorInfo.get("default.EAnno.B<Int64, String>")
        let countErr = @ExpectThrows[IllegalArgumentException](ctorB.apply([1])).getOrThrow()
        @Expect(countErr.message.contains("expected 2"))
        let typeErr = @ExpectThrows[IllegalTypeException](ctorB.apply([1, 2])).getOrThrow()
        @Expect(typeErr.message.contains("Argument index 1 expected String"))
    }

    @Skip
    @TestCase
    func testConstructorNoArgsAndEmptyAnnotations() {
        let ctorA = EnumConstructorInfo.get("default.EAnno.A")
        let inst = (ctorA.apply([]) as EAnno).getOrThrow()
        match (inst) {
            case EAnno.A => @Assert(true)
            case _ => @Assert(false)
        }
        let ctorFromInst = EnumConstructorInfo.of(inst)
        @Expect(ctorFromInst == ctorA)
        let values = ctorA.getAssociatedvalues(inst)
        @Expect(values.size, 0)

        let ctorC = EnumConstructorInfo.get("default.EAnno.C")
        @Expect(ctorC.getAllAnnotations().size, 0)
        @Expect(ctorC.findAllAnnotations<TagA>().size, 0)
        @Expect(ctorC.findAllAnnotation<TagA>().isNone(), true)
        @Expect(ctorC.annotations.toArray().size, 0)
    }

    @TestCase
    func testConstructorEquality() {
        let e = EnumTypeInfo.get("default.E2")
        let c1 = e.getConstructor("N1")
        let c2 = e.getConstructor("N2", argsCount: 1)
        @Expect(c1 == c1)
        @Expect(c1 == c2, false)
    }
}
