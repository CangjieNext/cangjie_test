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
    func TestCase_663(): Unit {
        // logger.info("testcase TestCase_663 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_228")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()],
                [GenericClassWith1TypeParameters<Int8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#15896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#15897: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>()])
            @Expect("assertion#15898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15899: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_228")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_228")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15902: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15903: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_228")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15904: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_228")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15905: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15906: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#15907: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#15908: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#15909: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#15910: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#15911: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_228")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#15912: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_228")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_228")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15914: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_663 ends.")
    }
}
