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
class testPointApplyGenericGlobalFunction_40 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_631(): Unit {
        // logger.info("testcase TestCase_631 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_196")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [114.514000f64])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15288: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15289: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15290: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15291: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15292: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_196")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15293: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15294: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15295: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15296: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_196")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15297: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15298: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#15299: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#15300: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [114.514000f64, 114.514000f64])
            @Expect("assertion#15301: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64, 114.514000f64])
            @Expect("assertion#15302: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15303: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15304: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#15305: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_196")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15306: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_631 ends.")
    }
}
