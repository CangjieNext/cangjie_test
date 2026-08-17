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
class testPointApplyGenericGlobalFunction_42 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_642(): Unit {
        // logger.info("testcase TestCase_642 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_207")[0i64]
            .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [NonGenericClass()])
            @Expect("assertion#15497: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass()])
            @Expect("assertion#15498: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15499: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15500: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_207")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15501: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_207")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15502: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15503: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15504: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_207")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#15505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_207")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#15506: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15507: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15508: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15510: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15511: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15512: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#15513: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#15514: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_207")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#15515: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_642 ends.")
    }
}
