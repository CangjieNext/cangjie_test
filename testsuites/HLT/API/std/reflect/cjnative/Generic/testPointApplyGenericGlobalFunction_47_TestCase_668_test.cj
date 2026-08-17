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
class testPointApplyGenericGlobalFunction_47 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_668(): Unit {
        // logger.info("testcase TestCase_668 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_233")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                [GenericClassWith2TypeParameters<Int16, Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#15991: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#15992: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#15993: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15994: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15995: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_233")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#15996: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15997: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15998: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15999: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_233")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16000: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16001: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#16002: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#16003: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#16004: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#16005: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16006: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16007: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#16008: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_233")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16009: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_668 ends.")
    }
}
