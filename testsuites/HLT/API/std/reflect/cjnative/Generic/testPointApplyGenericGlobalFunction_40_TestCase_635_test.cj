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
    func TestCase_635(): Unit {
        // logger.info("testcase TestCase_635 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_200")[0i64]
            .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#15364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#15365: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15366: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15367: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15368: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15371: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15372: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15373: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15374: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15375: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15376: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15377: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15378: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15379: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15380: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15381: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_200")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15382: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_635 ends.")
    }
}
