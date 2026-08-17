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
class testPointApplyGenericGlobalFunction_55 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_709(): Unit {
        // logger.info("testcase TestCase_709 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_274")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                [GenericStructWith1TypeParameters<Int32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16770: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16771: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>()])
            @Expect("assertion#16772: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16773: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16774: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16775: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16776: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16777: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16778: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16779: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16780: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16781: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16782: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16783: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Int32>(), 114.514000f64])
            @Expect("assertion#16784: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16785: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16786: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_274")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16787: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_274")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16788: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_709 ends.")
    }
}
