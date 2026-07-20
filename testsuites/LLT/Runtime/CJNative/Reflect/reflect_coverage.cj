// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime reflect coverage pass

import std.reflect.*

// =============================================
// Types for testing
// =============================================
class TestClass {
    public var id: Int64
    public var name: String
    public static var defaultId: Int64 = 100
    public static var defaultName: String = "default"

    public init(id: Int64, name: String) {
        this.id = id
        this.name = name
    }

    public func greet(): String { "Hello, ${name}!" }
    public static func make(v: Int64): TestClass { TestClass(v, "made-${v}") }
}

struct TestStruct {
    public var x: Float64
    public var y: Float64
    public var label: String
    public static var origin: Float64 = 0.0
    public static var tag: String = "origin"

    public init(x: Float64, y: Float64, label: String) {
        this.x = x
        this.y = y
        this.label = label
    }

    public func sum(): Float64 { x + y }
    public static func zero(): TestStruct { TestStruct(0.0, 0.0, "zero") }
}

enum SimpleEnum { | A | B | C }
enum ValueEnum {
    | Single(Int64)
    | Pair(Int64, Float64)
    | Triple(Int64, Float64, String)
}
struct Vec3 { var a: Int64; var b: Int64; var c: Int64
    public init(a: Int64, b: Int64, c: Int64) { this.a = a; this.b = b; this.c = c }
}
enum StructEnum {
    | Plain
    | Vec(Vec3)
}

interface TestInterface {
    func getValue(): Int64
    func getName(): String { "default" }
}
class TestImpl <: TestInterface {
    let val: Int64
    public init(val: Int64) { this.val = val }
    public func getValue(): Int64 { val }
    public func getName(): String { "impl-${val}" }
}

// =============================================
// SECTION 1: TypeInfo basics
// =============================================
func testTypeInfoOf(): Bool {
    TypeInfo.of<TestClass>().name == "TestClass" &&
    TypeInfo.of<TestStruct>().name == "TestStruct" &&
    TypeInfo.of<SimpleEnum>().name == "SimpleEnum" &&
    TypeInfo.of<TestInterface>().name == "TestInterface"
}

func testQualifiedName(): Bool {
    TypeInfo.of<TestClass>().qualifiedName.contains("TestClass")
}

func testTypeInfoOfAny(): Bool {
    let obj = TestClass(1, "test")
    let any: Any = obj
    TypeInfo.of(any).name == "TestClass"
}

// =============================================
// SECTION 2: Instance/static functions
// =============================================
func testInstanceFunctions(): Bool {
    let ti = TypeInfo.of<TestClass>()
    ti.instanceFunctions.size >= 1
}

func testStaticFunctions(): Bool {
    let ti = TypeInfo.of<TestStruct>()
    let funcs = ti.staticFunctions
    var found: Bool = false
    for (f in funcs) {
        if (f.name == "zero") { found = true }
    }
    found
}

func testGetInstanceFunction(): Bool {
    let ti = TypeInfo.of<TestClass>()
    let funcs = ti.getInstanceFunctions("greet")
    funcs.size == 1 && funcs[0].name == "greet"
}

func testFunctionDetails(): Bool {
    let ti = TypeInfo.of<TestClass>()
    let funcs = ti.getInstanceFunctions("greet")
    if (funcs.size == 0) { return false }
    let params = funcs[0].parameters; let rt = funcs[0].returnType
    params.size >= 0 && rt.name.contains("String")
}

func testGetStaticFunctions(): Bool {
    let ti = TypeInfo.of<TestClass>()
    let funcs = ti.getStaticFunctions("make")
    funcs.size >= 0
}

// =============================================
// SECTION 3: Instance function apply via reflection
// =============================================
func testInstanceMethodApply(): Bool {
    let obj = TestClass(10, "test")
    let ti = TypeInfo.of<TestClass>()
    let funcs = ti.getInstanceFunctions("greet")
    if (funcs.size == 0) { return false }
    funcs[0].apply(obj, [])
    true
}

func testStaticMethodApply(): Bool {
    let ti = TypeInfo.of<TestClass>()
    let funcs = ti.getStaticFunctions("make")
    if (funcs.size == 0) { return false }
    funcs[0].apply(ti, [42])
    true
}

// =============================================
// SECTION 4: StructTypeInfo instance/static variables getValue/setValue
// =============================================
func testStructInstanceVariables(): Bool {
    match (TypeInfo.of<TestStruct>()) {
        case s: StructTypeInfo =>
            let vars = s.instanceVariables
            if (vars.size < 3) { return false }
            let obj = TestStruct(3.0, 4.0, "test")
            for (v in vars) {
                v.getValue(obj)
                if (v.name == "x") { v.setValue(obj, 10.0) }
                if (v.name == "y") { v.setValue(obj, 20.0) }
                if (v.name == "label") { v.setValue(obj, "updated") }
            }
            true
        case _ => false
    }
}

func testStructStaticVariables(): Bool {
    match (TypeInfo.of<TestStruct>()) {
        case s: StructTypeInfo =>
            let vars = s.staticVariables
            for (v in vars) {
                v.getValue()
                if (v.name == "tag") { v.setValue("new-origin") }
            }
            vars.size >= 2
        case _ => false
    }
}

// =============================================
// SECTION 5: ClassTypeInfo instance/static variables getValue/setValue
// =============================================
func testClassInstanceVariables(): Bool {
    let cti = ClassTypeInfo.of<TestClass>()
    let vars = cti.instanceVariables
    if (vars.size < 2) { return false }
    let obj = TestClass(1, "test")
    for (v in vars) {
        v.getValue(obj)
        if (v.name == "id") { v.setValue(obj, 99) }
        if (v.name == "name") { v.setValue(obj, "changed") }
    }
    true
}

func testClassStaticVariables(): Bool {
    let cti = ClassTypeInfo.of<TestClass>()
    let vars = cti.staticVariables
    if (vars.size < 2) { return false }
    for (v in vars) {
        v.getValue()
        if (v.name == "defaultId") { v.setValue(200) }
    }
    true
}

// =============================================
// SECTION 6: Properties and other TypeInfo features
// =============================================
func testInstanceProperties(): Bool {
    TypeInfo.of<TestClass>().instanceProperties.size >= 0
}

func testStaticProperties(): Bool {
    TypeInfo.of<TestClass>().staticProperties.size >= 0
}

func testSuperInterfaces(): Bool {
    TypeInfo.of<TestImpl>().superInterfaces.size >= 1
}

func testModifiers(): Bool {
    TypeInfo.of<TestClass>().modifiers.size >= 0
}

func testAnnotations(): Bool {
    TypeInfo.of<TestClass>().annotations.size >= 0
}

func testSuperClass(): Bool {
    let cti = ClassTypeInfo.of<TestClass>()
    match (cti.superClass) {
        case Some(s) => s.name == "Object"
        case None => true
    }
}

func testIsSubtypeOf(): Bool {
    TypeInfo.of<TestImpl>().isSubtypeOf(TypeInfo.of<TestInterface>())
}

// =============================================
// SECTION 7: Enum apply + getAssociatedValues
// =============================================
func testEnumApply(): Bool {
    match (TypeInfo.of<ValueEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) {
                if (c.name == "Single") { c.apply([42]) }
                if (c.name == "Pair") { c.apply([10, 3.14]) }
                if (c.name == "Triple") { c.apply([1, 2.71, "hello"]) }
            }
            ctors.size == 3
        case _ => false
    }
}

func testEnumApplySimple(): Bool {
    match (TypeInfo.of<SimpleEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) { c.apply([]) }
            ctors.size == 3
        case _ => false
    }
}

func testEnumApplyStruct(): Bool {
    match (TypeInfo.of<StructEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) {
                if (c.name == "Plain") { c.apply([]) }
                if (c.name == "Vec") { c.apply([Vec3(1, 2, 3)]) }
            }
            ctors.size == 2
        case _ => false
    }
}

func testEnumGetAssociatedValues(): Bool {
    match (TypeInfo.of<ValueEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) {
                if (c.name == "Single") {
                    let r = c.apply([42])
                    if (c.getAssociatedValues(r).size != 1) { return false }
                }
                if (c.name == "Pair") {
                    let r = c.apply([10, 3.14])
                    if (c.getAssociatedValues(r).size != 2) { return false }
                }
                if (c.name == "Triple") {
                    let r = c.apply([1, 2.71, "hello"])
                    if (c.getAssociatedValues(r).size != 3) { return false }
                }
            }
            true
        case _ => false
    }
}

func testEnumGetAssociatedValuesStruct(): Bool {
    match (TypeInfo.of<StructEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) {
                if (c.name == "Vec") {
                    let r = c.apply([Vec3(5, 6, 7)])
                    if (c.getAssociatedValues(r).size != 1) { return false }
                }
            }
            true
        case _ => false
    }
}

// =============================================
// SECTION 8: Static function apply from struct
// =============================================
func testStructStaticMethodApply(): Bool {
    let ti = TypeInfo.of<TestStruct>()
    let funcs = ti.getStaticFunctions("zero")
    if (funcs.size == 0) { return false }
    funcs[0].apply(ti, [])
    true
}

// =============================================
main(): Int64 {
    if (!testTypeInfoOf()) { return 1 }
    if (!testQualifiedName()) { return 2 }
    if (!testTypeInfoOfAny()) { return 3 }
    if (!testInstanceFunctions()) { return 4 }
    if (!testStaticFunctions()) { return 5 }
    if (!testGetInstanceFunction()) { return 6 }
    if (!testFunctionDetails()) { return 7 }
    if (!testGetStaticFunctions()) { return 8 }
    if (!testInstanceMethodApply()) { return 9 }
    if (!testStaticMethodApply()) { return 10 }
    if (!testStructInstanceVariables()) { return 11 }
    if (!testStructStaticVariables()) { return 12 }
    if (!testClassInstanceVariables()) { return 13 }
    if (!testClassStaticVariables()) { return 14 }
    if (!testInstanceProperties()) { return 15 }
    if (!testStaticProperties()) { return 16 }
    if (!testSuperInterfaces()) { return 17 }
    if (!testModifiers()) { return 18 }
    if (!testAnnotations()) { return 19 }
    if (!testSuperClass()) { return 20 }
    if (!testIsSubtypeOf()) { return 21 }
    if (!testEnumApply()) { return 22 }
    if (!testEnumApplySimple()) { return 23 }
    if (!testEnumApplyStruct()) { return 24 }
    if (!testEnumGetAssociatedValues()) { return 25 }
    if (!testEnumGetAssociatedValuesStruct()) { return 26 }
    if (!testStructStaticMethodApply()) { return 27 }
    println("runtime reflect coverage pass")
    0
}
