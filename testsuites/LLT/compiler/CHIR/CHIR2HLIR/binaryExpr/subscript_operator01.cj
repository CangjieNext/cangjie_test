// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f
internal import std.collection.*

func foo(table: ArrayList<Int64>) {
    var x = 0
    var y = 1
    if (x < table.get[y]) {}
}
// ASSERT: scan sema_invalid_subscript_expr
// ASSERT: scan sema_missing_entry
