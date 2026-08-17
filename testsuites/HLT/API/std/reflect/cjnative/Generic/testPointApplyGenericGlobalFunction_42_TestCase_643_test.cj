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
class testPointApplyGenericGlobalFunction_42 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_643(): Unit {
        // logger.info("testcase TestCase_643 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_208")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#15516: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#15517: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15518: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15519: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_208")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15520: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_208")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15521: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15522: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15523: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_208")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15524: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_208")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15525: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15526: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15527: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15528: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15529: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15530: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15531: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15532: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15533: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_208")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15534: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_643 ends.")
    }
}
