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

// ── 解析结果内容断言（parseParameterTypes 返回的 Array<TypeInfo>）──
// 断言：逐元素按【出现顺序】比对 TypeInfo.toString()（内部实现为限定名称
// 字符串，TypeInfo 继承面）与期望类型名列表；同时断言元素个数。
// 期望名是简单名（如 "Int64"/"PptBox"）时，toString 输出对内置类型为
// 简单名、对 default 包类型为 "default.<名>"，故按"后缀匹配"比对：
// 元素 toString 等于期望名或以 "." + 期望名结尾均视为匹配（同一类型的
// 简单名唯一，不会误配；顺序与个数仍强约束）。
@CustomAssertion
public func typeInfoQualifiedNames(ctx: AssertionCtx, actual_: Array<TypeInfo>, expected: Array<String>): Array<TypeInfo> {
    let actual = actual_
    if (actual.size != expected.size) {
        ctx.fail(
            """
number of parsed types do not match: ${actual.size} != ${expected.size}:
 left: ${typeInfosToString(actual)}
right: ${expected}
""")
    }
    for (i in 0..actual.size) {
        let el = actual[i]
        let elName = el.toString()
        let exp = expected[i]
        if (elName != exp && !elName.endsWith(".${exp}")) {
            ctx.fail(
                """
#${i} parsed type mismatch: actual ${elName} != expected ${exp}
""")
        }
    }
    actual
}

// 辅助：TypeInfo 数组 → 字符串（失败信息用）
public func typeInfosToString(arr: Array<TypeInfo>): String {
    let sb = StringBuilder()
    sb.append("[")
    for ((i, t) in arr |> enumerate) {
        if (i > 0) {
            sb.append(", ")
        }
        sb.append(t.toString())
    }
    sb.append("]")
    sb.toString()
}
