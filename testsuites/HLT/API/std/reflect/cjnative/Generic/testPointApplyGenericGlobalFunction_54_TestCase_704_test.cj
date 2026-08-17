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
    func TestCase_704(): Unit {
        // logger.info("testcase TestCase_704 begins.")
        // logger.info("成功调用")
        packageInfo
            .getFunctions("globalFunction_269")[0i64]
            .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                [GenericStructWith1TypeParameters<UInt64>()])
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#16675: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#16676: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>()])
            @Expect("assertion#16677: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16678: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_269")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16679: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_269")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16680: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16681: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16682: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_269")[0i64].apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [])
            @Expect("assertion#16683: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo.getFunctions("globalFunction_269")[0i64].apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [])
            @Expect("assertion#16684: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [])
            @Expect("assertion#16685: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("实参个数与形参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#16686: not throw", "实参个数与形参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#16687: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#16688: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()],
                    [GenericStructWith1TypeParameters<UInt64>(), 114.514000f64])
            @Expect("assertion#16689: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型检查失败")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16690: not throw", "类型检查失败")
        } catch (e: IllegalTypeException) {
            @Expect(e.message, "The input parameter does not match the type of the input parameter required by the function.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<UInt16>(), TypeInfo.of<Int16>()], [()])
            @Expect("assertion#16691: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>()], [()])
            @Expect("assertion#16692: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("类型形参个数与类型实参个数不等")
        try {
            packageInfo
                .getFunctions("globalFunction_269")[0i64]
                .apply([TypeInfo.of<Bool>(), TypeInfo.of<UInt16>(), TypeInfo.of<Int16>(), TypeInfo.of<Float64>()], [()])
            @Expect("assertion#16693: not throw", "类型形参个数与类型实参个数不等")
        } catch (e: IllegalArgumentException) {
            @Expect(e.message, "The input generic parameter item does not comply with the required quantity.")
        }
        // logger.info("testcase TestCase_704 ends.")
    }
}
