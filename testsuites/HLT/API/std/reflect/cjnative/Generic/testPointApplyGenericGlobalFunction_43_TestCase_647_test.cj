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
    func TestCase_647(): Unit {
        // logger.info("testcase TestCase_647 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_212")[0i64]
            .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass()])
            @Expect("assertion#15592: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#15593: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15594: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15595: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15596: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15597: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15598: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15599: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15600: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15601: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15602: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15603: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15604: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15605: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15606: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15607: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_212")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15608: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#15609: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_212")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt8>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15610: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_647 ends.")
    }
}
