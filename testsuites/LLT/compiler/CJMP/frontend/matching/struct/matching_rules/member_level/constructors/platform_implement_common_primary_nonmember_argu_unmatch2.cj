// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c  2>&1 | compare %f


package cmp

public common struct A {
    common A(p!:Int32=1){}
}
// ASSERT: scan parse_illegal_modifier_in_scope
