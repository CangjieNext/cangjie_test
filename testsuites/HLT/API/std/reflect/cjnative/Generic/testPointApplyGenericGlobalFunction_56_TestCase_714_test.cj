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
    func TestCase_714(): Unit {
        // logger.info("testcase TestCase_714 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_279")[0i64]
            .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                [GenericStructWith2TypeParameters<Int32, Int32>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#16865: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#16866: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>()])
            @Expect("assertion#16867: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16868: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16869: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16870: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#16871: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16872: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16873: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [])
            @Expect("assertion#16874: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [])
            @Expect("assertion#16875: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#16876: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#16877: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#16878: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<Int32, Int32>(), 114.514000f64])
            @Expect("assertion#16879: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16880: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16881: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>()], [()])
            @Expect("assertion#16882: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_279")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Float32>(), TypeInfo.of<Float64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16883: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_714 ends.")
    }
}
