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

// ── 通用 Any 深比较辅助（反射 toString）──
public func tupleToString(a: Any): String {
    match (a) {
        case l: ReadOnlyList<Any> =>
            let ll = l |> map {i: Any => tupleToString(i)} |> collectString(delimiter: ", ")
            "[${ll}]"
        case s: ToString => s.toString()
        // 元组元素：递归经 TupleTypeInfo.destruct
        case o => match (TypeInfo.of(o)) {
            case t: TupleTypeInfo =>
                let s = t.destruct(o)
                let ss = s |> map {i: Any => tupleToString(i)} |> collectString(delimiter: ", ")
                "(${ss})"
            case t: ClassTypeInfo =>
                let sb = StringBuilder()
                sb.append("${t.qualifiedName}(")
                let l = t.instanceVariables |> map {
                    i => let value = tupleToString(i.getValue(a))
                    "${i.name}=${value}"
                } |> collectString(delimiter: ", ")
                sb.append(l)
                sb.append(")")
                sb.toString()
            case t: StructTypeInfo =>
                let sb = StringBuilder()
                sb.append("${t.qualifiedName}(")
                let l = t.instanceVariables |> map {
                    i => let value = tupleToString(i.getValue(a))
                    "${i.name}=${value}"
                } |> collectString(delimiter: ", ")
                sb.append(l)
                sb.append(")")
                sb.toString()
            case t: EnumTypeInfo =>
                let (eCons, l) = t.destruct(a)
                let p = l |> map {i: Any => tupleToString(i)} |> collectString(delimiter: ", ")
                "${t.qualifiedName}.${eCons.name}(${p})"
            case _ => throw Exception("tupleToString() not implemented.")
        }
    }
}

// Any 深比较：类型名一致 + 反射 toString 一致
public func tupleCheckEquality(a: Any, b: Any): Bool {
    let aTypeInfo = TypeInfo.of(a)
    let bTypeInfo = TypeInfo.of(b)
    if (aTypeInfo.qualifiedName != bTypeInfo.qualifiedName) {
        return false
    }
    tupleToString(a) == tupleToString(b)
}

// ── elements 内容断言：Collection<TypeInfo>，逐一断言 name ──
@CustomAssertion
public func tupleElements(ctx: AssertionCtx, actual_: Collection<TypeInfo>, expected: Array<String>): Collection<TypeInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            "number of elements do not match: ${actual.size} != ${expected.size}")
    }
    for (i in 0..actual.size) {
        let el = actual[i]
        let elName = el.name
        if (elName != expected[i]) {
            ctx.fail(
                "#${i} element type mismatch: actual ${elName} != expected ${expected[i]}")
        }
    }
    actual_
}

// ── destruct 返回值内容断言：ReadOnlyList<Any>，逐元素深比较 ──
@CustomAssertion
public func tupleElementsList(ctx: AssertionCtx, actual_: ReadOnlyList<Any>, expected: Array<Any>): ReadOnlyList<Any> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            "number of destructed elements do not match: ${actual.size} != ${expected.size}")
    }
    for (i in 0..actual.size) {
        let a = actual[i]
        let b = expected[i]
        if (!tupleCheckEquality(a, b)) {
            ctx.fail(
                "#${i} destructed element mismatch: ${tupleToString(a)} != ${tupleToString(b)}")
        }
    }
    actual_
}

// ── superInterfaces 内容断言：包含名为 Any 的接口 ──
@CustomAssertion
public func tupleSuperInterfacesHasAny(ctx: AssertionCtx, actual_: Collection<InterfaceTypeInfo>, expected: Array<String>): Collection<InterfaceTypeInfo> {
    let actual = actual_.toArray()
    for (expName in expected) {
        var found = false
        for (s in actual) {
            if (s.name == expName) {
                found = true
                break
            }
        }
        if (!found) {
            ctx.fail(
                "expected super interface ${expName} not found in ${actual_.size} interfaces")
        }
    }
    actual_
}

// ── Any 值深比较（construct 返回的 Any）──
@CustomAssertion
public func anyValue(ctx: AssertionCtx, actual: Any, expected: Any): Any {
    if (!tupleCheckEquality(actual, expected)) {
        ctx.fail(
            "anyValue do not match:\n left: ${tupleToString(actual)}\nright: ${tupleToString(expected)}")
    }
    actual
}

// ── 空集合断言：Collection<T> 空集（instanceFunctions/staticFunctions/...）──
// design 层族 5 用 customAssertion=emptyCollection + customExpected=[]。
// 泛型签名接受任意元素类型的集合（元组无成员 → 恒为空）。
@CustomAssertion
public func emptyCollection<T>(ctx: AssertionCtx, actual_: Collection<T>, expected: Collection<Any>): Collection<T> {
    if (actual_.size != 0) {
        ctx.fail(
            "expected empty collection but got ${actual_.size} elements")
    }
    actual_
}

// ── 空成员查询数组断言：Array<T> 空数组（getInstanceFunctions/getStaticFunctions）──
// design 层 rule 用 customAssertion=strArrayContent + customExpected=[]。
// 泛型签名接受任意元素类型的数组（元组无成员 → 恒为空）。
@CustomAssertion
public func strArrayContent<T>(ctx: AssertionCtx, actual_: Array<T>, expected: Array<Any>): Array<T> {
    if (actual_.size != 0) {
        ctx.fail(
            "expected empty array but got ${actual_.size} elements")
    }
    actual_
}
