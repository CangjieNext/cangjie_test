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
class testPointApplyGenericGlobalFunction_50 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_685(): Unit {
        // logger.info("testcase TestCase_685 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_250")[0i64]
            .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#16314: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [NonGenericStruct()])
            @Expect("assertion#16315: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#16316: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16317: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16318: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_250")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16319: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16320: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16321: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16322: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_250")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16323: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16324: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16325: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16326: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16327: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16328: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16329: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16330: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16331: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_250")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16332: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_685 ends.")
    }
}
