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
class testPointApplyGenericGlobalFunction_51 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_687(): Unit {
        // logger.info("testcase TestCase_687 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_252")[0i64]
            .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct()])
            @Expect("assertion#16352: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericStruct()])
            @Expect("assertion#16353: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct()])
            @Expect("assertion#16354: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16355: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_252")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16356: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_252")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16357: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16358: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16359: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_252")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16360: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_252")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16361: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16362: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16363: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16364: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16365: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [NonGenericStruct(), 114.514000f64])
            @Expect("assertion#16366: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16367: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16368: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16369: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_252")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16370: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_687 ends.")
    }
}
