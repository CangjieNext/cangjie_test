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
            case _ =>
                // 兜底（函数/未知复合类型等无法枚举实例）：只给 TypeInfo.name，
                // 保证 toString 永不抛异常（任何 TypeInfo 都有 name 属性）
                "<${TypeInfo.of(o).name}>"
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

// ── 注解数组内容断言（泛型 T<:Annotation）：compare class names ──
@CustomAssertion
public func annotationsArray<T>(ctx: AssertionCtx, actual_: Array<T>, expected: Array<String>) where T <: Annotation {
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
}

// ── Any 值深比较（getValue / setValue 读回）──
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
