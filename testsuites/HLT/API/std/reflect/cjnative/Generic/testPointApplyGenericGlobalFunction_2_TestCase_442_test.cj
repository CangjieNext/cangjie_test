/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// DEPENDENCE: dependency
// EXEC: %compiler %cmp_opt %compile_library dependency/*.cj -o libdependency.%library_suffix
// EXEC: %compiler %cmp_opt -L. -ldependency %f %cmp_utest_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testPointApplyGenericGlobalFunction_2 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_442(): Unit {
        // logger.info("testcase TestCase_442 begins.")
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([],
                    [GenericStructWith1TypeParameters<Int64>(), NonGenericStruct(),
                        GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12442: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int64>(), NonGenericStruct(),
                        GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12443: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [NonGenericStruct(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12444: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericStruct(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12445: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Int64>(), NonGenericStruct()])
            @Expect("assertion#12446: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), NonGenericStruct()])
            @Expect("assertion#12447: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([],
                    [GenericStructWith1TypeParameters<Int64>(), NonGenericStruct(),
                        GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#12448: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int64>(), NonGenericStruct(),
                        GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#12449: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [(), NonGenericStruct(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12450: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [(), NonGenericStruct(), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12451: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Int64>(), (), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12452: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()],
                    [GenericStructWith1TypeParameters<Int64>(), (), GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12453: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Int64>(), NonGenericStruct(), ()])
            @Expect("assertion#12454: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_7")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), NonGenericStruct(), ()])
            @Expect("assertion#12455: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_442 ends.")
    }
}
