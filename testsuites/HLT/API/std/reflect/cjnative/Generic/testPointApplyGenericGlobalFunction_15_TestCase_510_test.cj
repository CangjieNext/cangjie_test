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
class testPointApplyGenericGlobalFunction_15 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_510(): Unit {
        // logger.info("testcase TestCase_510 begins.")
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_75")[0i64].apply([], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#13160: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_75")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>()])
            @Expect("assertion#13161: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_75")[0i64].apply([], [])
            @Expect("assertion#13162: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_75")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13163: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_75")[0i64].apply([], [])
            @Expect("assertion#13164: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_75")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13165: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_75")[0i64]
                .apply([], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#13166: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_75")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#13167: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_75")[0i64].apply([], [()])
            @Expect("assertion#13168: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_75")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13169: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_510 ends.")
    }
}
