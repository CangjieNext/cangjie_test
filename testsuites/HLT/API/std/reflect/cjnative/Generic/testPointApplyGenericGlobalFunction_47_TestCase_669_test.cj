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
class testPointApplyGenericGlobalFunction_47 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_669(): Unit {
        // logger.info("testcase TestCase_669 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_234")[0i64]
            .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                [GenericClassWith2TypeParameters<Int32, Int32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [GenericClassWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#16010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [GenericClassWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#16011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#16012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16013: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_234")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16017: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_234")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16018: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16019: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16020: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#16021: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()],
                    [GenericClassWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#16022: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#16023: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#16024: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16025: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16026: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16027: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_234")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<UInt16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16028: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_669 ends.")
    }
}
