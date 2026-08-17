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
class testPointApplyGenericGlobalFunction_41 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_640(): Unit {
        // logger.info("testcase TestCase_640 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_205")[0i64]
            .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [NonGenericClass()])
            @Expect("assertion#15459: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [NonGenericClass()])
            @Expect("assertion#15460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15462: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_205")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15463: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_205")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15466: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_205")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15467: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_205")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15468: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15469: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15470: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15471: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15473: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#15474: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_205")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#15475: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_205")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#15476: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_205")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Unit>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15477: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_640 ends.")
    }
}
