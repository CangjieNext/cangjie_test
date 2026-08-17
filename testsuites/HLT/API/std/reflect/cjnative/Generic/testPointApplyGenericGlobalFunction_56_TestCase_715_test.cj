/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
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
class testPointApplyGenericGlobalFunction_56 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_715(): Unit {
        // logger.info("testcase TestCase_715 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_280")[0i64]
            .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                [GenericStructWith2TypeParameters<Int64, Int64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#16884: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#16885: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#16886: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16887: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_280")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16888: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16889: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16890: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16891: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_280")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16892: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16893: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16894: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#16895: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#16896: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#16897: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#16898: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16899: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_280")[0i64].apply([TypeInfo.of<Int16>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16900: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16901: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_280")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<Int16>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16902: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_715 ends.")
    }
}
