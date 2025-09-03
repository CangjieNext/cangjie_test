/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: dependency
// (not MAC) EXEC: cd dependency && %compiler %cmp_opt --output-type=dylib  *.cj -o libdependency.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output --import-path . -L dependency -ldependency
// (not MAC) RUN-EXEC: %cp ./dependency/libdependency.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args  
package testsuite

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.reflect.*
import dependency.*

@Test
class testPointApplyGenericGlobalFunction_11 {
    let packageInfo = PackageInfo.get("dependency")
    @TestCase
    func TestCase_486(): Unit {
        try {
            packageInfo
                .getFunctions("globalFunction_51")[0i64]
                .apply([], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12920: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_51")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>()])
            @Expect("assertion#12921: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_51")[0i64].apply([], [])
            @Expect("assertion#12922: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_51")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12923: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_51")[0i64].apply([], [])
            @Expect("assertion#12924: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_51")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12925: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_51")[0i64]
                .apply([], [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12926: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_51")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<Int64, Int64>(), 114.514000f64])
            @Expect("assertion#12927: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_51")[0i64].apply([], [()])
            @Expect("assertion#12928: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_51")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12929: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_487(): Unit {
        try {
            packageInfo
                .getFunctions("globalFunction_52")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12930: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_52")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt8, UInt8>()])
            @Expect("assertion#12931: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_52")[0i64].apply([], [])
            @Expect("assertion#12932: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_52")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12933: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_52")[0i64].apply([], [])
            @Expect("assertion#12934: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_52")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12935: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_52")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12936: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_52")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt8, UInt8>(), 114.514000f64])
            @Expect("assertion#12937: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_52")[0i64].apply([], [()])
            @Expect("assertion#12938: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_52")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12939: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_488(): Unit {
        try {
            packageInfo
                .getFunctions("globalFunction_53")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#12940: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_53")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt16, UInt16>()])
            @Expect("assertion#12941: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_53")[0i64].apply([], [])
            @Expect("assertion#12942: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_53")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12943: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_53")[0i64].apply([], [])
            @Expect("assertion#12944: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_53")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12945: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_53")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#12946: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_53")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt16, UInt16>(), 114.514000f64])
            @Expect("assertion#12947: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_53")[0i64].apply([], [()])
            @Expect("assertion#12948: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_53")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12949: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_489(): Unit {
        try {
            packageInfo
                .getFunctions("globalFunction_54")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#12950: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_54")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt32, UInt32>()])
            @Expect("assertion#12951: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_54")[0i64].apply([], [])
            @Expect("assertion#12952: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_54")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12953: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_54")[0i64].apply([], [])
            @Expect("assertion#12954: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_54")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12955: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_54")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#12956: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_54")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt32, UInt32>(), 114.514000f64])
            @Expect("assertion#12957: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_54")[0i64].apply([], [()])
            @Expect("assertion#12958: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_54")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12959: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_490(): Unit {
        try {
            packageInfo
                .getFunctions("globalFunction_55")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12960: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_55")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt64, UInt64>()])
            @Expect("assertion#12961: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_55")[0i64].apply([], [])
            @Expect("assertion#12962: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_55")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12963: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_55")[0i64].apply([], [])
            @Expect("assertion#12964: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_55")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12965: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_55")[0i64]
                .apply([], [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#12966: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_55")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith2TypeParameters<UInt64, UInt64>(), 114.514000f64])
            @Expect("assertion#12967: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_55")[0i64].apply([], [()])
            @Expect("assertion#12968: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_55")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12969: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }
}
