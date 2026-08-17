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
class testPointApplyGenericGlobalFunction_52 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_691(): Unit {
        // logger.info("testcase TestCase_691 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_256")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericStruct()])
            @Expect("assertion#16428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#16429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#16430: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16431: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16433: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#16434: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16435: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#16438: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16439: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16440: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16442: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#16443: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#16444: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16445: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_256")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt16>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16446: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_691 ends.")
    }
}
