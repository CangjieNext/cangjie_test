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
    func TestCase_649(): Unit {
        // logger.info("testcase TestCase_649 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_214")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#15630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#15631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15633: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15637: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15640: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15641: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15643: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15644: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#15645: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#15646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_214")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_214")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15648: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_649 ends.")
    }
}
