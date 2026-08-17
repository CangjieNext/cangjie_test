/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
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
class testPointApplyGenericGlobalFunction_58 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_723(): Unit {
        // logger.info("testcase TestCase_723 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_288")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                [GenericStructWith2TypeParameters<UInt32, UInt32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#17036: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#17037: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#17038: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17039: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17040: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#17041: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17042: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17043: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17044: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_288")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#17045: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17046: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#17047: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#17048: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#17049: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#17050: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#17051: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#17052: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#17053: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_288")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#17054: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_723 ends.")
    }
}
