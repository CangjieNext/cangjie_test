// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common let Y1: Int64 = 1
public common let Y2: Int64 = 2
public let (X1, X2): (Int64, Int64) = (Y1 + 1, Y2 + 1)

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public let (Z1, Z2): (Int64, Int64) = (Y1 + X1, Y2 + X2)

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(X1)
    println(X2)
    println(Y1)
    println(Y2)
}

/* SCAN
2
3
1
2
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(X1)
    println(X2)
    println(Y1)
    println(Y2)
    println(Z1)
    println(Z2)
}

/* SCAN
2
3
1
2
3
5
*/
