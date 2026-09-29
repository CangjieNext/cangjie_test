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

// ── 成员集合元素逐位断言（弱覆盖修复，审查报告总评 #3）──
// 文档要求"遍历顺序取决于定义顺序"（reflect_package_classes.md:12223/:12275/:12323），
// 对 constructors / instanceVariables / staticVariables 逐位比较 toString。
// @CustomAssertion 宏按静态类型匹配，泛型擦除下 Array<ConstructorInfo> 无法转
// Collection<Any>，故按 Info 元素类型分别声明重载。
@CustomAssertion
public func structMemberInfoList(ctx: AssertionCtx, actual_: Collection<ConstructorInfo>,
    expected: Array<String>): Collection<ConstructorInfo> {
    checkMemberList(ctx, actual_.toArray() |> map {i => i.toString()} |> collectArray, expected)
    actual_
}

@CustomAssertion
public func structMemberInfoList(ctx: AssertionCtx, actual_: Collection<InstanceVariableInfo>,
    expected: Array<String>): Collection<InstanceVariableInfo> {
    checkMemberList(ctx, actual_.toArray() |> map {i => i.toString()} |> collectArray, expected)
    actual_
}

@CustomAssertion
public func structMemberInfoList(ctx: AssertionCtx, actual_: Collection<StaticVariableInfo>,
    expected: Array<String>): Collection<StaticVariableInfo> {
    checkMemberList(ctx, actual_.toArray() |> map {i => i.toString()} |> collectArray, expected)
    actual_
}

// 共享校验体：逐位比较 toString 与期望签名串
internal func checkMemberList(ctx: AssertionCtx, actual: Array<String>, expected: Array<String>): Unit {
    let leftList = actual |> collectString(delimiter: ", ")
    let rightList = expected |> collectString(delimiter: ", ")
    if (actual.size != expected.size) {
        ctx.fail("""
number of elements do not match: ${actual.size} != ${expected.size}:
 left: ${leftList}
right: ${rightList}
""")
    }
    for (i in 0..actual.size) {
        if (actual[i] != expected[i]) {
            ctx.fail("""
#${i} pair of elements do not match:
 left: ${leftList}
right: ${rightList}
""")
        }
    }
}
