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
class testPointApplyGenericGlobalFunction_42 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_644(): Unit {
        // logger.info("testcase TestCase_644 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_209")[0i64]
            .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [NonGenericClass()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [NonGenericClass()])
            @Expect("assertion#15535: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [NonGenericClass()])
            @Expect("assertion#15536: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass()])
            @Expect("assertion#15537: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15538: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_209")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15539: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_209")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15540: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15541: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15542: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_209")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [])
            @Expect("assertion#15543: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_209")[0i64].apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15544: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15545: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15546: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15547: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15548: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()],
                    [NonGenericClass(), 114.514000f64])
            @Expect("assertion#15549: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15550: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_209")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int8>()], [()])
            @Expect("assertion#15551: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>()], [()])
            @Expect("assertion#15552: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_209")[0i64]
                .apply([TypeInfo.of<Float32>(), TypeInfo.of<Bool>(), TypeInfo.of<Int8>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15553: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_644 ends.")
    }
}
