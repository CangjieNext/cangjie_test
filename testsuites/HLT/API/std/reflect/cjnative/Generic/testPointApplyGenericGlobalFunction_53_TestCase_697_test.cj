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
class testPointApplyGenericGlobalFunction_53 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_697(): Unit {
        // logger.info("testcase TestCase_697 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_262")[0i64]
            .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                [GenericStructWith1TypeParameters<Int8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<Int8>()])
            @Expect("assertion#16542: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Int8>()])
            @Expect("assertion#16543: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int8>()])
            @Expect("assertion#16544: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16545: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16546: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16547: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16548: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16549: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16550: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#16553: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#16554: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#16555: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int8>(), 114.514000f64])
            @Expect("assertion#16556: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16557: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_262")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16558: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16559: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_262")[0i64]
                .apply([TypeInfo.of<Int64>(), TypeInfo.of<Int16>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16560: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_697 ends.")
    }
}
