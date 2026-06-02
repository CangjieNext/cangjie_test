/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./dependency
// (CJNATIVE) EXEC: %compiler %cmp_opt %compile_lib_opt dependency/dependency.cj --output-type=dylib -o module0.%dylib_suffix
// (CJNATIVE) EXEC: %compiler %cmp_opt %compile_lib_opt dependency/dependency1.cj --output-type=dylib -o module1.%dylib_suffix

// (CJNATIVE) EXEC: %compiler %cmp_opt %f -g -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*

@Test
class DynloadingTest {
    let info0 = PackageInfo.load("module0")
    let info1 = PackageInfo.load("module1")

    @TestCase
    func packageTest(): Unit {
        let packageInfo = PackageInfo.get("module0.a.b.c")
        let packageInfo1 = PackageInfo.get("module1.test")
        let packageInfoCmp = PackageInfo.get("module0.a.b.c")

        @Expect(packageInfo != packageInfo1)
        @Assert(packageInfo.toString(), "module0.a.b.c")
        @Assert(packageInfo.hashCode(), packageInfoCmp.hashCode())
        @Expect(packageInfo, packageInfoCmp)
        @Expect(packageInfo.name, "c")
        @Expect(packageInfo.qualifiedName, "module0.a.b.c")
        @Expect(packageInfo.qualifiedName, "module0.a.b.c")

        @Expect(packageInfo.getTypeInfo("module0.a.b.c.C0").toString(), "module0.a.b.c.C0")
        @Expect(packageInfo.getVariable("i8_0").getValue() as Int8, Some(12i8))
        @Expect(packageInfo.getFunction("f1", TypeInfo.of<Int64>()).apply(1) as Int64, Some(1))

        let packageTypeInfos = packageInfo.typeInfos
        @Expect(packageTypeInfos.toArray().contains(TypeInfo.get("module0.a.b.c.C0")))

        let packageVariablesInfos = packageInfo.variables
        @Assert(packageVariablesInfos.size, 32)
        @Expect(packageVariablesInfos.toArray().contains(packageInfo.getVariable("i8_0")))

        let packageFunctionInfos = packageInfo.functions
        @Assert(packageFunctionInfos.size, 4)
        @Expect(packageFunctionInfos.toArray().contains(packageInfo.getFunction("f1", TypeInfo.of<Int64>())))
    }

    @TestCase
    func globalFunctionTest() {
        let packageInfo = PackageInfo.get("module0.a.b.c")
        let fun = packageInfo.getFunction("f1", TypeInfo.of<Int64>())
        @Assert(fun.toString(), "func f1(Int64): Int64")
        @Assert((fun.apply(1) as Int64).getOrThrow(), 1)
    }

    @TestCase
    func globalVariableTest() {
        let packageInfo = PackageInfo.get("module0.a.b.c")
        let variable = packageInfo.getVariable("uint_0")
        @Assert(variable.toString(), "uint_0: UInt64")
        @Expect(variable.isMutable())
        @Assert((variable.getValue() as UInt64).getOrThrow(), 2012u64)
        variable.setValue(2023u64)
        @Assert((variable.getValue() as UInt64).getOrThrow(), 2023u64)
    }

    @TestCase
    func testException(): Unit {
        try {
            let packageInfo = PackageInfo.get("a")
        } catch (e: ReflectException | InfoNotFoundException) {
        }

        try {
            let packageInfo = PackageInfo.load("moduleo")
        } catch (e: IllegalArgumentException) {
            return
        }
        @Assert(false)
    }

    @TestCase
    func testException2(): Unit {
        let arr: Array<UInt8> = [101, 10, 60, 44, 44]
        let str = String.fromUtf8(arr)
        try {
            parseParameterTypes(str)
        } catch (e: ReflectException | UnsupportedException) {
            return
        }
        @Assert(false)
    }
}
