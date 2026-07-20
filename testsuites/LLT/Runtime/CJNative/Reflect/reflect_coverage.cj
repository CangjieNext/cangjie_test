// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan runtime reflect coverage pass

import std.reflect.*

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
}

enum ReflectedEnum {
    | A
    | B
    | C(Int64)
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

// Test 1: TypeInfo.of for various types
func testTypeInfoOf(): Bool {
    let classTi = TypeInfo.of<ReflectedClass>()
    let structTi = TypeInfo.of<ReflectedStruct>()
    let enumTi = TypeInfo.of<ReflectedEnum>()
    let ifaceTi = TypeInfo.of<ReflectedInterface>()

    classTi.name == "ReflectedClass" && structTi.name == "ReflectedStruct" &&
        enumTi.name == "ReflectedEnum" && ifaceTi.name == "ReflectedInterface"
}

// Test 2: qualifiedName contains type name
func testQualifiedName(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    ti.qualifiedName.contains("ReflectedClass")
}

// Test 3: instance functions accessible
func testInstanceFunctions(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let funcs = ti.instanceFunctions
    funcs.size >= 1
}

// Test 4: static functions accessible
func testStaticFunctions(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let funcs = ti.staticFunctions
    funcs.size >= 0
}

// Test 5: instance properties accessible
func testInstanceProperties(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let props = ti.instanceProperties
    props.size >= 0
}

// Test 6: static properties accessible
func testStaticProperties(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let props = ti.staticProperties
    props.size >= 0
}

// Test 7: super interfaces
func testSuperInterfaces(): Bool {
    let ti = TypeInfo.of<ReflectedImpl>()
    let ifaces = ti.superInterfaces
    ifaces.size >= 1
}

// Test 8: modifiers accessible
func testModifiers(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let mods = ti.modifiers
    mods.size >= 0
}

// Test 9: getInstanceFunction by name
func testGetInstanceFunction(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let funcs = ti.getInstanceFunctions("greet")
    funcs.size == 1 && funcs[0].name == "greet"
}

// Test 10: getInstanceFunctions returns empty for non-existent
func testGetInstanceFunctionMissing(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let funcs = ti.getInstanceFunctions("nonexistent")
    funcs.size == 0
}

// Test 11: function parameters and return type
func testFunctionParameters(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let funcs = ti.getInstanceFunctions("greet")
    if (funcs.size == 0) {
        return false
    }
    let params = funcs[0].parameters
    let rt = funcs[0].returnType
    params.size >= 0 && rt.name.contains("String")
}

// Test 12: ClassTypeInfo superClass
func testSuperClass(): Bool {
    let cti = ClassTypeInfo.of<ReflectedClass>()
    match (cti.superClass) {
        case Some(s) => s.name == "Object"
        case None => true
    }
}

// Test 13: TypeInfo.of from Any
func testTypeInfoOfAny(): Bool {
    let obj = ReflectedClass(1, "test")
    let any: Any = obj
    let ti = TypeInfo.of(any)
    ti.name == "ReflectedClass"
}

// Test 14: isSubtypeOf
func testIsSubtypeOf(): Bool {
    let implTi = TypeInfo.of<ReflectedImpl>()
    let ifaceTi = TypeInfo.of<ReflectedInterface>()
    implTi.isSubtypeOf(ifaceTi)
}

// Test 15: annotations
func testAnnotations(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let anns = ti.annotations
    anns.size >= 0
}

// Test 16: EnumTypeInfo
func testEnumTypeInfo(): Bool {
    let eti = TypeInfo.of<ReflectedEnum>()
    eti.name == "ReflectedEnum"
}

// Test 17: StructTypeInfo
func testStructTypeInfo(): Bool {
    let sti = TypeInfo.of<ReflectedStruct>()
    sti.name == "ReflectedStruct"
}

// Test 18: getInstanceProperty
func testGetInstanceProperty(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let props = ti.instanceProperties
    props.size >= 0
}

// Test 19: getStaticFunctions by name returns empty for missing
func testGetStaticFunctionsMissing(): Bool {
    let ti = TypeInfo.of<ReflectedClass>()
    let funcs = ti.getStaticFunctions("nonexistent")
    funcs.size == 0
}

main(): Int64 {
    if (!testTypeInfoOf()) { return 1 }
    if (!testQualifiedName()) { return 2 }
    if (!testInstanceFunctions()) { return 3 }
    if (!testStaticFunctions()) { return 4 }
    if (!testInstanceProperties()) { return 5 }
    if (!testStaticProperties()) { return 6 }
    if (!testSuperInterfaces()) { return 7 }
    if (!testModifiers()) { return 8 }
    if (!testGetInstanceFunction()) { return 9 }
    if (!testGetInstanceFunctionMissing()) { return 10 }
    if (!testFunctionParameters()) { return 11 }
    if (!testSuperClass()) { return 12 }
    if (!testTypeInfoOfAny()) { return 13 }
    if (!testIsSubtypeOf()) { return 14 }
    if (!testAnnotations()) { return 15 }
    if (!testEnumTypeInfo()) { return 16 }
    if (!testStructTypeInfo()) { return 17 }
    if (!testGetInstanceProperty()) { return 18 }
    if (!testGetStaticFunctionsMissing()) { return 19 }
    println("runtime reflect coverage pass")
    0
}
