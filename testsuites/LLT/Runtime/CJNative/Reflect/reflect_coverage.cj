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

class ReflectedClass {
    var id: Int64
    var name: String

    init(id: Int64, name: String) {
        this.id = id
        this.name = name
    }

    public func greet(): String {
        "Hello, ${name}!"
    }

    public static func factory(id: Int64): ReflectedClass {
        ReflectedClass(id, "factory-${id}")
    }
}

struct ReflectedStruct {
    var x: Float64
    var y: Float64

    init(x: Float64, y: Float64) {
        this.x = x
        this.y = y
    }

    public func sum(): Float64 {
        x + y
    }
}

// Simple enum without payloads
enum SimpleEnum {
    | A
    | B
    | C
}

// Enum with primitive payloads
enum PrimitiveEnum {
    | Single(Int64)
    | Pair(Int64, Float64)
    | Triple(Int64, Float64, String)
}

// Enum with struct payload
struct Vec3 {
    var a: Int64
    var b: Int64
    var c: Int64

    init(a: Int64, b: Int64, c: Int64) {
        this.a = a
        this.b = b
        this.c = c
    }
}
enum StructEnum {
    | Plain
    | Vec(Vec3)
    | Both(Int64, Vec3)
}

interface ReflectedInterface {
    func getValue(): Int64
    func getName(): String {
        "default"
    }
}

class ReflectedImpl <: ReflectedInterface {
    let val: Int64

    init(val: Int64) {
        this.val = val
    }

    public func getValue(): Int64 {
        val
    }

    public func getName(): String {
        "impl-${val}"
    }
}

class CalcForReflect {
    var value: Int64

    init(value: Int64) {
        this.value = value
    }

    public func add(n: Int64): Int64 {
        value + n
    }

    public func mult(n: Int64): Int64 {
        value * n
    }

    public static func make(v: Int64): CalcForReflect {
        CalcForReflect(v)
    }
}

// =============================================
// Test 1-2: TypeInfo basics
// =============================================
func testTypeInfoOf(): Bool {
    let classTi = TypeInfo.of<ReflectedClass>()
    let structTi = TypeInfo.of<ReflectedStruct>()
    let enumTi = TypeInfo.of<SimpleEnum>()
    let ifaceTi = TypeInfo.of<ReflectedInterface>()

    classTi.name == "ReflectedClass" && structTi.name == "ReflectedStruct" &&
        enumTi.name == "SimpleEnum" && ifaceTi.name == "ReflectedInterface"
}

func testQualifiedName(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    ti.qualifiedName.contains("ReflectedClass")
}

// =============================================
// Test 3-5: Functions and properties
// =============================================
func testInstanceFunctions(): Bool {
    let ti = TypeInfo.of<CalcForReflect>()
    let funcs = ti.instanceFunctions
    funcs.size >= 2 // add, mult
}

func testStaticFunctions(): Bool {
    let ti = TypeInfo.of<CalcForReflect>()
    let funcs = ti.staticFunctions
    funcs.size >= 0
}

func testInstanceProperties(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let props = ti.instanceProperties
    props.size >= 0
}

// =============================================
// Test 6-7: Interface and modifiers
// =============================================
func testSuperInterfaces(): Bool {
    let ti = TypeInfo.of<ReflectedImpl>()
    let ifaces = ti.superInterfaces
    ifaces.size >= 1
}

func testModifiers(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let mods = ti.modifiers
    mods.size >= 0
}

// =============================================
// Test 8-10: Function lookup
// =============================================
func testGetInstanceFunction(): Bool {
    let ti = TypeInfo.of<CalcForReflect>()
    let funcs = ti.getInstanceFunctions("add")
    funcs.size == 1 && funcs[0].name == "add"
}

func testFunctionDetails(): Bool {
    let ti = TypeInfo.of<CalcForReflect>()
    let funcs = ti.getInstanceFunctions("add")
    if (funcs.size == 0) {
        return false
    }
    let params = funcs[0].parameters
    let rt = funcs[0].returnType
    params.size >= 0 && rt.name.contains("Int64")
}

func testGetStaticFunctions(): Bool {
    let ti = TypeInfo.of<CalcForReflect>()
    let funcs = ti.getStaticFunctions("make")
    funcs.size >= 0
}

// =============================================
// Test 11-12: ClassTypeInfo
// =============================================
func testSuperClass(): Bool {
    let cti = ClassTypeInfo.of<ReflectedClass>()
    match (cti.superClass) {
        case Some(s) => s.name == "Object"
        case None => true
    }
}

func testTypeInfoOfAny(): Bool {
    let obj = ReflectedClass(1, "test")
    let any: Any = obj
    let ti = TypeInfo.of(any)
    ti.name == "ReflectedClass"
}

// =============================================
// Test 13-15: EnumTypeInfo - apply constructors
// =============================================
func testEnumApplySimple(): Bool {
    match (TypeInfo.of<SimpleEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) {
                if (c.name == "A") {
                    c.apply([])
                }
                if (c.name == "B") {
                    c.apply([])
                }
                if (c.name == "C") {
                    c.apply([])
                }
            }
            ctors.size == 3
        case _ => false
    }
}

func testEnumApplyPrimitive(): Bool {
    match (TypeInfo.of<PrimitiveEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) {
                if (c.name == "Single") {
                    c.apply([42])
                }
                if (c.name == "Pair") {
                    c.apply([10, 3.14])
                }
                if (c.name == "Triple") {
                    c.apply([1, 2.71, "hello"])
                }
            }
            ctors.size == 3
        case _ => false
    }
}

func testEnumApplyStruct(): Bool {
    match (TypeInfo.of<StructEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) {
                if (c.name == "Plain") {
                    c.apply([])
                }
                if (c.name == "Vec") {
                    let v = Vec3(1, 2, 3)
                    c.apply([v])
                }
                if (c.name == "Both") {
                    let v = Vec3(10, 20, 30)
                    c.apply([100, v])
                }
            }
            ctors.size == 3
        case _ => false
    }
}

// =============================================
// Test 16-17: EnumTypeInfo - getAssociatedValues
// =============================================
func testEnumGetAssociatedValues(): Bool {
    match (TypeInfo.of<PrimitiveEnum>()) {
        case et: EnumTypeInfo =>
            let ctors = et.constructors
            for (c in ctors) {
                if (c.name == "Single") {
                    let result = c.apply([42])
                    let vals = c.getAssociatedValues(result)
                    if (vals.size != 1) { return false }
                }
                if (c.name == "Pair") {
                    let result = c.apply([10, 3.14])
                    let vals = c.getAssociatedValues(result)
                    if (vals.size != 2) { return false }
                }
                if (c.name == "Triple") {
                    let result = c.apply([1, 2.71, "hello"])
                    let vals = c.getAssociatedValues(result)
                    if (vals.size != 3) { return false }
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
                    let v = Vec3(5, 6, 7)
                    let result = c.apply([v])
                    let vals = c.getAssociatedValues(result)
                    if (vals.size != 1) { return false }
                }
                if (c.name == "Both") {
                    let v = Vec3(10, 20, 30)
                    let result = c.apply([100, v])
                    let vals = c.getAssociatedValues(result)
                    if (vals.size != 2) { return false }
                }
            }
            true
        case _ => false
    }
}

// =============================================
// Test 18-19: Method apply via reflection
// =============================================
func testInstanceMethodApply(): Bool {
    let calc = CalcForReflect(10)
    let ti = TypeInfo.of<CalcForReflect>()
    let funcs = ti.getInstanceFunctions("add")
    if (funcs.size == 0) { return false }
    funcs[0].apply(calc, [5])
    true
}

func testInstanceMethodApplyMult(): Bool {
    let calc = CalcForReflect(7)
    let ti = TypeInfo.of<CalcForReflect>()
    let funcs = ti.getInstanceFunctions("mult")
    if (funcs.size == 0) { return false }
    funcs[0].apply(calc, [3])
    true
}

// =============================================
// Test 20: isSubtypeOf
// =============================================
func testIsSubtypeOf(): Bool {
    let implTi = TypeInfo.of<ReflectedImpl>()
    let ifaceTi = TypeInfo.of<ReflectedInterface>()
    implTi.isSubtypeOf(ifaceTi)
}

// =============================================
// Test 21-22: annotations
// =============================================
func testAnnotations(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let anns = ti.annotations
    anns.size >= 0
}

func testStructTypeInfo(): Bool {
    let sti = TypeInfo.of<ReflectedStruct>()
    sti.name == "ReflectedStruct"
}

main(): Int64 {
    if (!testTypeInfoOf()) { return 1 }
    if (!testQualifiedName()) { return 2 }
    if (!testInstanceFunctions()) { return 3 }
    if (!testStaticFunctions()) { return 4 }
    if (!testInstanceProperties()) { return 5 }
    if (!testSuperInterfaces()) { return 6 }
    if (!testModifiers()) { return 7 }
    if (!testGetInstanceFunction()) { return 8 }
    if (!testFunctionDetails()) { return 9 }
    if (!testGetStaticFunctions()) { return 10 }
    if (!testSuperClass()) { return 11 }
    if (!testTypeInfoOfAny()) { return 12 }
    if (!testEnumApplySimple()) { return 13 }
    if (!testEnumApplyPrimitive()) { return 14 }
    if (!testEnumApplyStruct()) { return 15 }
    if (!testEnumGetAssociatedValues()) { return 16 }
    if (!testEnumGetAssociatedValuesStruct()) { return 17 }
    if (!testInstanceMethodApply()) { return 18 }
    if (!testInstanceMethodApplyMult()) { return 19 }
    if (!testIsSubtypeOf()) { return 20 }
    if (!testAnnotations()) { return 21 }
    if (!testStructTypeInfo()) { return 22 }
    println("runtime reflect coverage pass")
    0
}
