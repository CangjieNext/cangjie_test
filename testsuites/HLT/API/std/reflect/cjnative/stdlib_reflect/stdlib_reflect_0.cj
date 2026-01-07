/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (not MAC) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.reflect.*
import std.collection.*
import std.fs.*
import std.math.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

// reflection for package `std.core`.
@Test
class TestStdCoreReflection {
    // global function with no overload.
    @TestCase
    func test00(): Unit {
        // PackageInfo.get("std.core").getFunction("sleep", [StructTypeInfo.of("std.core.Duration")])
    }
    // global function with overload.
    // class type.
    // generic class type.
    // non-generic class type.
    // struct type.
    // generic struct type.
    @TestCase
    func genericStructType(): Unit {
        let t = StructTypeInfo.get("Array<std.core.String>")
        @Expect(t.toString(), "Array<String>")
    }
    // non-generic struct type.
    @TestCase
    func nonGenericStructType(): Unit {
        let t = StructTypeInfo.get("std.core.String")
        @Expect(t.toString(), "String")
    }
    // interface type.
    @TestCase
    func interfaceType(): Unit {
        let t = InterfaceTypeInfo.get("std.core.Hashable")
        @Expect(t.toString(), "Hashable")
    }
}

// reflection for package `std.core` with out `std.core` qualifier.
@Test
class TestStdCoreReflectionUnqualified {
    // global function with no overload.
    @TestCase
    func test00(): Unit {
        // PackageInfo.get("std.core").getFunction("sleep", [StructTypeInfo.of("std.core.Duration")])
    }
    // global function with overload.
    // class type.
    // generic class type.
    // non-generic class type.
    // struct type.
    // generic struct type.
    @TestCase
    func genericStructType(): Unit {
        let t = StructTypeInfo.get("Array<std.core.String>")
        @Expect(t.toString(), "Array<String>")
    }
    // non-generic struct type.
    @TestCase
    func nonGenericStructType(): Unit {
        let t = StructTypeInfo.get("std.core.String")
        @Expect(t.toString(), "String")
    }
    // interface type.
    @TestCase
    func interfaceType(): Unit {
        let t = InterfaceTypeInfo.get("std.core.Hashable")
        @Expect(t.toString(), "Hashable")
    }
}

// reflection for package other than `std.core`.
@Test
class TestStdMiscReflection {
    // global function with no overload.
    @TestCase
    func test00(): Unit {
        // PackageInfo.get("std.core").getFunction("sleep", [StructTypeInfo.of("std.core.Duration")])
    }
    // global function with overload.
    @TestCase
    func globalFunctionWithOverload(): Unit {
        let p = PackageInfo.get("std.math")
        @Expect(p.toString(), "std.math")
        @Expect(p.functions.size > 0)
        p.getFunction("abs", [TypeInfo.of<Float16>()])
    }
    // generic global function.
    @TestCase
    func genericGlobalFunction(): Unit {
        
    }
    // class type.
    // generic class type.
    @TestCase
    func genericClassType(): Unit {
        let t = ClassTypeInfo.get("std.collection.ArrayList<std.core.String>")
        @Expect(t.toString(), "std.collection.ArrayList<String>")
    }
    // non-generic class type.
    @TestCase
    func nonGenericClassType(): Unit {
        let t = ClassTypeInfo.get("std.fs.Directory")
    }
    // struct type.
    // generic struct type.
    @TestCase
    func genericStructType(): Unit {
        let t = StructTypeInfo.get("std.unittest.RelativeDelta<Float64>")
        @Expect(t.toString(), "std.unittest.RelativeDelta<Float64>")
    }
    // non-generic struct type.
    @TestCase
    func nonGenericStructType(): Unit {
        let t = StructTypeInfo.get("std.time.DateTime")
        @Expect(t.toString(), "std.time.DateTime")
    }
    // interface type.
    @TestCase
    func interfaceType(): Unit {
        let t = InterfaceTypeInfo.get("std.convert.Formattable")
        @Expect(t.toString(), "std.convert.Formattable")
    }
}
