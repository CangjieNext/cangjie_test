// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %local %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func ifExternal(a: String @local!, c: Bool): String @local! {
    if (c) { "x" } else { a }
}

func ifInternal(c: Bool) {
    let x: String @local! = if (c) { "x" } else { "y" }
}

func matchExternal(a: String @local!, n: Int64): String @local! {
    match (n) {
        case 0 => "x"
        case _ => a
    }
}

func matchInternal(n: Int64) {
    let x: String @local! = match (n) {
        case 0 => "x"
        case _ => "y"
    }
}

func tryExternal(a: String @local!): String @local! {
    try { "x" } catch (_: Exception) { a }
}

func tryInternal() {
    let x: String @local! = try { "x" } catch (_: Exception) { "y" }
}

func tryFinallyExternal(a: String @local!, c: Bool) {
    let x: String @local! = try { "x" } catch (_: Exception) { "y" } finally {
        if (c) { a } else { a }
    }
}

func arrayExternal(a: String @local!): Array<String> @local! {
    [a]
}

func arrayInternal() {
    let x: Array<String> @local! = ["x", "y"]
}

func tupleExternal(a: String @local!): (String, String) @local! {
    (a, "x")
}

func tupleInternal() {
    let x: (String, String) @local! = ("x", "y")
}

main() {}
