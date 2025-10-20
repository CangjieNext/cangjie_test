// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental c/c1.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
// ASSERT: scan sema_undefined_variable

package cmp

public let X: Int64 = Y
public common let Y: Int64 = X

