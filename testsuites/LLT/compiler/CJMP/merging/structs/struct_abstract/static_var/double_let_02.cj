// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common struct A {
    common static let a: Int64 = 0
    static let b = a + 1
    public init() {}
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 2>&1 | compare %f
// ASSERT: scan sema_used_before_initialization
package cmp

specific struct A {
    static let c = a + b
    specific static let a: Int64 = 1
}

main() : Unit {
    println(A.c)
}

