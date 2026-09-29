/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package utils

import std.reflect.*
import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

// ── 泛型参数列表内容断言：逐一断言 GenericTypeInfo 的 name（而非 size）──
// 与 gfunc_utils.cj 的 genericParamNames 同契约（覆盖对账名一致）。
@CustomAssertion
public func genericParamNames(ctx: AssertionCtx, actual_: Collection<GenericTypeInfo>, expected: Array<String>): Collection<GenericTypeInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of generic params do not match: ${actual.size} != ${expected.size}:
 left: ${gtiToString(actual)}
right: ${gtiToString(expected)}
""")
    }
    for (i in 0..actual.size) {
        let elName = actual[i].name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} generic param name mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

// ── superInterfaces 内容断言：集合包含指定名称的接口（"Any"）──
@CustomAssertion
public func containsIfaceName(ctx: AssertionCtx, actual_: Collection<InterfaceTypeInfo>, expected: String): Collection<InterfaceTypeInfo> {
    let actual = actual_.toArray()
    for (i in 0..actual.size) {
        if (actual[i].name == expected) {
            return actual_
        }
    }
    ctx.fail(
        """
superInterfaces does NOT contain iface ${expected}: ${gtiToString(actual_.size)} interfaces
""")
    actual_
}

// ── 注解内容断言（annotations 集合）：泛型形参无注解 → expected=[] ──
@CustomAssertion
public func annotations(ctx: AssertionCtx, actual_: Collection<Annotation>, expected: Array<Annotation>): Collection<Annotation> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of annotations do not match: ${actual.size} != ${expected.size}
""")
    }
    actual
}

// ── 注解数组内容断言（findAllAnnotations<T>() 返回 Array<T>）：expected=[] ──
@CustomAssertion
public func annotationsArray<T>(ctx: AssertionCtx, actual_: Array<T>, expected: Array<String>): Array<T> where T <: Annotation {
    let actual = actual_
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of annotated elements do not match: ${actual.size} != ${expected.size}
""")
    }
    for (i in 0..actual.size) {
        let el = actual[i]
        let elName = TypeInfo.of(el).name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} annotation type mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

// ── 空集合断言：Collection<T> 空集（modifiers/getInstanceFunctions/getStaticFunctions）──
// 泛型签名接受任意元素类型的集合（泛型形参无成员/无修饰符 → 恒为空）。
@CustomAssertion
public func emptyCollection<T>(ctx: AssertionCtx, actual_: Collection<T>, expected: Collection<Any>): Collection<T> {
    if (actual_.size != 0) {
        ctx.fail(
            "expected empty collection but got ${actual_.size} elements")
    }
    actual_
}

// ── 诊断辅助：元素个数描述 ──
public func gtiToString(n: Int64): String {
    "${n} elements"
}

public func gtiToString(arr: Array<GenericTypeInfo>): String {
    let sb = StringBuilder()
    sb.append("[")
    for (i in 0..arr.size) {
        if (i > 0) { sb.append(", ") }
        sb.append(arr[i].name)
    }
    sb.append("]")
    sb.toString()
}

public func gtiToString(arr: Array<String>): String {
    let sb = StringBuilder()
    sb.append("[")
    for (i in 0..arr.size) {
        if (i > 0) { sb.append(", ") }
        sb.append(arr[i])
    }
    sb.append("]")
    sb.toString()
}
