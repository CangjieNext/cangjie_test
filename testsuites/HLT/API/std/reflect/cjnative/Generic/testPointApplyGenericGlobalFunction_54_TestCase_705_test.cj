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
class testPointApplyGenericGlobalFunction_54 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_705(): Unit {
        // logger.info("testcase TestCase_705 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_270")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                [GenericStructWith1TypeParameters<Float32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [GenericStructWith1TypeParameters<Float32>()])
            @Expect("assertion#16694: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<Float32>()])
            @Expect("assertion#16695: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float32>()])
            @Expect("assertion#16696: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16697: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16698: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_270")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16699: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16700: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16701: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16702: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_270")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16703: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16704: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#16705: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#16706: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#16707: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#16708: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#16709: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#16710: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16711: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_270")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt16>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16712: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_705 ends.")
    }
}
