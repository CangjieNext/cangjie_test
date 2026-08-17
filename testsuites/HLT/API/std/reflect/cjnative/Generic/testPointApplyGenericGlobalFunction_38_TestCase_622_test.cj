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
    func TestCase_622(): Unit {
        // logger.info("testcase TestCase_622 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_187")[0i64]
            .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [1i8])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [1i8])
            @Expect("assertion#15117: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [1i8])
            @Expect("assertion#15118: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [1i8])
            @Expect("assertion#15119: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15120: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_187")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15121: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_187")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15122: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15123: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15124: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_187")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15125: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_187")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15126: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15127: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [1i8, 114.514000f64])
            @Expect("assertion#15128: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [1i8, 114.514000f64])
            @Expect("assertion#15129: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [1i8, 114.514000f64])
            @Expect("assertion#15130: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [1i8, 114.514000f64])
            @Expect("assertion#15131: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15132: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15133: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>()], [114.514000f64])
            @Expect("assertion#15134: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_187")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15135: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_622 ends.")
    }
}
