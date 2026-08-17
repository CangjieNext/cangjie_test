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
class testPointApplyGenericGlobalFunction_45 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_660(): Unit {
        // logger.info("testcase TestCase_660 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_225")[0i64]
            .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                [GenericClassWith1TypeParameters<Float32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#15839: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#15840: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>()])
            @Expect("assertion#15841: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15842: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_225")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15843: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15844: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15845: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15846: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_225")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15847: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15849: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#15850: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#15851: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#15852: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Float32>(), 114.514000f64])
            @Expect("assertion#15853: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15854: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_225")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int64>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15857: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_660 ends.")
    }
}
