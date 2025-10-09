// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl
package cmp


public interface I1 {
    operator func ==(i: I1) : Bool
}
public common class C1 <: I1 {
}

