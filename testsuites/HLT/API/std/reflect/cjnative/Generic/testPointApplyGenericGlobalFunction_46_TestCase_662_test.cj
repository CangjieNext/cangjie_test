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
    func TestCase_662(): Unit {
        // logger.info("testcase TestCase_662 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_227")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                [GenericClassWith1TypeParameters<Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#15877: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#15878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>()])
            @Expect("assertion#15879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15880: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_227")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_227")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15882: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15884: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_227")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_227")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#15886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15887: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#15888: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#15889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#15890: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int16>(), 114.514000f64])
            @Expect("assertion#15891: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15892: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#15894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_227")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15895: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_662 ends.")
    }
}
