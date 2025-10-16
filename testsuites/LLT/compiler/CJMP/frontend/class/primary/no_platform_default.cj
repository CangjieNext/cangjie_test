// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

import std.random.*

public common class A {
    public common A(let a: Int64, let b: Random, let c!: Array<Int64> = [42]) {
        println("[common] A.A(${a}, ${b.nextInt64() * 0 + 42}, ${c[0]})")
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan parse_platform_function_parameter_cannot_have_default_value
package cmp

import std.random.*

public platform class A {
    public platform A(let a: Int64, let b: Random, let c!: Array<Int64> = [54]) {
        println("[platform] A.A(${this.a}, ${b.nextInt64() * 0 + 42}, ${c[0]})")
    }
}

