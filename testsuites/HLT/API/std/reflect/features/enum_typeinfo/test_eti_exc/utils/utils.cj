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
    // 列表类（ReadOnlyList/Array/ArrayList）逐元素深比较：运行时集合的
    // TypeInfo.qualifiedName 因实现类型不同而互异（ArrayList<Any> vs
    // Array<Any> 字面量），不能按 qualifiedName 短路。
    // Cangjie 元组 match 不可靠 → 用 is 分别判别再互比。
    if ((a is ReadOnlyList<Any>) && (b is ReadOnlyList<Any>)) {
        let la = (a as ReadOnlyList<Any>).getOrThrow()
        let lb = (b as ReadOnlyList<Any>).getOrThrow()
        if (la.size != lb.size) { return false }
        for (i in 0..la.size) {
            if (!checkEquality(la[i], lb[i])) { return false }
        }
        return true
    }
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

// ── 构造器名内容断言（EnumTypeInfo.constructors）
// 断言：逐个元素按【声明顺序】比对 EnumConstructorInfo.name。
@CustomAssertion
public func enumCtorNames(ctx: AssertionCtx, actual_: Collection<EnumConstructorInfo>, expected: Array<String>): Collection<EnumConstructorInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of enum constructors do not match: ${actual.size} != ${expected.size}:
 left: ${toString(actual)}
right: ${toString(expected)}
""")
    }
    for (i in 0..actual.size) {
        let elName = actual[i].name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} enum constructor name mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

// ── 参数类型名内容断言（EnumConstructorInfo.parameters / FunctionTypeInfo.parameters）
// parameters 返回 ReadOnlyList<TypeInfo>，元素是 TypeInfo。
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

// ── superInterfaces 内容断言：集合包含所有指定名称的接口（I + Any）
@CustomAssertion
public func containsIfaceNames(ctx: AssertionCtx, actual_: Collection<InterfaceTypeInfo>, expected: Array<String>): Collection<InterfaceTypeInfo> {
    let actual = actual_.toArray()
    for (j in 0..expected.size) {
        var found = false
        for (i in 0..actual.size) {
            if (actual[i].name == expected[j]) {
                found = true
                break
            }
        }
        if (!found) {
            ctx.fail(
                """
superInterfaces does NOT contain iface ${expected[j]}: ${toString(actual)}
""")
        }
    }
    actual
}

// ── 成员函数名内容断言（instanceFunctions/staticFunctions）
// 断言：逐个元素比对 InstanceFunctionInfo/StaticFunctionInfo 的 name。
// 两种成员类型共用断言名不行（@CustomAssertion 按参数类型分派）→ 各定义一份。
@CustomAssertion
public func funcNames(ctx: AssertionCtx, actual_: Collection<InstanceFunctionInfo>, expected: Array<String>): Collection<InstanceFunctionInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of instance functions do not match: ${actual.size} != ${expected.size}:
 left: ${toString(actual)}
right: ${toString(expected)}
""")
    }
    for (i in 0..actual.size) {
        let elName = actual[i].name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} instance function name mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

@CustomAssertion
public func funcNames(ctx: AssertionCtx, actual_: Collection<StaticFunctionInfo>, expected: Array<String>): Collection<StaticFunctionInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of static functions do not match: ${actual.size} != ${expected.size}
""")
    }
    for (i in 0..actual.size) {
        let elName = actual[i].name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} static function name mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

// ── 成员属性名内容断言（instanceProperties/staticProperties）
@CustomAssertion
public func propNames(ctx: AssertionCtx, actual_: Collection<InstancePropertyInfo>, expected: Array<String>): Collection<InstancePropertyInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of instance properties do not match: ${actual.size} != ${expected.size}
""")
    }
    for (i in 0..actual.size) {
        let elName = actual[i].name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} instance property name mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

@CustomAssertion
public func propNames(ctx: AssertionCtx, actual_: Collection<StaticPropertyInfo>, expected: Array<String>): Collection<StaticPropertyInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of static properties do not match: ${actual.size} != ${expected.size}
""")
    }
    for (i in 0..actual.size) {
        let elName = actual[i].name
        if (elName != expected[i]) {
            ctx.fail(
                """
#${i} static property name mismatch: actual ${elName} != expected ${expected[i]}
""")
        }
    }
    actual
}

// ── Any 值深比较（apply/destruct/getAssociatedValues 返回的 Any）──
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
