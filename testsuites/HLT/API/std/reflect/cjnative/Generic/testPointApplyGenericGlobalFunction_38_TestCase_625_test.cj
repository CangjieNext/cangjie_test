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
class testPointApplyGenericGlobalFunction_38 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_625(): Unit {
        // logger.info("testcase TestCase_625 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_190")[0i64]
            .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [123i64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [123i64])
            @Expect("assertion#15174: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [123i64])
            @Expect("assertion#15175: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#15176: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15177: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_190")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15178: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_190")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15179: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15180: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15181: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_190")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15182: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_190")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15183: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15184: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [123i64, 114.514000f64])
            @Expect("assertion#15185: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [123i64, 114.514000f64])
            @Expect("assertion#15186: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [123i64, 114.514000f64])
            @Expect("assertion#15187: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [123i64, 114.514000f64])
            @Expect("assertion#15188: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15189: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15190: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#15191: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_190")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15192: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("testcase TestCase_625 ends.")
    }
}
