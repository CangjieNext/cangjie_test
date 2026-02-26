// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common let X1: Int64 = 1
public common let X2: Int64 = X1

public let (Y1, Y2): (Int64, Int64) = (X1 + 1, X2 + 2)

public common let Z1: Int64 = X1
public common let Z2: Int64 = Y2

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public specific let (X1, X2): (Int64, Int64) = (10, 20)
public specific let (Z1, Z2): (Int64, Int64) = (X1, X2)

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
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
10
20
11
22
10
20
*/
