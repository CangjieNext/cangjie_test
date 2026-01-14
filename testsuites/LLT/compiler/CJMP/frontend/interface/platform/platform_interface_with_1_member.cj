// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public common interface I0 {
    func foo(): Unit
}

class A <: I0 {
    public func foo(): Unit {
        println("foo in A of common")
    }
    public func goo(): Unit {
        println("goo in A of common")
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 2>&1 | compare %f
// ASSERT: scan parse_specific_member_must_have_implementation
package cmp

public specific interface I0 {
    func goo(): Unit
}


main() {
    let a = A()
    a.foo()
    a.goo()
}

