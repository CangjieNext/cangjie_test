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

// ── 注解类：供 findAnnotation<Tag>() / findAllAnnotations<Tag>() 泛型实参引用 ──
// 基本类型虽不可标注注解，但规则要求"findAnnotation<T>() 返回 None / findAll 返回空数组"，
// T 需为已声明注解类型（探针已验证对任意 T 均返回 None/空）。
@Annotation
public class Tag {
    public const init() {}
}

// ── 通用 Any 深比较辅助 ──
public func checkEquality(a: Any, b: Any): Bool {
    let aTypeInfo = TypeInfo.of(a)
    let bTypeInfo = TypeInfo.of(b)
    if (aTypeInfo.qualifiedName != bTypeInfo.qualifiedName) {
        return false
    }
    toStr(a) == toStr(b)
}

public func toStr(a: Any): String {
    match (a) {
        case s: ToString => s.toString()
        case _ => TypeInfo.of(a).name
    }
}

// ── 注解内容断言：比对身份（qualifiedName）+ 个数 ──
@CustomAssertion
public func annotations(ctx: AssertionCtx, actual_: Collection<Annotation>, expected: Array<Annotation>): Collection<Annotation> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail("number of annotations do not match: ${actual.size} != ${expected.size}")
    }
    for (i in 0..actual.size) {
        if (!checkEquality(actual[i], expected[i])) {
            ctx.fail("#${i} annotation mismatch: ${toStr(actual[i])} != ${toStr(expected[i])}")
        }
    }
    actual
}

// ── 注解数组内容断言（泛型 T<:Annotation）：compare class names ──
@CustomAssertion
public func annotationsArray<T>(ctx: AssertionCtx, actual_: Array<T>, expected: Array<String>): Array<T> where T <: Annotation {
    if (actual_.size != expected.size) {
        ctx.fail("number of annotated elements do not match: ${actual_.size} != ${expected.size}")
    }
    for (i in 0..actual_.size) {
        let elName = TypeInfo.of(actual_[i]).name
        if (elName != expected[i]) {
            ctx.fail("#${i} annotation type mismatch: actual ${elName} != expected ${expected[i]}")
        }
    }
    actual_
}

// ── 数组内容断言：Array<T> 的 toString 或 name 与 Array<String> 比对 ──
@CustomAssertion
public func strArrayContent<T>(ctx: AssertionCtx, actual_: Array<T>, expected: Array<String>): Array<T> {
    if (actual_.size != expected.size) {
        ctx.fail("array size mismatch: ${actual_.size} != ${expected.size}")
    }
    for (i in 0..actual_.size) {
        let elStr = match (actual_[i]) {
            case ti: TypeInfo => ti.name
            case o => toStr(o)
        }
        if (elStr != expected[i]) {
            ctx.fail("#${i} element mismatch: ${elStr} != ${expected[i]}")
        }
    }
    actual_
}

// ── superInterfaces 含指定接口名断言 ──
@CustomAssertion
public func containsIfaceName(ctx: AssertionCtx, actual_: Collection<InterfaceTypeInfo>, expected: String): Collection<InterfaceTypeInfo> {
    let names = actual_ |> map {i => i.name} |> collectArray
    if (!names.contains(expected)) {
        let joined = names |> collectString(delimiter: ", ")
        ctx.fail("superInterfaces does not contain '${expected}': [${joined}]")
    }
    actual_
}

// ── modifiers 不含指定修饰符名断言 ──
@CustomAssertion
public func notContainsModifiers(ctx: AssertionCtx, actual_: Collection<ModifierInfo>, expected: Array<String>): Collection<ModifierInfo> {
    let names = actual_ |> map {m => m.toString()} |> collectArray
    for (e in expected) {
        if (names.contains(e)) {
            let joined = names |> collectString(delimiter: ", ")
            ctx.fail("modifiers should not contain '${e}': [${joined}]")
        }
    }
    actual_
}
