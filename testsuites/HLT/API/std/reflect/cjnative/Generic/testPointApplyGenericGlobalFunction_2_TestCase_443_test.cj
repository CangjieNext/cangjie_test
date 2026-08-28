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
    func TestCase_443(): Unit {
        // logger.info("testcase TestCase_443 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_8")[0i64]
            .apply([TypeInfo.of<UInt32>()], [NonGenericClass(), 1u8, 114.514000f32])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [NonGenericClass(), 1u8, 114.514000f32])
            @Expect("assertion#12456: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [NonGenericClass(), 1u8, 114.514000f32])
            @Expect("assertion#12457: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 1u8, 114.514000f32])
            @Expect("assertion#12458: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([TypeInfo.of<UInt32>()], [1u8, 114.514000f32])
            @Expect("assertion#12459: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [1u8, 114.514000f32])
            @Expect("assertion#12460: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [1u8, 114.514000f32])
            @Expect("assertion#12461: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [1u8, 114.514000f32])
            @Expect("assertion#12462: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([TypeInfo.of<UInt32>()], [NonGenericClass(), 1u8])
            @Expect("assertion#12463: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [NonGenericClass(), 1u8])
            @Expect("assertion#12464: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [NonGenericClass(), 1u8])
            @Expect("assertion#12465: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 1u8])
            @Expect("assertion#12466: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>()], [NonGenericClass(), 1u8, 114.514000f32, 114.514000f64])
            @Expect("assertion#12467: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([], [NonGenericClass(), 1u8, 114.514000f32, 114.514000f64])
            @Expect("assertion#12468: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([], [NonGenericClass(), 1u8, 114.514000f32, 114.514000f64])
            @Expect("assertion#12469: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 1u8, 114.514000f32, 114.514000f64])
            @Expect("assertion#12470: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([TypeInfo.of<UInt32>()], [(), 1u8, 114.514000f32])
            @Expect("assertion#12471: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [(), 1u8, 114.514000f32])
            @Expect("assertion#12472: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [(), 1u8, 114.514000f32])
            @Expect("assertion#12473: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [(), 1u8, 114.514000f32])
            @Expect("assertion#12474: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>()], [NonGenericClass(), 114.514000f64, 114.514000f32])
            @Expect("assertion#12475: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([], [NonGenericClass(), 114.514000f64, 114.514000f32])
            @Expect("assertion#12476: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([], [NonGenericClass(), 114.514000f64, 114.514000f32])
            @Expect("assertion#12477: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 114.514000f64, 114.514000f32])
            @Expect("assertion#12478: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>()], [NonGenericClass(), 1u8, ()])
            @Expect("assertion#12479: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [NonGenericClass(), 1u8, ()])
            @Expect("assertion#12480: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_8")[0i64].apply([], [NonGenericClass(), 1u8, ()])
            @Expect("assertion#12481: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_8")[0i64]
                .apply([TypeInfo.of<UInt32>(), TypeInfo.of<Float64>()], [NonGenericClass(), 1u8, ()])
            @Expect("assertion#12482: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_443 ends.")
    }
}
