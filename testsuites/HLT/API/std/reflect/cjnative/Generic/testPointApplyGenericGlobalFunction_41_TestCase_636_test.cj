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
    func TestCase_636(): Unit {
        // logger.info("testcase TestCase_636 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_201")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [NonGenericClass()])
            @Expect("assertion#15383: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#15384: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15385: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15386: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_201")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15387: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_201")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15388: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15389: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15390: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_201")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#15391: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_201")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15392: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15393: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15394: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15395: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15396: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15397: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15398: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#15399: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_201")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#15400: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_201")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15401: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_636 ends.")
    }
}
