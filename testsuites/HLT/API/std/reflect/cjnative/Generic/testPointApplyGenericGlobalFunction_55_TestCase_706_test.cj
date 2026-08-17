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
    func TestCase_706(): Unit {
        // logger.info("testcase TestCase_706 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_271")[0i64]
            .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                [GenericStructWith1TypeParameters<Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16713: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16714: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16715: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16716: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16717: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16718: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16719: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16720: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16721: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#16722: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16723: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16724: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16725: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16726: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16727: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16728: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_271")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16729: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#16730: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_271")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Int32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16731: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_706 ends.")
    }
}
