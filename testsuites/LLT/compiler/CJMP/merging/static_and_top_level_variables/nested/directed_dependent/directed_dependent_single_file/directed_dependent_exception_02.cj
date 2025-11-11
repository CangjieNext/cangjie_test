// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
// EXEC-0: %compiler %noColor --experimental c/c1.cj --output-type=chir --output-dir ./c
package cmp

public common let Y: Int64 = 1
public let X: Int64 = Y

// SEPARATE-FILE: p/p1.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan chir_file_might_circular_dependency
package cmp

public platform let Y: Int64 = X

