// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
// ASSERT: scan cannot assign to immutable variable 'a'
// ASSERT: 'common' let field 'a' cannot be assigned in constructor
package cmp

common class A {
    common let a: Int64
    init() {
        a = 0
    }
}

