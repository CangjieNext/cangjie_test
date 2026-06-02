// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: a common class without explicit constructors and has instance is error
// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan parse_cjmp_outdecl_miss_match
// ASSERT: scan-2 parse_illegal_modifier_in_scope
package cmp
struct C{
    public common func foo():Unit{
        common func goo():Unit{}
        goo()
    }
    public func foo2():Unit{
        common var a:Int32=1
    }
    public init() {}
}

