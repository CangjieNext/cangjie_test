// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
    public common let a: Int64
    public A() {
        a = 99
    }
}

public common class B {
    public common let b: Int64
    public init(v: Int64) {
        b = v
    }
}
// ASSERT: scan cannot assign to immutable variable 'a'
// ASSERT: scan 'common' let field 'a' cannot be assigned in constructor
// ASSERT: cannot assign to immutable variable 'b'
// ASSERT: scan 'common' let field 'b' cannot be assigned in constructor
