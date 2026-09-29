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

// ── 集合元素 name 与期望名列表【集合等价】断言（顺序无关）──
// 适用于 subPackages / typeInfos / functions / variables（文档 L8058/L8097：
//   遍历顺序不保证，故按集合等价比较，不依赖顺序）。
@CustomAssertion
public func pkgNames(ctx: AssertionCtx, actual_: Collection<TypeInfo>, expected: Array<String>): Collection<TypeInfo> {
    // 占位签名不可用：Collection<PackageInfo>/GlobalFunctionInfo/GlobalVariableInfo
    // 需分别实例化，见下方各特化版本。本函数保留为 TypeInfo 形态（typeInfos 用）。
    let names = actual_ |> map {t => t.name} |> collectArray
    checkNameSet(ctx, names, expected)
    actual_
}

// typeInfos 专用（Collection<TypeInfo>）
@CustomAssertion
public func pkgTypeInfos(ctx: AssertionCtx, actual_: Collection<TypeInfo>, expected: Array<String>): Collection<TypeInfo> {
    let names = actual_ |> map {t => t.name} |> collectArray
    checkNameSet(ctx, names, expected)
    actual_
}

// subPackages 专用（Collection<PackageInfo>）
@CustomAssertion
public func pkgSubPackages(ctx: AssertionCtx, actual_: Collection<PackageInfo>, expected: Array<String>): Collection<PackageInfo> {
    let names = actual_ |> map {p => p.name} |> collectArray
    checkNameSet(ctx, names, expected)
    actual_
}

// functions 专用（Collection<GlobalFunctionInfo>）
@CustomAssertion
public func pkgFunctions(ctx: AssertionCtx, actual_: Collection<GlobalFunctionInfo>, expected: Array<String>): Collection<GlobalFunctionInfo> {
    let names = actual_ |> map {f => f.name} |> collectArray
    checkNameSet(ctx, names, expected)
    actual_
}

// variables 专用（Collection<GlobalVariableInfo>）
@CustomAssertion
public func pkgVariables(ctx: AssertionCtx, actual_: Collection<GlobalVariableInfo>, expected: Array<String>): Collection<GlobalVariableInfo> {
    let names = actual_ |> map {v => v.name} |> collectArray
    checkNameSet(ctx, names, expected)
    actual_
}

// getFunctions 专用（Array<GlobalFunctionInfo>，重载族）
@CustomAssertion
public func pkgFuncNames(ctx: AssertionCtx, actual_: Array<GlobalFunctionInfo>, expected: Array<String>): Array<GlobalFunctionInfo> {
    let names = actual_ |> map {f => f.name} |> collectArray
    checkNameSet(ctx, names, expected)
    actual_
}

// ── 集合等价比较：数量一致 + 每个期望名都出现（顺序无关）──
func checkNameSet(ctx: AssertionCtx, names: Array<String>, expected: Array<String>): Unit {
    if (names.size != expected.size) {
        let joined = names |> collectString(delimiter: ", ")
        ctx.fail("size mismatch: actual [${joined}] (${names.size}) != expected (${expected.size})")
        return
    }
    for (e in expected) {
        if (!names.contains(e)) {
            let joined = names |> collectString(delimiter: ", ")
            ctx.fail("missing element '${e}': actual [${joined}]")
        }
    }
}
