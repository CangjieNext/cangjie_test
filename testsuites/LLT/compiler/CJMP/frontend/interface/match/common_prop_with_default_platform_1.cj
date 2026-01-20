// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common interface I0 {
    common prop foo: String {
        get() { "foo in I0 of common" }
    }
}

class A <: I0 {
    public prop foo: String {
        get() { "foo in A of common" }
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 2>&1 | compare %f
// ASSERT: scan sema_specific_member_must_have_implementation
package cmp

public specific interface I0 {
    specific prop foo: String
}

main() {
    let a = A()
    println(a.foo)
}

