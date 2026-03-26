// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan at least one constructor is required in common class 'A'
// ASSERT: scan c/c.cj:7:21:
// ASSERT: scan 1 error generated, 1 error printed.
package cmp

public common class A {}

func useA() {
    let a = A()
}
