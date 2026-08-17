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
    func TestCase_634(): Unit {
        // logger.info("testcase TestCase_634 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_199")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [1i8])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [1i8])
            @Expect("assertion#15345: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [1i8])
            @Expect("assertion#15346: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [1i8])
            @Expect("assertion#15347: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15348: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15349: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15350: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15351: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15352: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_199")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15354: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15355: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [1i8, 114.514000f64])
            @Expect("assertion#15356: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [1i8, 114.514000f64])
            @Expect("assertion#15357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [1i8, 114.514000f64])
            @Expect("assertion#15358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [1i8, 114.514000f64])
            @Expect("assertion#15359: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#15360: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int8>()], [114.514000f64])
            @Expect("assertion#15361: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>()], [114.514000f64])
            @Expect("assertion#15362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_199")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Unit>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15363: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_634 ends.")
    }
}
