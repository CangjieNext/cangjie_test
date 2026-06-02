// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c/c.cj --output-type=chir -Woff unused --output-dir ./c 2>&1 | compare %f
// ASSERT: scan parse_expected_no_modifier
// ASSERT: scan parse_expected_parameter_rp
package cmp
common struct C{
    public func foo(common let a:Int32):Int32 {}
    init() {}
}

