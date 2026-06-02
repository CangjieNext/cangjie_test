// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan undeclared type name 'ArrayExpr'

internal import std.ast.*

main() {
    var a = quote(JArray<Int32>([0, 1, 2, 3, 4, 5]))
    var b = parseExpr(a)
    var res = match (b) {
        case x: ArrayExpr => 0
        case _ => 1
    }
    return res
}
