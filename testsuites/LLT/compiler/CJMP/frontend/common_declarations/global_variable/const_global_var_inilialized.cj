// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public const x: Int64 = 42

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=staticlib --output-dir ./p
package cmp

// SEPARATE-FILE: m/main.cj
// EXEC-0: %compiler %noColor --import-path=./p -L ./p -lcmp m/main.cj --output-dir ./m && ./m/main 2>&1 | compare %f
// ASSERT: scan-1 42
import cmp.x

main(): Unit {
    println(x)
}

 