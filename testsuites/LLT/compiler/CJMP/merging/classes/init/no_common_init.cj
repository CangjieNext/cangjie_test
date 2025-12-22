// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
// ASSERT: scan at least one constructor is required in common class 'A'
package cmp

public common class A {}
