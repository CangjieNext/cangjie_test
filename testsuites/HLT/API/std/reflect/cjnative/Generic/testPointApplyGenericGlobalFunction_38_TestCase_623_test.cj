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
class testPointApplyGenericGlobalFunction_38 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_623(): Unit {
        // logger.info("testcase TestCase_623 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_188")[0i64]
            .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [1i16])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [1i16])
            @Expect("assertion#15136: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [1i16])
            @Expect("assertion#15137: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [1i16])
            @Expect("assertion#15138: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15139: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_188")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15140: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_188")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15141: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15142: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15143: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_188")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15144: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_188")[0i64].apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [])
            @Expect("assertion#15145: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15146: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [1i16, 114.514000f64])
            @Expect("assertion#15147: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [1i16, 114.514000f64])
            @Expect("assertion#15148: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [1i16, 114.514000f64])
            @Expect("assertion#15149: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [1i16, 114.514000f64])
            @Expect("assertion#15150: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#15151: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int16>()], [114.514000f64])
            @Expect("assertion#15152: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>()], [114.514000f64])
            @Expect("assertion#15153: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_188")[0i64]
                .apply([TypeInfo.of<Unit>(), TypeInfo.of<Bool>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [114.514000f64])
            @Expect("assertion#15154: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_623 ends.")
    }
}
