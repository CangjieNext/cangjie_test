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
import std.sort.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

// ── 通用 Any 深比较辅助（toString + TypeInfo 限定名比对）──
public func checkEquality(a: Any, b: Any): Bool {
    let aTypeInfo = TypeInfo.of(a)
    let bTypeInfo = TypeInfo.of(b)
    if (aTypeInfo.qualifiedName != bTypeInfo.qualifiedName) {
        return false
    }
    toString(a) == toString(b)
}

public func toString(a: Any): String {
    match (a) {
        case l: ReadOnlyList<Any> =>
            let ll = l |> map {i: Any => toString(i)} |> collectString(delimiter: ", ")
            "[${ll}]"
        case l: Array<Any> =>
            let ll = l |> map {i: Any => toString(i)} |> collectString(delimiter: ", ")
            "[${ll}]"
        case s: ToString => s.toString()
        case o => match (TypeInfo.of(o)) {
            case t: TupleTypeInfo =>
                let s = t.destruct(o)
                let ss = s |> map {i: Any => toString(i)} |> collectString(delimiter: ", ")
                "(${ss})"
            case t: ClassTypeInfo =>
                let sb = StringBuilder()
                sb.append("${t.qualifiedName}(")
                let l = t.instanceVariables |> map {
                    i =>
                        let value = i.getValue(a)
                        "${i.name}=${toString(value)}"
                } |> collectString(delimiter: ", ")
                sb.append(l)
                sb.append(")")
                sb.toString()
            case t: StructTypeInfo =>
                let sb = StringBuilder()
                sb.append("${t.qualifiedName}(")
                let l = t.instanceVariables |> map {
                    i =>
                        let value = i.getValue(a)
                        "${i.name}=${toString(value)}"
                } |> collectString(delimiter: ", ")
                sb.append(l)
                sb.append(")")
                sb.toString()
            case t: EnumTypeInfo =>
                let (eCons, l) = t.destruct(a)
                let p = l |> map {i: Any => toString(i)} |> collectString(delimiter: ", ")
                "${t.qualifiedName}.${eCons.name}(${p})"
            case _ => throw Exception("toString() not implemented.")
        }
    }
}

// ── 参数类型名内容断言（FunctionTypeInfo.parameters）
// FunctionTypeInfo.parameters 返回 ReadOnlyList<TypeInfo>，元素是 TypeInfo。
// 断言：逐个元素按【声明顺序】比对 TypeInfo.name（形参类型名）。
@CustomAssertion
public func paramTypeNames(ctx: AssertionCtx, actual_: Collection<TypeInfo>, expected: Array<String>): Collection<TypeInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of parameter types do not match: ${actual.size} != ${expected.size}:
 left: ${toString(actual)}
right: ${toString(expected)}
""")
    }
    for (i in 0..actual.size) {
        let el = actual[i]
        let elName = el.name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} parameter type name mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

// ── 注解内容断言（annotations 集合）
// 比对注解身份（qualifiedName）+ 个数，而非仅 size。
@CustomAssertion
public func annotations(ctx: AssertionCtx, actual_: Collection<Annotation>, expected: Array<Annotation>): Collection<Annotation> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of annotations do not match: ${actual.size} != ${expected.size}:
 left: ${toString(actual)}
right: ${toString(expected)}
""")
    }
    for (i in 0..actual.size) {
        let a = actual[i]
        let b = expected[i]
        let result = checkEquality(a, b)
        if (!result) {
            ctx.fail(
                """
#${i} pair of annotations do not match: ${toString(a)} != ${toString(b)}:
 left: ${toString(actual)}
right: ${toString(expected)}
""")
        }
    }
    actual
}

// ── 注解数组内容断言（findAllAnnotations<T>() 返回 Array<T>）
// expected 是注解类名列表（Array<String>），逐一比对 actual 元素的 TypeInfo.name。
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

// ── modifiers 内容断言：不包含指定修饰符（open/abstract/sealed）
// 期望集合 = 不包含传入的任一修饰符名（元素是 ModifierInfo，比对 name）。
@CustomAssertion
public func notContainsModifiers(ctx: AssertionCtx, actual_: Collection<ModifierInfo>, expected: Array<String>): Collection<ModifierInfo> {
    let actual = actual_.toArray()
    for (i in 0..actual.size) {
        let elName = actual[i].toString()
        for (j in 0..expected.size) {
            if (elName == expected[j]) {
                ctx.fail(
                    """
modifier ${elName} should NOT be present in ${toString(actual)}
""")
            }
        }
    }
    actual
}

// ── superInterfaces 内容断言：集合包含指定名称的接口
// 期望 = 单个接口名（如 "Any"），断言集合中存在该名的接口。
@CustomAssertion
public func containsIfaceName(ctx: AssertionCtx, actual_: Collection<InterfaceTypeInfo>, expected: String): Collection<InterfaceTypeInfo> {
    let actual = actual_.toArray()
    for (i in 0..actual.size) {
        if (actual[i].name == expected) {
            return actual
        }
    }
    ctx.fail(
        """
superInterfaces does NOT contain iface ${expected}: ${toString(actual)}
""")
    actual
}

// ── Any 值深比较（apply 返回的 Any，或 getValue 返回值）──
@CustomAssertion
public func anyValue(ctx: AssertionCtx, actual: Any, expected: Any): Any {
    let result = checkEquality(actual, expected)
    if (!result) {
        ctx.fail(
            """
anyValue do not match:
 left: ${toString(actual)}
right: ${toString(expected)}
""")
    }
    actual
}
