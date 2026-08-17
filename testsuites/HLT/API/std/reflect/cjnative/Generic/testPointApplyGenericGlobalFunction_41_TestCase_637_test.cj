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
class testPointApplyGenericGlobalFunction_41 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_637(): Unit {
        // logger.info("testcase TestCase_637 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_202")[0i64]
            .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [NonGenericClass()])
            @Expect("assertion#15402: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [NonGenericClass()])
            @Expect("assertion#15403: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15404: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15405: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_202")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15406: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15407: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15408: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15409: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_202")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15410: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15411: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15412: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15413: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15414: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15415: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15416: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#15417: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#15418: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15419: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_202")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15420: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_637 ends.")
    }
}
