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
    func TestCase_721(): Unit {
        // logger.info("testcase TestCase_721 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_286")[0i64]
            .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                [GenericStructWith2TypeParameters<Float64, Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#16998: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#16999: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>()])
            @Expect("assertion#17000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#17001: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#17002: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17003: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#17005: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#17006: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#17007: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#17008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#17009: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#17010: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#17011: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Float64, Float64>(), 114.514000f64])
            @Expect("assertion#17012: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#17013: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_286")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#17014: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#17015: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_286")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#17016: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_721 ends.")
    }
}
