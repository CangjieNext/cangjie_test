// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common struct A {
    common var a: Int64 = 0
    init() {}
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 2>&1 | compare %f
// ASSERT: scan chir_class_uninitialized_field
package cmp

specific struct A {
    specific var a: Int64
    init(a_: Int64) {
        a = a_
    }
}

main() : Unit {
    println(A(2).a)
}

