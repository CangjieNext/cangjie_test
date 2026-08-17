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
class testPointApplyGenericGlobalFunction_39 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_626(): Unit {
        // logger.info("testcase TestCase_626 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_191")[0i64]
            .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [1u8])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [1u8])
            @Expect("assertion#15193: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [1u8])
            @Expect("assertion#15194: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [1u8])
            @Expect("assertion#15195: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15196: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15197: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15198: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15199: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15200: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15201: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15202: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15203: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [1u8, 114.514000f64])
            @Expect("assertion#15204: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [1u8, 114.514000f64])
            @Expect("assertion#15205: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [1u8, 114.514000f64])
            @Expect("assertion#15206: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [1u8, 114.514000f64])
            @Expect("assertion#15207: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15208: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt64>()], [114.514000f64])
            @Expect("assertion#15209: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [114.514000f64])
            @Expect("assertion#15210: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_191")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15211: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_626 ends.")
    }
}
