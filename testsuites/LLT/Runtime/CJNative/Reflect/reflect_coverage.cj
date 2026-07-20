// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime reflect coverage pass

import std.reflect.*
import std.runtime.*

// =============================================
// Types
// =============================================
class TestClass {
    public var id: Int64
    public var name: String
    public static var defaultId: Int64 = 100
    public static var defaultName: String = "default"
    public init(id: Int64, name: String) { this.id = id; this.name = name }
    public func greet(): String { "Hello, ${name}!" }
    public static func make(v: Int64): TestClass { TestClass(v, "made-${v}") }
}

struct Inner { public var val: Int64
    public init(v: Int64) { val = v }
}
struct Composite {
    public var prim: Int64
    public var dec: Float64
    public var nested: Inner
    public var title: String
    public static var counter: Int64 = 0
    public static var label: String = "composite"
    public init(prim: Int64, dec: Float64, nested: Inner, title: String) {
        this.prim = prim; this.dec = dec; this.nested = nested; this.title = title
    }
    public func describe(): String { "${prim}/${dec}/${title}" }
    public static func empty(): Composite { Composite(0, 0.0, Inner(0), "") }
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
enum StructEnum { | Plain | Vec(Vec3) }

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

class Box<T> {
    var data: T
    init(data: T) { this.data = data }
    public func unwrap(): T { data }
    public static func wrap(v: T): Box<T> { Box<T>(v) }
}

// =============================================
// 1: TypeInfo basics
// =============================================
func testTypeInfoOf(): Bool {
    TypeInfo.of<TestClass>().name == "TestClass" &&
    TypeInfo.of<Composite>().name == "Composite" &&
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
// 2: Functions
// =============================================
func testInstanceFunctions(): Bool {
    TypeInfo.of<TestClass>().instanceFunctions.size >= 1
}
func testStaticFunctions(): Bool {
    let funcs = TypeInfo.of<Composite>().staticFunctions
    var found = false
    for (f in funcs) { if (f.name == "empty") { found = true } }
    found
}
func testGetInstanceFunction(): Bool {
    let f = TypeInfo.of<TestClass>().getInstanceFunctions("greet")
    f.size == 1 && f[0].name == "greet"
}
func testFunctionDetails(): Bool {
    let funcs = TypeInfo.of<TestClass>().getInstanceFunctions("greet")
    if (funcs.size == 0) { return false }
    funcs[0].parameters.size >= 0 && funcs[0].returnType.name.contains("String")
}

// =============================================
// 3: Method apply via reflection
// =============================================
func testInstanceMethodApply(): Bool {
    let obj = TestClass(10, "test")
    let funcs = TypeInfo.of<TestClass>().getInstanceFunctions("greet")
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
func testStructStaticMethodApply(): Bool {
    let ti = TypeInfo.of<Composite>()
    let funcs = ti.getStaticFunctions("empty")
    if (funcs.size == 0) { return false }
    funcs[0].apply(ti, [])
    true
}

// =============================================
// 4: Generic method apply
// =============================================
func testGenericInstanceApply(): Bool {
    let ti = TypeInfo.of<Box<Int64>>()
    let funcs = ti.getInstanceFunctions("unwrap")
    if (funcs.size == 0) { return false }
    let obj = Box<Int64>(42)
    funcs[0].apply(obj, [])
    true
}
func testGenericStaticApply(): Bool {
    let ti = TypeInfo.of<Box<Int64>>()
    let funcs = ti.getStaticFunctions("wrap")
    if (funcs.size == 0) { return false }
    funcs[0].apply(ti, [99])
    true
}

// =============================================
// 5: Variables getValue/setValue - all field types
// =============================================
func testStructInstanceVariables(): Bool {
    match (TypeInfo.of<Composite>()) {
        case s: StructTypeInfo =>
            let vars = s.instanceVariables
            if (vars.size < 4) { return false }
            let obj = Composite(42, 3.14, Inner(99), "test")
            for (v in vars) {
                v.getValue(obj)
                if (v.name == "prim") { v.setValue(obj, 100) }
                if (v.name == "dec") { v.setValue(obj, 2.71) }
                if (v.name == "nested") { v.setValue(obj, Inner(88)) }
                if (v.name == "title") { v.setValue(obj, "updated") }
            }
            true
        case _ => false
    }
}
func testStructStaticVariables(): Bool {
    match (TypeInfo.of<Composite>()) {
        case s: StructTypeInfo =>
            let vars = s.staticVariables
            if (vars.size < 2) { return false }
            for (v in vars) {
                v.getValue()
                if (v.name == "counter") { v.setValue(999) }
                if (v.name == "label") { v.setValue("new") }
            }
            true
        case _ => false
    }
}
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
// 6: Properties, interfaces, modifiers, annotations
// =============================================
func testInstanceProperties(): Bool { TypeInfo.of<TestClass>().instanceProperties.size >= 0 }
func testStaticProperties(): Bool { TypeInfo.of<TestClass>().staticProperties.size >= 0 }
func testSuperInterfaces(): Bool { TypeInfo.of<TestImpl>().superInterfaces.size >= 1 }
func testModifiers(): Bool { TypeInfo.of<TestClass>().modifiers.size >= 0 }
func testAnnotations(): Bool { TypeInfo.of<TestClass>().annotations.size >= 0 }
func testSuperClass(): Bool {
    match (ClassTypeInfo.of<TestClass>().superClass) {
        case Some(s) => s.name == "Object"
        case None => true
    }
}
func testIsSubtypeOf(): Bool {
    TypeInfo.of<TestImpl>().isSubtypeOf(TypeInfo.of<TestInterface>())
}

// =============================================
// 7: Enum apply + getAssociatedValues
// =============================================
func testEnumApplySimple(): Bool {
    match (TypeInfo.of<SimpleEnum>()) {
        case et: EnumTypeInfo =>
            for (c in et.constructors) { c.apply([]) }
            et.constructors.size == 3
        case _ => false
    }
}
func testEnumApplyValue(): Bool {
    match (TypeInfo.of<ValueEnum>()) {
        case et: EnumTypeInfo =>
            for (c in et.constructors) {
                if (c.name == "Single") { c.apply([42]) }
                if (c.name == "Pair") { c.apply([10, 3.14]) }
                if (c.name == "Triple") { c.apply([1, 2.71, "hello"]) }
            }
            et.constructors.size == 3
        case _ => false
    }
}
func testEnumApplyStruct(): Bool {
    match (TypeInfo.of<StructEnum>()) {
        case et: EnumTypeInfo =>
            for (c in et.constructors) {
                if (c.name == "Plain") { c.apply([]) }
                if (c.name == "Vec") { c.apply([Vec3(1, 2, 3)]) }
            }
            et.constructors.size == 2
        case _ => false
    }
}
func testEnumGetAssociatedValues(): Bool {
    match (TypeInfo.of<ValueEnum>()) {
        case et: EnumTypeInfo =>
            for (c in et.constructors) {
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
            for (c in et.constructors) {
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
// 8: Struct copy to trigger CJ_MCC_CopyStructField
// =============================================
func testStructCopy(): Bool {
    let a = Vec3(1, 2, 3)
    let b = a
    blackBox(b.a + b.b + b.c)
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
    if (!testInstanceMethodApply()) { return 8 }
    if (!testStaticMethodApply()) { return 9 }
    if (!testStructStaticMethodApply()) { return 10 }
    if (!testGenericInstanceApply()) { return 11 }
    if (!testGenericStaticApply()) { return 12 }
    if (!testStructInstanceVariables()) { return 13 }
    if (!testStructStaticVariables()) { return 14 }
    if (!testClassInstanceVariables()) { return 15 }
    if (!testClassStaticVariables()) { return 16 }
    if (!testInstanceProperties()) { return 17 }
    if (!testStaticProperties()) { return 18 }
    if (!testSuperInterfaces()) { return 19 }
    if (!testModifiers()) { return 20 }
    if (!testAnnotations()) { return 21 }
    if (!testSuperClass()) { return 22 }
    if (!testIsSubtypeOf()) { return 23 }
    if (!testEnumApplySimple()) { return 24 }
    if (!testEnumApplyValue()) { return 25 }
    if (!testEnumApplyStruct()) { return 26 }
    if (!testEnumGetAssociatedValues()) { return 27 }
    if (!testEnumGetAssociatedValuesStruct()) { return 28 }
    if (!testStructCopy()) { return 29 }
    println("runtime reflect coverage pass")
    0
}
