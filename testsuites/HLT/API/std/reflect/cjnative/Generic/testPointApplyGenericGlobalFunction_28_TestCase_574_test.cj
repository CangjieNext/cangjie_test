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
class testPointApplyGenericGlobalFunction_28 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_574(): Unit {
        // logger.info("testcase TestCase_574 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_139")[0i64]
            .apply([TypeInfo.of<Float64>()], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#14205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#14206: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#14207: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([TypeInfo.of<Float64>()], [])
            @Expect("assertion#14208: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([], [])
            @Expect("assertion#14209: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([], [])
            @Expect("assertion#14210: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([TypeInfo.of<Float64>()], [])
            @Expect("assertion#14212: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([], [])
            @Expect("assertion#14213: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([], [])
            @Expect("assertion#14214: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#14215: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 2.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([TypeInfo.of<Float64>()], [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#14216: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#14217: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#14218: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#14219: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 2.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14220: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([], [()])
            @Expect("assertion#14221: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_139")[0i64].apply([], [()])
            @Expect("assertion#14222: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_139")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#14223: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 1, got 2.")
        }
        // logger.info("testcase TestCase_574 ends.")
    }
}
