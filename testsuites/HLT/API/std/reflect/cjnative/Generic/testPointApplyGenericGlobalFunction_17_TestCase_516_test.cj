/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
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
class testPointApplyGenericGlobalFunction_17 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_516(): Unit {
        // logger.info("testcase TestCase_516 begins.")
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_81")[0i64].apply([], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#13220: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_81")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#13221: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_81")[0i64].apply([], [])
            @Expect("assertion#13222: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_81")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13223: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_81")[0i64].apply([], [])
            @Expect("assertion#13224: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_81")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13225: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_81")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#13226: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_81")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#13227: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_81")[0i64].apply([], [()])
            @Expect("assertion#13228: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_81")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13229: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_516 ends.")
    }
}
