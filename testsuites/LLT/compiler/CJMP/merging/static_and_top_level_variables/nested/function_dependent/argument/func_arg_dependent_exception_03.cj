// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c1.cj
package cmp

public func get(arg: Int64): Int64 {
    return arg
}

public common let X: Int64 = 1

// SEPARATE-FILE: c/c2.cj
// EXEC-0: %compiler %noColor --experimental c/c1.cj c/c2.cj --output-type=chir --output-dir ./c
package cmp

public common let Y: Int64 = 1

// SEPARATE-FILE: p/p1.cj
package cmp

public specific let Y: Int64 = get(X)

// SEPARATE-FILE: p/p2.cj
// EXEC-PIPE-1: %compiler %diag_json --experimental p/p1.cj p/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
// ASSERT: scan sema_used_before_initialization
package cmp

public specific let X: Int64 = get(Y)

