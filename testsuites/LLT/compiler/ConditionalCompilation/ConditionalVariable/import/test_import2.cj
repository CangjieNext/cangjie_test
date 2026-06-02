// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Darwin) ERRCHECK:%compiler %cmp_opt %n.cj -o %output
// ASSERT: scan 'Table' is not accessible in package 'ast'

package b

@When[os == "macOS"]
internal import std.{ast.Position, ast.Table}

main(): Unit {
    let p: Position
    let t: Table
}
