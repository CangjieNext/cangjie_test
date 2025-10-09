// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// case: common with const and foreign should be conflicted
// EXEC-PIPE-1: %compiler %diag_json --experimental %f --output-type=chir 2>&1 | compare %f
// ASSERT: scan-3 parse_cjmp_pattern_decl

package cmp

public common let (X1, X2): (Int64, Int64) = (2, 2)

public common let _ = 1

enum E{
    A(Int64)
}
public common let A(a) = A(1)

