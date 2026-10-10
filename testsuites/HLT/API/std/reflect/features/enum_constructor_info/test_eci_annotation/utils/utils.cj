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

// ── 通用 Any 深比较辅助 ──
public func checkEquality(a: Any, b: Any): Bool {
    let aTypeInfo = TypeInfo.of(a)
    let bTypeInfo = TypeInfo.of(b)
    if (aTypeInfo.qualifiedName != bTypeInfo.qualifiedName) {
        return false
    }
    eciToString(a) == eciToString(b)
}

public func eciToString(a: Any): String {
    match (a) {
        case l: ReadOnlyList<Any> =>
            let ll = l |> map {i: Any => eciToString(i)} |> collectString(delimiter: ", ")
            "[${ll}]"
        case l: Array<Any> =>
            let ll = l |> map {i: Any => eciToString(i)} |> collectString(delimiter: ", ")
            "[${ll}]"
        case o => match (TypeInfo.of(o)) {
            // 闭包/函数值：静态 Any 不匹配 ToString 运行时类型测试（cjc 实测），
            // 以 FunctionTypeInfo.qualifiedName 表达（同类型闭包值以类型签名等价性断言）
            case t: FunctionTypeInfo => t.qualifiedName
            case t: TupleTypeInfo =>
                let s = t.destruct(o)
                let ss = s |> map {i: Any => eciToString(i)} |> collectString(delimiter: ", ")
                "(${ss})"
            case t: EnumTypeInfo =>
                let (eCons, l) = t.destruct(o)
                let p = l |> map {i: Any => eciToString(i)} |> collectString(delimiter: ", ")
                "${t.qualifiedName}.${eCons.name}(${p})"
            case t: StructTypeInfo =>
                let sb = StringBuilder()
                sb.append("${t.qualifiedName}(")
                let l = t.instanceVariables |> map {
                    i =>
                        let value = i.getValue(a)
                        "${i.name}=${eciToString(value)}"
                } |> collectString(delimiter: ", ")
                sb.append(l)
                sb.append(")")
                sb.toString()
            case t: ClassTypeInfo =>
                let sb = StringBuilder()
                sb.append("${t.qualifiedName}(")
                let l = t.instanceVariables |> map {
                    i =>
                        let value = i.getValue(a)
                        "${i.name}=${eciToString(value)}"
                } |> collectString(delimiter: ", ")
                sb.append(l)
                sb.append(")")
                sb.toString()
            // 其余实现 ToString 的类型（Int64/String/Bool/...）：直接 toString
            case t => t.toString()
        }
    }
}

// ── 注解内容断言：比对身份（qualifiedName）+ 个数，而非仅 size ──
@CustomAssertion
public func annotations(ctx: AssertionCtx, actual_: Collection<Annotation>, expected: Array<Annotation>): Collection<Annotation> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of annotations do not match: ${actual.size} != ${expected.size}:
 left: ${eciToString(actual)}
right: ${eciToString(expected)}
""")
    }
    for (i in 0..actual.size) {
        let a = actual[i]
        let b = expected[i]
        let result = checkEquality(a, b)
        if (!result) {
            ctx.fail(
                """
#${i} pair of annotations do not match: ${eciToString(a)} != ${eciToString(b)}
""")
        }
    }
    actual
}

// ── 注解数组内容断言（泛型 T<:Annotation）：适用于 findAllAnnotations<T>()，
//    expected 是注解类名列表（Array<String>），逐一比对 actual 元素的 TypeInfo.name ──
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

// ── 参数类型列表内容断言：逐一断言 TypeInfo 的名称（按声明顺序）──
// EnumConstructorInfo.parameters 是 ReadOnlyList<TypeInfo>（与 ConstructorInfo 的
// ParameterInfo 不同，此处无顺序问题——文档承诺"按声明顺序返回"）。
// 元素名：基础类型 = 简单名；用户类型 = 简单名；元组/函数 = "Tuple<...>"/"Closure<...>"。
@CustomAssertion
public func parameterTypeNames(ctx: AssertionCtx, actual_: ReadOnlyList<TypeInfo>, expected: Array<String>): ReadOnlyList<TypeInfo> {
    let actual = actual_
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of parameter types do not match: ${actual.size} != ${expected.size}
""")
    }
    for (i in 0..actual.size) {
        let el = actual[i]
        let elName = el.name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} parameter type mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

// ── Any 值深比较（apply / getAssociatedValues 返回的 Any）──
@CustomAssertion
public func anyValue(ctx: AssertionCtx, actual: Any, expected: Any): Any {
    let result = checkEquality(actual, expected)
    if (!result) {
        ctx.fail(
            """
anyValue do not match:
 left: ${eciToString(actual)}
right: ${eciToString(expected)}
""")
    }
    actual
}

// ── Any 列表逐元素深比较（getAssociatedValues 的 ReadOnlyList<Any>）──
@CustomAssertion
public func anyList(ctx: AssertionCtx, actual_: ReadOnlyList<Any>, expected: Array<Any>): ReadOnlyList<Any> {
    let actual = actual_
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of associated values do not match: ${actual.size} != ${expected.size}:
 left: ${eciToString(actual)}
right: ${eciToString(expected)}
""")
    }
    for (i in 0..actual.size) {
        let a = actual[i]
        let b = expected[i]
        let result = checkEquality(a, b)
        if (!result) {
            ctx.fail(
                """
#${i} associated value do not match: ${eciToString(a)} != ${eciToString(b)}
""")
        }
    }
    actual
}
