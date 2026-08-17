/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
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
class testPointApplyGenericGlobalFunction_2 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_441(): Unit {
        // logger.info("testcase TestCase_441 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_6")[0i64]
            .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<UInt16>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#12423: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#12424: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>()])
            @Expect("assertion#12425: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12426: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12427: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12428: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12429: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12430: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#12431: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#12432: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#12433: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#12434: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#12435: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#12436: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt16>(), 114.514000f64])
            @Expect("assertion#12437: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12438: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_6")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#12439: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#12440: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_6")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#12441: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_441 ends.")
    }
}
