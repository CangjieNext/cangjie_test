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
    func TestCase_713(): Unit {
        // logger.info("testcase TestCase_713 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_278")[0i64]
            .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                [GenericStructWith2TypeParameters<Int16, Int16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#16846: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#16847: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>()])
            @Expect("assertion#16848: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16849: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_278")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16850: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_278")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16851: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16852: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16853: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_278")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16854: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_278")[0i64].apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#16855: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16856: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#16857: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#16858: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#16859: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int16, Int16>(), 114.514000f64])
            @Expect("assertion#16860: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16861: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16862: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#16863: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_278")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Bool>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16864: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_713 ends.")
    }
}
