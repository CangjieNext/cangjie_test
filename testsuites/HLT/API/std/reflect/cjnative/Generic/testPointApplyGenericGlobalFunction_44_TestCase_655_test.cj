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
class testPointApplyGenericGlobalFunction_44 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_655(): Unit {
        // logger.info("testcase TestCase_655 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_220")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#15744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#15745: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>()])
            @Expect("assertion#15746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15747: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15751: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15752: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [])
            @Expect("assertion#15753: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15754: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#15755: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#15756: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#15757: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int64>(), 114.514000f64])
            @Expect("assertion#15758: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15759: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15760: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_220")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>()], [()])
            @Expect("assertion#15761: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_220")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Unit>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15762: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_655 ends.")
    }
}
