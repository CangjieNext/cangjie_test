// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan parse_illegal_modifier_in_scope

package cmp

import std.random.*

public common class A {
    public common A(common let a: Int64, common let b: Random, common let c: Array<Int64>) {
        println("[common] A.A(${a}, ${b.nextInt64() * 0 + 42}, ${c[0]})")
    }
}
