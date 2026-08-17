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
class testPointApplyGenericGlobalFunction_52 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_695(): Unit {
        // logger.info("testcase TestCase_695 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_260")[0i64]
            .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<Unit>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#16504: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#16505: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>()])
            @Expect("assertion#16506: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16507: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16508: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16509: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16510: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16511: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16512: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_260")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16513: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16514: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#16515: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#16516: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#16517: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#16518: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16519: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16520: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16521: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_260")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16522: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_695 ends.")
    }
}
