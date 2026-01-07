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
import std.io.*
import std.math.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

// reflection for package `std.core`.
@Test
class TestStdCoreReflection {
    // global function with no overload.
    @TestCase
    func globalFunctionWithNoOverload(): Unit {
        let p = PackageInfo.get("std.core")
        let t = p.getFunction("sleep", [TypeInfo.of<Duration>()])
        @Expect(t.toString(), "func sleep(Duration): Unit")
        t.apply([Duration.nanosecond * 3])
    }
    // global function with overload.
    @TestCase
    func globalFunctionWithOverload(): Unit {
        let p = PackageInfo.get("std.core")
        let t = p.getFunction("print", [TypeInfo.of<Bool>(), TypeInfo.of<Bool>()])
        @Expect(t.toString(), "func print(Bool, Bool): Unit")
        let t1 = p.getFunction("print", [TypeInfo.of<Int32>(), TypeInfo.of<Bool>()])
        @Expect(t1.toString(), "func print(Int32, Bool): Unit")
        let t2 = p.getFunction("print", [TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()])
        @Expect(t2.toString(), "func print(UInt8, Bool): Unit")
        t2.apply([23u8, true])
    }
    // generic global function.
    @TestCase
    func genericGlobalFunction(): Unit {
        let p = PackageInfo.get("std.core")
        match (p.functions |> filter {f: GlobalFunctionInfo => f.name == "max"} |> first) {
            case None => @Assert(false)
            case Some(t) =>
                @Expect(t.toString(), "func max(T, T, Array<T>): T")
                let result = t.apply([TypeInfo.of<Int64>()], [1, 2, Array<Int64>()]) as Int64
                @Expect(result, 2)
        }
    }
    // class type.
    // generic class type.
    @TestCase
    func genericClassType(): Unit {
        let t = ClassTypeInfo.get("std.core.Box<std.core.String>")
        @Expect(t.toString(), "Box<String>")
    }
    // non-generic class type.
    @TestCase
    func nonGenericClassType(): Unit {
        let t = ClassTypeInfo.get("std.core.StringBuilder")
        @Expect(t.toString(), "StringBuilder")
    }
    // struct type.
    // generic struct type.
    @TestCase
    func genericStructType(): Unit {
        let t = StructTypeInfo.get("std.core.Array<std.core.String>")
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
    // class type.
    // generic class type.
    @TestCase
    func genericClassType(): Unit {
        let t = ClassTypeInfo.get("Box<String>")
        @Expect(t.toString(), "Box<String>")
    }
    // non-generic class type.
    @TestCase
    func nonGenericClassType(): Unit {
        let t = ClassTypeInfo.get("StringBuilder")
        @Expect(t.toString(), "StringBuilder")
    }
    // struct type.
    // generic struct type.
    @TestCase
    func genericStructType(): Unit {
        let t = StructTypeInfo.get("Array<String>")
        @Expect(t.toString(), "Array<String>")
    }
    // non-generic struct type.
    @TestCase
    func nonGenericStructType(): Unit {
        let t = StructTypeInfo.get("String")
        @Expect(t.toString(), "String")
    }
    // interface type.
    @TestCase
    func interfaceType(): Unit {
        let t = InterfaceTypeInfo.get("Hashable")
        @Expect(t.toString(), "Hashable")
    }
}

// reflection for package other than `std.core`.
@Test
class TestStdMiscReflection {
    // global function with no overload.
    @TestCase
    func test00(): Unit {
        let t = PackageInfo.get("std.io").getFunction("copy", [TypeInfo.of<InputStream>(), TypeInfo.of<OutputStream>()])
        @Expect(t.toString(), "func copy(std.io.InputStream, std.io.OutputStream): Int64")
    }
    // global function with overload.
    @TestCase
    func globalFunctionWithOverload(): Unit {
        let p = PackageInfo.get("std.math")
        @Expect(p.toString(), "std.math")
        @Expect(p.functions.size > 0)
        let t = p.getFunction("abs", [TypeInfo.of<Float16>()])
        @Expect(t.toString(), "func abs(Float16): Float16")
        let t1 = p.getFunction("abs", [TypeInfo.of<Float32>()])
        @Expect(t1.toString(), "func abs(Float32): Float32")
        let t2 = p.getFunction("abs", [TypeInfo.of<Float64>()])
        @Expect(t2.toString(), "func abs(Float64): Float64")
    }
    // generic global function.
    @TestCase
    func genericGlobalFunction(): Unit {
        let p = PackageInfo.get("std.collection")
        match (p.functions |> filter {f: GlobalFunctionInfo => f.name == "collectArrayList"} |> first) {
            case None => @Assert(false)
            case Some(t) => @Expect(t.toString(), "func collectArrayList(Iterable<T>): std.collection.ArrayList<T>")
        }
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
        @Expect(t.toString(), "std.fs.Directory")
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
