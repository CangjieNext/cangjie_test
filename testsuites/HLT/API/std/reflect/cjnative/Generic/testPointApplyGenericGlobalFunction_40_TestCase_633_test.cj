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
    func TestCase_633(): Unit {
        // logger.info("testcase TestCase_633 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_198")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [1u16])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [1u16])
            @Expect("assertion#15326: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [1u16])
            @Expect("assertion#15327: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [1u16])
            @Expect("assertion#15328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15329: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_198")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15330: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_198")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15331: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15332: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15333: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_198")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15334: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_198")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15335: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15336: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [1u16, 114.514000f64])
            @Expect("assertion#15337: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [1u16, 114.514000f64])
            @Expect("assertion#15338: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [1u16, 114.514000f64])
            @Expect("assertion#15339: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [1u16, 114.514000f64])
            @Expect("assertion#15340: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#15341: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int64>()], [114.514000f64])
            @Expect("assertion#15342: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [114.514000f64])
            @Expect("assertion#15343: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_198")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15344: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_633 ends.")
    }
}
