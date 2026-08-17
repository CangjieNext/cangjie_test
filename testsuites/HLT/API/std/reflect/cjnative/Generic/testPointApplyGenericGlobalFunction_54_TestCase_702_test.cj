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
class testPointApplyGenericGlobalFunction_54 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_702(): Unit {
        // logger.info("testcase TestCase_702 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_267")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                [GenericStructWith1TypeParameters<UInt16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#16637: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#16638: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#16639: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16640: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_267")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16641: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_267")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16642: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16643: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16644: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_267")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16645: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_267")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16646: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16647: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#16648: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#16649: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#16650: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#16651: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16652: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16653: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16654: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_267")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16655: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_702 ends.")
    }
}
