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
class testPointApplyGenericGlobalFunction_46 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_664(): Unit {
        // logger.info("testcase TestCase_664 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_229")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                [GenericClassWith1TypeParameters<UInt32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#15915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#15916: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt32>()])
            @Expect("assertion#15917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15918: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15919: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_229")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15922: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15923: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_229")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15924: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15925: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#15926: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#15927: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#15928: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<UInt32>(), 114.514000f64])
            @Expect("assertion#15929: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15930: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15931: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15932: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_229")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt32>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15933: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_664 ends.")
    }
}
