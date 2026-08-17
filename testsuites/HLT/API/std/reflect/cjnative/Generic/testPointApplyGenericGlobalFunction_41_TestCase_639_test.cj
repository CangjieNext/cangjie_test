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
    func TestCase_639(): Unit {
        // logger.info("testcase TestCase_639 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_204")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#15440: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [NonGenericClass()])
            @Expect("assertion#15441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15442: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15443: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15444: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_204")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15445: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15446: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15447: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15448: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_204")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15449: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15450: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15451: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15452: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15453: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15454: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15455: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_204")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_639 ends.")
    }
}
