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

@CustomAssertion
public func annotations(ctx: AssertionCtx, actual_: Collection<Annotation>, expected: Array<Annotation>): Collection<Annotation> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of annotations do not match: ${actual.size} != ${expected.size}:
 left: ${toString(actual)}
right: ${toString(
                expected)}
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
right: ${toString(
                    expected)}
""")
        }
    }
    actual
}

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
        // 对于基础数据类型和内置了ToString实现的类型则直接采用内置toString
        case s: ToString => s.toString()
        // 否则通过反射自动生成toSting结果
        case o => match (TypeInfo.of(o)) {
            case t: TupleTypeInfo =>
                let s = t.destruct(o)
                let ss = s |> map {i: Any => toString(i)} |> collectString(delimiter: ", ")
                "(${ss})"
            case t: FunctionTypeInfo =>
                let s = t.parameters |> map {t: TypeInfo => t.qualifiedName} |> collectString(delimiter: ", ")
                let s1 = t.returnType.qualifiedName
                "(${s})->${s1}"
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

@CustomAssertion
public func readOnlyList(ctx: AssertionCtx, actual: ReadOnlyList<Any>, expected: Array<Any>): ReadOnlyList<Any> {
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of elements do not match: ${actual.size} != ${expected.size}:
 left: ${toString(actual)}
right: ${toString(
                expected)}
""")
    }
    for (i in 0..actual.size) {
        let a = actual[i]
        let b = expected[i]
        let result = checkEquality(a, b)
        if (!result) {
            ctx.fail(
                """
#${i} pair of elements do not match: ${toString(a)} != ${toString(b)}:
 left: ${toString(actual)}
right: ${toString(
                    expected)}
""")
        }
    }
    actual
}

@CustomAssertion
public func interfaceTypeInfoList(ctx: AssertionCtx, actual: Array<InterfaceTypeInfo>, expected: Array<String>): Array<InterfaceTypeInfo> {
    let leftList = actual |> map {i => i.qualifiedName} |> collectString(delimiter: ", ")
    let rightList = expected |> collectString(delimiter: ", ")
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of elements do not match: ${actual.size} != ${expected.size}:
 left: ${leftList}
right: ${rightList}
""")
    }
    for (i in 0..actual.size) {
        let a = actual[i]
        let b = expected[i]
        let result = a.qualifiedName == b
        if (!result) {
            ctx.fail(
                """
#${i} pair of elements do not match: ${a.qualifiedName} != ${b}:
 left: ${leftList}
right: ${rightList}
""")
        }
    }
    actual
}

@CustomAssertion
public func anyValue(ctx: AssertionCtx, actual: Any, expected: Any): Any {
    let a = actual
    let b = expected
    let result = checkEquality(a, b)
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
public func enumConstructors(ctx: AssertionCtx, actual_: Collection<EnumConstructorInfo>,
    expected: Array<EnumConstructor>): Collection<EnumConstructorInfo> {
    let actual = actual_.toArray()
    if (actual.size != expected.size) {
        ctx.fail("number of constructors does not match: actual ${actual.size} != expected ${expected.size}")
    }
    for (i in 0..actual.size) {
        let a = actual[i]
        let b = expected[i]
        // 检查annotations
        // 检查enumTypeInfo
        // 检查name
        if (a.name != b.name) {
            ctx.fail("""
#${i} enum constructor name check failed:
  actual: ${a.name}
expected: ${b.name}
""")
        }

        // 检查qualifiedName
        if (a.qualifiedName != b.qualifiedName) {
            ctx.fail(
                """
#${i} enum constructor's qualifiedName check failed:
  actual: ${a.qualifiedName}
expected: ${b
                    .qualifiedName}
""")
        }
        let aList = a.parameters |> map {t: TypeInfo => t.qualifiedName} |> collectString(delimiter: ", ")
        let bList = b.parameters |> collectString(delimiter: ", ")
        // 检查parameters
        if (a.parameters.size != b.parameters.size) {
            ctx.fail(
                """
#${i} enum constructor ${a.qualifiedName}'s parameters' size check failed:
  actual: ${aList}
expected: ${bList}
""")
        }
        for (j in 0..a.parameters.size) {
            let aa = a.parameters[j]
            let bb = b.parameters[j]
            if (aa.qualifiedName != bb) {
                ctx.fail(
                    """
#${i} enum constructor ${a.qualifiedName}'s parameters check failed:
  actual: ${aList}
expected: ${bList}
""")
            }
        }
    }
    actual
}

@CustomAssertion
public func enumConstructor(ctx: AssertionCtx, actual: EnumConstructorInfo, expected: EnumConstructor): EnumConstructorInfo {
    // 检查annotations
    // 检查enumTypeInfo
    // 检查name
    if (actual.name != expected.name) {
        ctx.fail("""
enum constructor name check failed:
  actual: ${actual.name}
expected: ${expected.name}
""")
    }

    // 检查qualifiedName
    if (actual.qualifiedName != expected.qualifiedName) {
        ctx.fail(
            """
enum constructor's qualifiedName check failed:
  actual: ${actual.qualifiedName}
expected: ${expected
                .qualifiedName}
""")
    }
    let aList = actual.parameters |> map {t: TypeInfo => t.qualifiedName} |> collectString(delimiter: ", ")
    let bList = expected.parameters |> collectString(delimiter: ", ")
    // 检查parameters
    if (actual.parameters.size != expected.parameters.size) {
        ctx.fail(
            """
enum constructor ${actual.qualifiedName}'s parameters' size check failed:
  actual: ${aList}
expected: ${bList}
""")
    }
    for (j in 0..actual.parameters.size) {
        let aa = actual.parameters[j]
        let bb = expected.parameters[j]
        if (aa.qualifiedName != bb) {
            ctx.fail(
                """
enum constructor ${actual.qualifiedName}'s parameters check failed:
  actual: ${aList}
expected: ${bList}
""")
        }
    }
    actual
}

public class EnumConstructor {
    public EnumConstructor(public let qualifiedName!: String, public let name!: String,
        public let parameters!: Array<String> = []) {}
}

public func collectSortedArray<T>(l: Collection<T>): Array<T> where T <: TypeInfo {
    let tmp = l |> collectArray
    sort(tmp, by: {a: T, b: T => a.qualifiedName.compare(b.qualifiedName)})
    tmp
}
