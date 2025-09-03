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
class testPointApplyGenericGlobalFunction_7 {
    let packageInfo = PackageInfo.get("dependency")

    @TestCase
    func TestCase_466(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12720: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12721: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([], [])
            @Expect("assertion#12722: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12723: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([], [])
            @Expect("assertion#12724: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12725: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12726: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_31")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12727: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([], [()])
            @Expect("assertion#12728: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_31")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12729: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_467(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12730: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12731: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([], [])
            @Expect("assertion#12732: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12733: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([], [])
            @Expect("assertion#12734: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12735: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12736: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_32")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12737: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([], [()])
            @Expect("assertion#12738: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_32")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12739: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_468(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([], [NonGenericClass()])
            @Expect("assertion#12740: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([TypeInfo.of<Float32>()], [NonGenericClass()])
            @Expect("assertion#12741: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([], [])
            @Expect("assertion#12742: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12743: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([], [])
            @Expect("assertion#12744: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12745: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12746: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_33")[0i64]
                .apply([TypeInfo.of<Float32>()], [NonGenericClass(), 114.514000f64])
            @Expect("assertion#12747: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([], [()])
            @Expect("assertion#12748: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_33")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12749: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_469(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_34")[0i64].apply([], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12750: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_34")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>()])
            @Expect("assertion#12751: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_34")[0i64].apply([], [])
            @Expect("assertion#12752: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_34")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12753: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_34")[0i64].apply([], [])
            @Expect("assertion#12754: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_34")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12755: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_34")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#12756: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_34")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Unit>(), 114.514000f64])
            @Expect("assertion#12757: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_34")[0i64].apply([], [()])
            @Expect("assertion#12758: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_34")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12759: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }

    @TestCase
    func TestCase_470(): Unit {
        try {
            packageInfo.getFunctions("globalFunction_35")[0i64].apply([], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#12760: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_35")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>()])
            @Expect("assertion#12761: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_35")[0i64].apply([], [])
            @Expect("assertion#12762: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_35")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12763: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_35")[0i64].apply([], [])
            @Expect("assertion#12764: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_35")[0i64].apply([TypeInfo.of<Float32>()], [])
            @Expect("assertion#12765: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_35")[0i64]
                .apply([], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#12766: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo
                .getFunctions("globalFunction_35")[0i64]
                .apply([TypeInfo.of<Float32>()], [GenericClassWith1TypeParameters<Bool>(), 114.514000f64])
            @Expect("assertion#12767: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_35")[0i64].apply([], [()])
            @Expect("assertion#12768: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
        try {
            packageInfo.getFunctions("globalFunction_35")[0i64].apply([TypeInfo.of<Float32>()], [()])
            @Expect("assertion#12769: not throw", "非泛型函数指定了类型实参列表")
        } catch (e: InvocationTargetException) {
            @Expect(e.message, "The function cannot be applied with `genericTypeArgs`.")
        }
    }
}
