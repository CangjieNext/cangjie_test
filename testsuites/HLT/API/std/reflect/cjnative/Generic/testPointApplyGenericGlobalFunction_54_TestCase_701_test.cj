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
class testPointApplyGenericGlobalFunction_54 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_701(): Unit {
        // logger.info("testcase TestCase_701 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_266")[0i64]
            .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                [GenericStructWith1TypeParameters<UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#16618: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#16619: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>()])
            @Expect("assertion#16620: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16621: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_266")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16622: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_266")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16623: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16624: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16625: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_266")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [])
            @Expect("assertion#16626: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_266")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#16627: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16628: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#16629: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#16630: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#16631: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt8>(), 114.514000f64])
            @Expect("assertion#16632: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#16633: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<UInt32>()], [()])
            @Expect("assertion#16634: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_266")[0i64].apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#16635: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_266")[0i64]
                .apply([TypeInfo.of<Int8>(), TypeInfo.of<Int8>(), TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16636: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_701 ends.")
    }
}
