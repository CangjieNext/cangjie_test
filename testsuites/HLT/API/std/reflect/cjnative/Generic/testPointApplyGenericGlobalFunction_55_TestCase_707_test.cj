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
    func TestCase_707(): Unit {
        // logger.info("testcase TestCase_707 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_272")[0i64]
            .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                [GenericStructWith1TypeParameters<Float64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16732: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16733: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>()])
            @Expect("assertion#16734: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16735: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_272")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16736: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16737: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16738: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16739: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_272")[0i64].apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [])
            @Expect("assertion#16740: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [])
            @Expect("assertion#16741: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16742: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16743: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16744: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16745: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<Float64>(), 114.514000f64])
            @Expect("assertion#16746: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16747: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<UInt8>(), TypeInfo.of<Int64>()], [()])
            @Expect("assertion#16748: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>()], [()])
            @Expect("assertion#16749: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_272")[0i64]
                .apply([TypeInfo.of<Float64>(), TypeInfo.of<UInt8>(), TypeInfo.of<Int64>(), TypeInfo.of<Float64>()],
                    [()])
            @Expect("assertion#16750: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_707 ends.")
    }
}
