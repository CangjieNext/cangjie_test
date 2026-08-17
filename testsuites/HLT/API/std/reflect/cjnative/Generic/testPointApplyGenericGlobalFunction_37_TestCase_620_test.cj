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
class testPointApplyGenericGlobalFunction_37 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_620(): Unit {
        // logger.info("testcase TestCase_620 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_185")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#15079: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [()])
            @Expect("assertion#15080: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#15081: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15082: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15083: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15084: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15085: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15086: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#15087: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_185")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [])
            @Expect("assertion#15088: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#15089: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [(), 114.514000f64])
            @Expect("assertion#15090: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [(), 114.514000f64])
            @Expect("assertion#15091: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [(), 114.514000f64])
            @Expect("assertion#15092: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [(), 114.514000f64])
            @Expect("assertion#15093: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#15094: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Int32>(), TypeInfo.of<Int16>()], [123i64])
            @Expect("assertion#15095: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>()], [123i64])
            @Expect("assertion#15096: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_185")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<Int32>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [123i64])
            @Expect("assertion#15097: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_620 ends.")
    }
}
