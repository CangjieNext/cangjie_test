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
    func TestCase_651(): Unit {
        // logger.info("testcase TestCase_651 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_216")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                [GenericClassWith1TypeParameters<Bool>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#15668: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#15669: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#15670: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15671: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_216")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15672: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_216")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15673: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15674: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15675: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_216")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#15676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_216")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15677: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15678: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#15679: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#15680: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#15681: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()],
                    [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#15682: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15683: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#15684: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_216")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int64>(), TypeInfo.of<UInt64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15686: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_651 ends.")
    }
}
