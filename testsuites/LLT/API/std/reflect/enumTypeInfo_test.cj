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
 *          public func getAssociatedValues(instance: Any): ReadOnlyList<Any>
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
import std.collection.*

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
        @Expect(@AssertThrows[IllegalTypeException](e.destruct(E2.N1)).message.contains("Failed to destruct enum `default.E`: expected an instance of `default.E`"))
        @Expect(@AssertThrows[IllegalTypeException](e.destruct(E2.N2(1))).message.contains("Failed to destruct enum `default.E`: expected an instance of `default.E`"))
        @Expect(@AssertThrows[IllegalTypeException](e.destruct(C1())).message.contains("Failed to destruct enum `default.E`: expected an instance of `default.E`"))
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
    func testConstructorGet() {
        var ctor = EnumConstructorInfo.get("default.E2.N1")
        @Expect(ctor.name, "N1")
        @Expect(ctor.qualifiedName, "default.E2.N1")

        ctor = EnumConstructorInfo.get("default.E2.N2<Int64>")
        @Expect(ctor.name, "N2")
        @Expect(ctor.qualifiedName, "default.E2.N2<Int64>")

        ctor = EnumConstructorInfo.get("default.E.M1")
        @Expect(ctor.name, "M1")
        @Expect(ctor.qualifiedName, "default.E.M1")

        ctor = EnumConstructorInfo.get("default.E.M3<Int64, String>")
        @Expect(ctor.name, "M3")
        @Expect(ctor.qualifiedName, "default.E.M3<Int64, String>")

        ctor = EnumConstructorInfo.get("default.E.M4<default.C1>")
        @Expect(ctor.name, "M4")
        @Expect(ctor.qualifiedName, "default.E.M4<default.C1>")

        ctor = EnumConstructorInfo.get("default.E.M5<default.E>")
        @Expect(ctor.name, "M5")
        @Expect(ctor.qualifiedName, "default.E.M5<default.E>")

    }
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

        let values = ctorB.getAssociatedValues(inst)
        @Expect(values.size, 2)
        @Expect(values[0] as Int64, Some(1))
        @Expect(values[1] as String, Some("ok"))

        let ctorFromInst = EnumConstructorInfo.of(inst)
        let ctorFromGet = EnumConstructorInfo.get("default.EAnno.B<Int64, String>")
        @Expect(ctorFromInst == ctorB)
        @Expect(ctorFromGet == ctorB)
        @Expect(ctorFromInst.hashCode(), ctorB.hashCode())
        @Expect(ctorFromGet.hashCode(), ctorB.hashCode())

        let mismatch = @ExpectThrows[IllegalTypeException](ctorB.getAssociatedValues(EAnno.A)).getOrThrow()
        @Expect(mismatch.message.contains("does not match"))
    }

    @TestCase
    func testConstructorAssociatedValuesSimple() {
        let ctor = EnumTypeInfo.get("default.E5").getConstructor("M2", argsCount: 1)
        let values = ctor.getAssociatedValues(E5.M2(7))
        @Expect(values.size, 1)
        @Expect(values[0] as Int64, Some(7))
    }

    @TestCase
    func testConstructorAssociatedValuesNoArgs() {
        let ctorA = EnumConstructorInfo.get("default.EAnno.A")
        let values = ctorA.getAssociatedValues(EAnno.A)
        @Expect(values.size, 0)
    }

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
        @ExpectThrows[IllegalTypeException](EnumConstructorInfo.get("default.EAnno.D")).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumConstructorInfo.get("EAnno")).getOrThrow()
    }

    @Skip
    @TestCase
    func testConstructorOfInvalid() {
        @ExpectThrows[IllegalTypeException](EnumConstructorInfo.of(1)).getOrThrow()
        @ExpectThrows[IllegalTypeException](EnumConstructorInfo.of(C1())).getOrThrow()
    }

    @TestCase
    func testConstructorApplyInvalid() {
        let ctorB = EnumConstructorInfo.get("default.EAnno.B<Int64, String>")
        let countErr = @ExpectThrows[InvocationTargetException](ctorB.apply([1])).getOrThrow()
        @Expect(countErr.message.contains("expected 2"))
        let typeErr = @ExpectThrows[InvocationTargetException](ctorB.apply([1, 2])).getOrThrow()
        @Expect(typeErr.message.contains("Argument index 1 expected String"))
    }

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
        let values = ctorA.getAssociatedValues(inst)
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

func constructorSignature(ctor: EnumConstructorInfo): String {
    if (ctor.parameters.size == 0) {
        return ctor.name
    }
    let sb = StringBuilder()
    sb.append(ctor.name)
    sb.append("<")
    for (idx in 0..ctor.parameters.size) {
        sb.append(ctor.parameters[idx].qualifiedName)
        if (idx < ctor.parameters.size - 1) {
            sb.append(", ")
        }
    }
    sb.append(">")
    sb.toString()
}

struct EnumCtorSpec {
    let name: String
    let args: Array<Any>
    let verify: (ReadOnlyList<Any>) -> Unit

    init(name: String, args: Array<Any>, verify: (ReadOnlyList<Any>) -> Unit) {
        this.name = name
        this.args = args
        this.verify = verify
    }
}

func hasConstructorName(ctors: Collection<EnumConstructorInfo>, name: String): Bool {
    for (ctor in ctors) {
        if (ctor.name == name) {
            return true
        }
    }
    false
}

func expectNoAnnotations(ctor: EnumConstructorInfo): Unit {
    @Expect(ctor.annotations.size, 0)
    @Expect(ctor.getAllAnnotations().size, 0)
    @Expect(ctor.findAllAnnotations<Annotation>().size, 0)
    match (ctor.findAllAnnotation<Annotation>()) {
        case None => @Expect(true)
        case _ => @Expect(false)
    }
}

func verifyEmpty(values: ReadOnlyList<Any>): Unit {
    @Expect(values.size, 0)
}

func verifySingleInt32(values: ReadOnlyList<Any>, expected: Int32): Unit {
    @Expect(values.size, 1)
    @Expect(values[0] as Int32, expected)
}

func verifySingleInt64(values: ReadOnlyList<Any>, expected: Int64): Unit {
    @Expect(values.size, 1)
    @Expect(values[0] as Int64, expected)
}

func verifySingleInt8(values: ReadOnlyList<Any>, expected: Int8): Unit {
    @Expect(values.size, 1)
    @Expect(values[0] as Int8, expected)
}

func verifySingleFloat32(values: ReadOnlyList<Any>, expected: Float32): Unit {
    @Expect(values.size, 1)
    @Expect(values[0] as Float32, expected)
}

func verifySingleString(values: ReadOnlyList<Any>, expected: String): Unit {
    @Expect(values.size, 1)
    @Expect(values[0] as String, expected)
}

func verifySingleStruct(values: ReadOnlyList<Any>, expectedTypeName: String): Unit {
    @Expect(values.size, 1)
    @Expect(TypeInfo.of(values[0]).qualifiedName, expectedTypeName)
}

func verifyBoolInt64(values: ReadOnlyList<Any>, expectedBool: Bool, expectedInt64: Int64): Unit {
    @Expect(values.size, 2)
    @Expect(values[0] as Bool, expectedBool)
    @Expect(values[1] as Int64, expectedInt64)
}

func verifyInt64BoolFloat32(values: ReadOnlyList<Any>, expectedInt64: Int64, expectedBool: Bool,
    expectedFloat32: Float32): Unit {
    @Expect(values.size, 3)
    @Expect(values[0] as Int64, expectedInt64)
    @Expect(values[1] as Bool, expectedBool)
    @Expect(values[2] as Float32, expectedFloat32)
}

func verifyNestedChild(values: ReadOnlyList<Any>, expectedName: String): Unit {
    @Expect(values.size, 1)
    @Expect(EnumConstructorInfo.of(values[0]).name, expectedName)
}

func verifyNestedNonRefCase1(values: ReadOnlyList<Any>, expectedBool: Bool, expectedInt64: Int64): Unit {
    @Expect(values.size, 1)
    let innerCtor = EnumConstructorInfo.of(values[0])
    @Expect(innerCtor.name, "case1")
    let innerValues = innerCtor.getAssociatedValues(values[0])
    @Expect(innerValues.size, 2)
    @Expect(innerValues[0] as Bool, expectedBool)
    @Expect(innerValues[1] as Int64, expectedInt64)
}

func verifySelfCycleSome(values: ReadOnlyList<Any>, expectedInt64: Int64): Unit {
    @Expect(values.size, 1)
    match (values[0]) {
        case opt: ?SelfCycle =>
            match (opt) {
                case Some(v) =>
                    let innerCtor = EnumConstructorInfo.of(v)
                    @Expect(innerCtor.name, "case2")
                    let innerValues = innerCtor.getAssociatedValues(v)
                    @Expect(innerValues.size, 1)
                    @Expect(innerValues[0] as Int64, expectedInt64)
                case None =>
                    @Expect(false)
            }
        case _ =>
            @Expect(false)
    }
}

func exerciseEnumConstructorPublicInterfaces(info: EnumTypeInfo, spec: EnumCtorSpec): Unit {
    let ctor = info.getConstructor(spec.name, argsCount: spec.args.size)
    if (spec.args.size == 0) {
        let ctorNoCount = info.getConstructor(spec.name)
        @Expect(ctorNoCount, ctor)
    }
    @Expect(ctor.name, spec.name)
    @Expect(ctor.parameters.size, spec.args.size)
    @Expect(ctor.enumTypeInfo.qualifiedName, info.qualifiedName)
    let ctorByName = EnumConstructorInfo.get(ctor.qualifiedName)
    @Expect(ctorByName, ctor)
    @Expect(ctorByName.hashCode(), ctor.hashCode())
    @Expect(ctorByName == ctor, true)
    @Expect(ctor.toString(), ctor.qualifiedName)
    expectNoAnnotations(ctor)

    let instanceByInfo = info.construct(constructorSignature(ctor), spec.args)
    let (ctorFromInfo, valuesFromInfo) = info.destruct(instanceByInfo)
    @Expect(ctorFromInfo, ctor)
    @Expect(valuesFromInfo.size, spec.args.size)
    spec.verify(valuesFromInfo)
    @Expect(EnumConstructorInfo.of(instanceByInfo), ctor)
    @Expect(EnumTypeInfo.of(instanceByInfo).qualifiedName, info.qualifiedName)

    let instanceByCtor = ctor.apply(spec.args)
    let valuesByCtor = ctor.getAssociatedValues(instanceByCtor)
    @Expect(valuesByCtor.size, spec.args.size)
    spec.verify(valuesByCtor)
    @Expect(EnumConstructorInfo.of(instanceByCtor), ctor)
    @Expect(EnumTypeInfo.of(instanceByCtor).qualifiedName, info.qualifiedName)
}

func exerciseEnumPublicInterfaces<T>(specs: Array<EnumCtorSpec>): Unit {
    let info = EnumTypeInfo.of<T>()
    let infoByName = EnumTypeInfo.get(TypeInfo.of<T>().qualifiedName)
    @Expect(infoByName.qualifiedName, info.qualifiedName)
    @Expect(info.constructors.size, specs.size)
    for (spec in specs) {
        @Expect(hasConstructorName(info.constructors, spec.name))
    }
    for (spec in specs) {
        exerciseEnumConstructorPublicInterfaces(info, spec)
    }
}

enum NonExhaustiveUnassociatedSingle {
    A | ...
}

enum NonExhaustiveUnassociatedPair {
    A | B | ...
}

enum NonExhaustiveUnassociatedGeneric<T> {
    A | B | ...
}

enum NonExhaustiveAssociated {
    | Case1(Int64, Bool, Float32)
    | Case2(Int32)
    | Case3(Int32)
    | ...
}

enum ExhaustiveZeroSize {
    Case
}

enum ExhaustiveUnassociatedGeneric<T> {
    A
}

enum ExhaustiveUnassociated {
    A | B
}

enum ExhaustiveUnassociatedGenericPair<T> {
    A | B
}

enum ExhaustiveAssociatedOptionLikeRef {
    Case1 | Case2(Any)
}

struct MyStruct {}

enum ExhaustiveAssociatedOptionLikeNonRef {
    case1 | case2(MyStruct)
}

enum ExhaustiveAssociatedNonRef {
    | case1(Bool, Int64)
    | Case2(Float32)
    | Case3(Int8)
}

enum ExhaustiveAssociatedOptionLikeGeneric<T> {
    case1 | case2(T)
}

enum NestedChild {
    A | B
}

enum NestedParent {
    case1(NestedChild) | case2(ExhaustiveAssociatedNonRef)
}

enum ComboEnum {
    case1(ExhaustiveUnassociated, NestedChild) | case2
}

enum SelfCycle {
    case1(?SelfCycle) | case2(Int64)
}

@Test
class EnumTypeInfoTests {
    @TestCase
    func nonExhaustiveUnassociated() {
        let singleInfo = EnumTypeInfo.of<NonExhaustiveUnassociatedSingle>()
        @Expect(singleInfo.constructors.size, 1)
        let singleCtor = singleInfo.getConstructor("A")
        @Expect(singleCtor.parameters.size, 0)
        let singleValue = singleInfo.construct("A", Array<Any>())
        let (singleFromValue, singleValues) = singleInfo.destruct(singleValue)
        @Expect(singleFromValue, singleCtor)
        @Expect(singleValues.size, 0)
        let ctorByName = EnumConstructorInfo.get(singleCtor.qualifiedName)
        @Expect(ctorByName, singleCtor)

        let pairInfo = EnumTypeInfo.of<NonExhaustiveUnassociatedPair>()
        @Expect(pairInfo.constructors.size, 2)
        let aCtor = pairInfo.getConstructor("A")
        let bCtor = pairInfo.getConstructor("B")
        @Expect(EnumConstructorInfo.of(NonExhaustiveUnassociatedPair.A), aCtor)
        @Expect(EnumConstructorInfo.of(NonExhaustiveUnassociatedPair.B), bCtor)

        let genericInfo = EnumTypeInfo.of<NonExhaustiveUnassociatedGeneric<Int64>>()
        @Expect(genericInfo.constructors.size, 2)
        @Expect(genericInfo.getConstructor("A").parameters.size, 0)
    }

    @TestCase
    func nonExhaustiveAssociated() {
        let info = EnumTypeInfo.of<NonExhaustiveAssociated>()
        @Expect(info.constructors.size, 3)
        let case1 = info.getConstructor("Case1", argsCount: 3)
        @Expect(case1.parameters.size, 3)
        @Expect(case1.parameters[0].qualifiedName, TypeInfo.of<Int64>().qualifiedName)
        @Expect(case1.parameters[1].qualifiedName, TypeInfo.of<Bool>().qualifiedName)
        @Expect(case1.parameters[2].qualifiedName, TypeInfo.of<Float32>().qualifiedName)

        let case2 = info.getConstructor("Case2", argsCount: 1)
        let case3 = info.getConstructor("Case3", argsCount: 1)
        @Expect(case2.parameters[0].qualifiedName, TypeInfo.of<Int32>().qualifiedName)
        @Expect(case3.parameters[0].qualifiedName, TypeInfo.of<Int32>().qualifiedName)

        let args = Array<Any>(3) { idx =>
            match (idx) {
                case 0 => Int64(12)
                case 1 => true
                case _ => 1.25f32
            }
        }
        let instance = info.construct(constructorSignature(case1), args)
        let (ctor, values) = info.destruct(instance)
        @Expect(ctor, case1)
        @Expect(values.size, 3)
        @Expect(values[0] as Int64, Int64(12))
        @Expect(values[1] as Bool, true)
        @Expect(values[2] as Float32, 1.25f32)

        let assocValues = case1.getAssociatedValues(instance)
        @Expect(assocValues.size, 3)
        @Expect(EnumConstructorInfo.of(instance), case1)
    }

    @TestCase
    func exhaustiveZeroSizeAndUnassociated() {
        let zeroInfo = EnumTypeInfo.of<ExhaustiveZeroSize>()
        @Expect(zeroInfo.constructors.size, 1)
        let zeroCtor = zeroInfo.getConstructor("Case")
        let zeroValue = zeroInfo.construct("Case", Array<Any>())
        let (zeroCtorFromValue, zeroValues) = zeroInfo.destruct(zeroValue)
        @Expect(zeroCtorFromValue, zeroCtor)
        @Expect(zeroValues.size, 0)

        let unassociatedInfo = EnumTypeInfo.of<ExhaustiveUnassociated>()
        @Expect(unassociatedInfo.constructors.size, 2)
        @Expect(EnumConstructorInfo.of(ExhaustiveUnassociated.A), unassociatedInfo.getConstructor("A"))
        @Expect(EnumConstructorInfo.of(ExhaustiveUnassociated.B), unassociatedInfo.getConstructor("B"))

        let genericSingleInfo = EnumTypeInfo.of<ExhaustiveUnassociatedGeneric<Int32>>()
        @Expect(genericSingleInfo.constructors.size, 1)
        @Expect(genericSingleInfo.getConstructor("A").parameters.size, 0)

        let genericPairInfo = EnumTypeInfo.of<ExhaustiveUnassociatedGenericPair<Int64>>()
        @Expect(genericPairInfo.constructors.size, 2)
    }

    @TestCase
    func exhaustiveAssociatedOptionLikeRef() {
        let info = EnumTypeInfo.of<ExhaustiveAssociatedOptionLikeRef>()
        let case1 = info.getConstructor("Case1")
        let case2 = info.getConstructor("Case2", argsCount: 1)
        @Expect(case1.parameters.size, 0)
        @Expect(case2.parameters[0].qualifiedName, TypeInfo.of<Any>().qualifiedName)

        let value1 = info.construct("Case1", Array<Any>())
        let value2 = info.construct(constructorSignature(case2), Array<Any>(1, repeat: "payload"))
        let (ctor1, values1) = info.destruct(value1)
        @Expect(ctor1, case1)
        @Expect(values1.size, 0)

        let values2 = case2.getAssociatedValues(value2)
        @Expect(values2.size, 1)
        @Expect(values2[0] as String, "payload")
    }

    @TestCase
    func exhaustiveAssociatedOptionLikeNonRef() {
        let info = EnumTypeInfo.of<ExhaustiveAssociatedOptionLikeNonRef>()
        let case1 = info.getConstructor("case1")
        let case2 = info.getConstructor("case2", argsCount: 1)
        @Expect(case1.parameters.size, 0)
        @Expect(case2.parameters[0].qualifiedName, TypeInfo.of<MyStruct>().qualifiedName)

        let value = case2.apply(Array<Any>(1, repeat: MyStruct()))
        let (ctor, values) = info.destruct(value)
        @Expect(ctor, case2)
        @Expect(values.size, 1)
        @Expect(TypeInfo.of(values[0]).qualifiedName, TypeInfo.of<MyStruct>().qualifiedName)
    }

    @TestCase
    func exhaustiveAssociatedNonRef() {
        let info = EnumTypeInfo.of<ExhaustiveAssociatedNonRef>()
        let case1 = info.getConstructor("case1", argsCount: 2)
        @Expect(case1.parameters[0].qualifiedName, TypeInfo.of<Bool>().qualifiedName)
        @Expect(case1.parameters[1].qualifiedName, TypeInfo.of<Int64>().qualifiedName)
        let args = Array<Any>(2) { idx =>
            match (idx) {
                case 0 => false
                case _ => Int64(9)
            }
        }
        let instance = case1.apply(args)
        let values = case1.getAssociatedValues(instance)
        @Expect(values[0] as Bool, false)
        @Expect(values[1] as Int64, Int64(9))

        let case2 = info.getConstructor("Case2", argsCount: 1)
        let case3 = info.getConstructor("Case3", argsCount: 1)
        @Expect(case2.parameters[0].qualifiedName, TypeInfo.of<Float32>().qualifiedName)
        @Expect(case3.parameters[0].qualifiedName, TypeInfo.of<Int8>().qualifiedName)
    }

    @TestCase
    func exhaustiveAssociatedOptionLikeGeneric() {
        let info = EnumTypeInfo.of<ExhaustiveAssociatedOptionLikeGeneric<Int64>>()
        let case1 = info.getConstructor("case1")
        let case2 = info.getConstructor("case2", argsCount: 1)
        @Expect(case1.parameters.size, 0)
        @Expect(case2.parameters[0].qualifiedName, TypeInfo.of<Int64>().qualifiedName)

        let instance = info.construct(constructorSignature(case2), Array<Any>(1, repeat: Int64(123)))
        let (ctor, values) = info.destruct(instance)
        @Expect(ctor, case2)
        @Expect(values.size, 1)
        @Expect(values[0] as Int64, Int64(123))
    }

    @TestCase
    func nestedComboAndSelfCycle() {
        let nestedInfo = EnumTypeInfo.of<NestedParent>()
        let nestedCtor = nestedInfo.getConstructor("case1", argsCount: 1)
        @Expect(nestedCtor.parameters[0].qualifiedName, TypeInfo.of<NestedChild>().qualifiedName)
        let nestedInstance = NestedParent.case1(NestedChild.A)
        let (nestedFromValue, nestedValues) = nestedInfo.destruct(nestedInstance)
        @Expect(nestedFromValue, nestedCtor)
        @Expect(EnumConstructorInfo.of(nestedValues[0]).name, "A")

        let comboInfo = EnumTypeInfo.of<ComboEnum>()
        let comboCtor = comboInfo.getConstructor("case1", argsCount: 2)
        @Expect(comboCtor.parameters[0].qualifiedName, TypeInfo.of<ExhaustiveUnassociated>().qualifiedName)
        @Expect(comboCtor.parameters[1].qualifiedName, TypeInfo.of<NestedChild>().qualifiedName)
        let comboInstance = ComboEnum.case1(ExhaustiveUnassociated.B, NestedChild.B)
        let comboValues = comboCtor.getAssociatedValues(comboInstance)
        @Expect(EnumConstructorInfo.of(comboValues[0]).name, "B")
        @Expect(EnumConstructorInfo.of(comboValues[1]).name, "B")

        let selfInfo = EnumTypeInfo.of<SelfCycle>()
        let selfCtor = selfInfo.getConstructor("case1", argsCount: 1)
        let selfInstance = SelfCycle.case1(None)
        let (_, selfValues) = selfInfo.destruct(selfInstance)
        @Expect(selfCtor.parameters.size, 1)
        @Expect(selfValues.size, 1)
        @Expect(selfCtor.parameters[0].qualifiedName, TypeInfo.of(selfValues[0]).qualifiedName)
    }

    @TestCase
    func lookupAndQualifiedConstruct() {
        let info = EnumTypeInfo.of<ExhaustiveAssociatedOptionLikeRef>()
        let byName = EnumTypeInfo.get(TypeInfo.of<ExhaustiveAssociatedOptionLikeRef>().qualifiedName)
        @Expect(byName.qualifiedName, info.qualifiedName)

        let case2 = info.getConstructor("Case2", argsCount: 1)
        let case2ByName = EnumConstructorInfo.get(case2.qualifiedName)
        @Expect(case2ByName.qualifiedName, case2.qualifiedName)

        let qualifiedSignature = constructorSignature(case2)
        let instance = info.construct(qualifiedSignature, Array<Any>(1, repeat: "payload"))
        let (ctor, values) = info.destruct(instance)
        @Expect(ctor.qualifiedName, case2.qualifiedName)
        @Expect(values.size, 1)
        @Expect(values[0] as String, "payload")

        @Expect(EnumTypeInfo.of(instance).qualifiedName, info.qualifiedName)
        @Expect(EnumConstructorInfo.of(instance).qualifiedName, case2.qualifiedName)
    }

    @TestCase
    func nestedAssociatedValues() {
        let nestedInfo = EnumTypeInfo.of<NestedParent>()
        let inner = ExhaustiveAssociatedNonRef.case1(true, Int64(7))
        let outer = NestedParent.case2(inner)
        let (ctor, values) = nestedInfo.destruct(outer)
        @Expect(ctor.name, "case2")
        @Expect(values.size, 1)
        let innerCtor = EnumConstructorInfo.of(values[0])
        @Expect(innerCtor.name, "case1")
        let innerValues = innerCtor.getAssociatedValues(values[0])
        @Expect(innerValues.size, 2)
        @Expect(innerValues[0] as Bool, true)
        @Expect(innerValues[1] as Int64, Int64(7))
    }

    @TestCase
    func selfCycleDeep() {
        let info = EnumTypeInfo.of<SelfCycle>()
        let inner = SelfCycle.case2(Int64(42))
        let outer = SelfCycle.case1(Some(inner))
        let (ctor, values) = info.destruct(outer)
        @Expect(ctor.name, "case1")
        @Expect(values.size, 1)
        match (values[0]) {
            case opt: ?SelfCycle =>
                match (opt) {
                    case Some(v) =>
                        let (innerCtor, innerValues) = info.destruct(v)
                        @Expect(innerCtor.name, "case2")
                        @Expect(innerValues.size, 1)
                        @Expect(innerValues[0] as Int64, Int64(42))
                    case None =>
                        @Expect(false, true)
                }
            case _ =>
                @Expect(false, true)
        }
    }

    @TestCase
    func allEnumsPublicInterfaces() {
        let nonExhaustiveSingle = ArrayList<EnumCtorSpec>()
        nonExhaustiveSingle.add(EnumCtorSpec("A", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<NonExhaustiveUnassociatedSingle>(nonExhaustiveSingle.toArray())

        let nonExhaustivePair = ArrayList<EnumCtorSpec>()
        nonExhaustivePair.add(EnumCtorSpec("A", Array<Any>(), verifyEmpty))
        nonExhaustivePair.add(EnumCtorSpec("B", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<NonExhaustiveUnassociatedPair>(nonExhaustivePair.toArray())

        let nonExhaustiveGeneric = ArrayList<EnumCtorSpec>()
        nonExhaustiveGeneric.add(EnumCtorSpec("A", Array<Any>(), verifyEmpty))
        nonExhaustiveGeneric.add(EnumCtorSpec("B", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<NonExhaustiveUnassociatedGeneric<Int64>>(nonExhaustiveGeneric.toArray())

        let nonExhaustiveAssociated = ArrayList<EnumCtorSpec>()
        let case1Args = Array<Any>(3) { idx =>
            match (idx) {
                case 0 => Int64(12)
                case 1 => true
                case _ => 1.25f32
            }
        }
        nonExhaustiveAssociated.add(EnumCtorSpec("Case1", case1Args, { values =>
            verifyInt64BoolFloat32(values, Int64(12), true, 1.25f32)
        }))
        nonExhaustiveAssociated.add(EnumCtorSpec("Case2", Array<Any>(1, repeat: Int32(7)), { values =>
            verifySingleInt32(values, Int32(7))
        }))
        nonExhaustiveAssociated.add(EnumCtorSpec("Case3", Array<Any>(1, repeat: Int32(9)), { values =>
            verifySingleInt32(values, Int32(9))
        }))
        exerciseEnumPublicInterfaces<NonExhaustiveAssociated>(nonExhaustiveAssociated.toArray())

        let exhaustiveZero = ArrayList<EnumCtorSpec>()
        exhaustiveZero.add(EnumCtorSpec("Case", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<ExhaustiveZeroSize>(exhaustiveZero.toArray())

        let exhaustiveUnassociatedGeneric = ArrayList<EnumCtorSpec>()
        exhaustiveUnassociatedGeneric.add(EnumCtorSpec("A", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<ExhaustiveUnassociatedGeneric<Int32>>(exhaustiveUnassociatedGeneric.toArray())

        let exhaustiveUnassociated = ArrayList<EnumCtorSpec>()
        exhaustiveUnassociated.add(EnumCtorSpec("A", Array<Any>(), verifyEmpty))
        exhaustiveUnassociated.add(EnumCtorSpec("B", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<ExhaustiveUnassociated>(exhaustiveUnassociated.toArray())

        let exhaustiveUnassociatedGenericPair = ArrayList<EnumCtorSpec>()
        exhaustiveUnassociatedGenericPair.add(EnumCtorSpec("A", Array<Any>(), verifyEmpty))
        exhaustiveUnassociatedGenericPair.add(EnumCtorSpec("B", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<ExhaustiveUnassociatedGenericPair<Int64>>(exhaustiveUnassociatedGenericPair.toArray())

        let optionLikeRef = ArrayList<EnumCtorSpec>()
        optionLikeRef.add(EnumCtorSpec("Case1", Array<Any>(), verifyEmpty))
        optionLikeRef.add(EnumCtorSpec("Case2", Array<Any>(1, repeat: "payload"), { values =>
            verifySingleString(values, "payload")
        }))
        exerciseEnumPublicInterfaces<ExhaustiveAssociatedOptionLikeRef>(optionLikeRef.toArray())

        let optionLikeNonRef = ArrayList<EnumCtorSpec>()
        optionLikeNonRef.add(EnumCtorSpec("case1", Array<Any>(), verifyEmpty))
        optionLikeNonRef.add(EnumCtorSpec("case2", Array<Any>(1, repeat: MyStruct()), { values =>
            verifySingleStruct(values, TypeInfo.of<MyStruct>().qualifiedName)
        }))
        exerciseEnumPublicInterfaces<ExhaustiveAssociatedOptionLikeNonRef>(optionLikeNonRef.toArray())

        let nonRefAssociated = ArrayList<EnumCtorSpec>()
        nonRefAssociated.add(EnumCtorSpec("case1", Array<Any>(2) { idx =>
            match (idx) {
                case 0 => false
                case _ => Int64(9)
            }
        }, { values =>
            verifyBoolInt64(values, false, Int64(9))
        }))
        nonRefAssociated.add(EnumCtorSpec("Case2", Array<Any>(1, repeat: 2.5f32), { values =>
            verifySingleFloat32(values, 2.5f32)
        }))
        nonRefAssociated.add(EnumCtorSpec("Case3", Array<Any>(1, repeat: Int8(7)), { values =>
            verifySingleInt8(values, Int8(7))
        }))
        exerciseEnumPublicInterfaces<ExhaustiveAssociatedNonRef>(nonRefAssociated.toArray())

        let optionLikeGeneric = ArrayList<EnumCtorSpec>()
        optionLikeGeneric.add(EnumCtorSpec("case1", Array<Any>(), verifyEmpty))
        optionLikeGeneric.add(EnumCtorSpec("case2", Array<Any>(1, repeat: Int64(123)), { values =>
            verifySingleInt64(values, Int64(123))
        }))
        exerciseEnumPublicInterfaces<ExhaustiveAssociatedOptionLikeGeneric<Int64>>(optionLikeGeneric.toArray())

        let nestedChild = ArrayList<EnumCtorSpec>()
        nestedChild.add(EnumCtorSpec("A", Array<Any>(), verifyEmpty))
        nestedChild.add(EnumCtorSpec("B", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<NestedChild>(nestedChild.toArray())

        let nestedParent = ArrayList<EnumCtorSpec>()
        nestedParent.add(EnumCtorSpec("case1", Array<Any>(1, repeat: NestedChild.A), { values =>
            verifyNestedChild(values, "A")
        }))
        let nestedInner = ExhaustiveAssociatedNonRef.case1(true, Int64(7))
        nestedParent.add(EnumCtorSpec("case2", Array<Any>(1, repeat: nestedInner), { values =>
            verifyNestedNonRefCase1(values, true, Int64(7))
        }))
        exerciseEnumPublicInterfaces<NestedParent>(nestedParent.toArray())

        let comboEnum = ArrayList<EnumCtorSpec>()
        comboEnum.add(EnumCtorSpec("case1", Array<Any>(2) { idx =>
            match (idx) {
                case 0 => ExhaustiveUnassociated.B
                case _ => NestedChild.B
            }
        }, { values =>
            @Expect(values.size, 2)
            @Expect(EnumConstructorInfo.of(values[0]).name, "B")
            @Expect(EnumConstructorInfo.of(values[1]).name, "B")
        }))
        comboEnum.add(EnumCtorSpec("case2", Array<Any>(), verifyEmpty))
        exerciseEnumPublicInterfaces<ComboEnum>(comboEnum.toArray())

        let selfCycle = ArrayList<EnumCtorSpec>()
        let selfInner = SelfCycle.case2(Int64(42))
        selfCycle.add(EnumCtorSpec("case1", Array<Any>(1, repeat: Some(selfInner)), { values =>
            verifySelfCycleSome(values, Int64(42))
        }))
        selfCycle.add(EnumCtorSpec("case2", Array<Any>(1, repeat: Int64(5)), { values =>
            verifySingleInt64(values, Int64(5))
        }))
        exerciseEnumPublicInterfaces<SelfCycle>(selfCycle.toArray())
    }
}
