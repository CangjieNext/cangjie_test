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

// 反射深度比较
public func checkEquality(a: Any, b: Any): Bool {
    toString(a) == toString(b)
}

// 通用 toString（含 Class/Struct/Enum/Tuple 的反射展开）
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
                        let value = i.getValue(o)
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
                        let value = i.getValue(o)
                        "${i.name}=${toString(value)}"
                } |> collectString(delimiter: ", ")
                sb.append(l)
                sb.append(")")
                sb.toString()
            case t: EnumTypeInfo =>
                let (eCons, l) = t.destruct(o)
                let p = l |> map {i: Any => toString(i)} |> collectString(delimiter: ", ")
                "${t.qualifiedName}.${eCons.name}(${p})"
            case _ => throw Exception("toString() not implemented.")
        }
    }
}

@CustomAssertion
public func anyValue(ctx: AssertionCtx, actual: Any, expected: Any): Any {
    let result = checkEquality(actual, expected)
    if (!result) {
        ctx.fail("""
elements do not match:
 left: ${toString(actual)}
right: ${toString(expected)}
""")
    }
    actual
}

@CustomAssertion
public func classTypeInfoList(ctx: AssertionCtx, actual_: Collection<ClassTypeInfo>,
    expected: Array<String>): Collection<ClassTypeInfo> {
    let actual = actual_.toArray()
    let leftList = actual |> map {i => i.qualifiedName} |> collectString(delimiter: ", ")
    let rightList = expected |> collectString(delimiter: ", ")
    if (actual.size != expected.size) {
        ctx.fail("""
number of elements do not match: ${actual.size} != ${expected.size}:
 left: ${leftList}
right: ${rightList}
""")
    }
    for (i in 0..actual.size) {
        let a = actual[i]
        let b = expected[i]
        if (a.qualifiedName != b) {
            ctx.fail("""
#${i} pair of elements do not match: ${a.qualifiedName} != ${b}:
 left: ${leftList}
right: ${rightList}
""")
        }
    }
    actual
}

// sealedSubclasses 无序多集比较 —— API 文档（reflect_package_classes.md:120-169）
//   只规定：sealed 类"返回所在包内所有子类，必非空且含自身"，未规定顺序。
//   故按无序多集校验（成员相同即通过，不依赖遍历顺序），避免把 SDK 的返回顺序
//   当作断言基准。
@CustomAssertion
public func sealedSubList(ctx: AssertionCtx, actual_: Collection<ClassTypeInfo>,
    expected: Array<String>): Collection<ClassTypeInfo> {
    let actual = actual_.toArray()
    let leftList = actual |> map {i => i.qualifiedName} |> collectString(delimiter: ", ")
    let rightList = expected |> collectString(delimiter: ", ")
    if (actual.size != expected.size) {
        ctx.fail("""
number of elements do not match: ${actual.size} != ${expected.size}:
 left: ${leftList}
right: ${rightList}
""")
    }
    // 无序多集相等：expected 中每个元素都出现在 actual 中（数量上已保证相等）
    for (b in expected) {
        var found = false
        for (a in actual) {
            if (a.qualifiedName == b) {
                found = true
                break
            }
        }
        if (!found) {
            ctx.fail("""
expected element missing from sealedSubclasses: ${b}
 left: ${leftList}
right: ${rightList}
""")
        }
    }
    actual
}
