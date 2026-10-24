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
class testPointApplyGenericGlobalFunction_43 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_646(): Unit {
        // logger.info("testcase TestCase_646 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_211")[0i64]
            .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [NonGenericClass()])
            @Expect("assertion#15573: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#15574: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15575: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15576: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15577: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15578: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15579: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15580: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 0.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15581: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15582: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15583: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15584: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid argument count: expected 1, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15585: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15586: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15587: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15588: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "Parameter type mismatch for generic function invocation.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15589: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15590: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 2.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_211")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Float64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15591: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "Invalid generic type argument count: expected 3, got 4.")
        }
        // logger.info("testcase TestCase_646 ends.")
    }
}
