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
class testPointApplyGenericGlobalFunction_16 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_512(): Unit {
        // logger.info("testcase TestCase_512 begins.")
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#13180: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_77")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#13181: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([], [])
            @Expect("assertion#13182: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13183: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([], [])
            @Expect("assertion#13184: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#13185: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_77")[0i64]
                .apply([], [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#13186: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo
                .getFunctions("globalFunction_77")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#13187: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([], [()])
            @Expect("assertion#13188: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("非泛型函数指定了类型实参列表")
        try {
            packageInfo.getFunctions("globalFunction_77")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#13189: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        // logger.info("testcase TestCase_512 ends.")
    }
}
