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
class testPointApplyGenericGlobalFunction_57 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_716(): Unit {
        // logger.info("testcase TestCase_716 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_281")[0i64]
            .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                [GenericStructWith2TypeParameters<UInt8, UInt8>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#16903: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#16904: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#16905: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16906: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_281")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16907: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16908: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16909: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16910: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_281")[0i64].apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16911: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [])
            @Expect("assertion#16912: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16913: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#16914: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#16915: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#16916: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#16917: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16918: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<UInt64>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16919: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>()], [()])
            @Expect("assertion#16920: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_281")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<UInt64>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16921: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_716 ends.")
    }
}
